#!/usr/bin/env python3
"""Concatenate the Markdown files listed in SUMMARY.md, in order, into one file.

Adapted from International-Data-Spaces-Association/IDSA-Rulebook's
.github/scripts/assemble_from_summary.py for IDS-RAM's layout: the combined
file is written back into the summary's own directory (not the repo root) so
that relative image links such as ./media/foo.png keep resolving without
rewriting.
"""

from __future__ import annotations

import argparse
import os
import re

LINK_RE = re.compile(r"\[[^\]]+\]\(([^)]+)\)")
IMAGE_RE = re.compile(r"(!\[[^\]]*\]\()([^)]+)(\))")


def collect_referenced_files(summary_path: str) -> list[str]:
    summary_dir = os.path.dirname(os.path.normpath(summary_path))
    ordered: list[str] = []
    seen: set[str] = set()

    with open(summary_path, encoding="utf-8") as f:
        for line in f:
            match = LINK_RE.search(line)
            if not match:
                continue

            link = match.group(1).split("#", 1)[0].strip()
            if link.startswith("http://") or link.startswith("https://"):
                continue
            if not (link.endswith(".md") or link.endswith(".markdown")):
                continue

            path = os.path.normpath(os.path.join(summary_dir, link))
            if path not in seen:
                seen.add(path)
                ordered.append(path)

    return ordered


def exclude_frontmatter(paths: list[str]) -> list[str]:
    """Keep FrontMatter.md out of the numbered/ToC'd body.

    SUMMARY.md lists it for the published site's nav order; for the PDF it's
    rendered separately (unnumbered, outside the Table of Contents) and
    merged in right after the cover page — see release.yml. Excluding it
    here keeps SUMMARY.md itself untouched.
    """
    return [p for p in paths if os.path.basename(p).lower() != "frontmatter.md"]


def rewrite_image_paths(content: str, source_dir: str, out_dir: str) -> str:
    """Re-relativize local image paths so they still resolve after concatenation.

    Source files in nested folders (e.g. docs/Principles/README.md) reference
    images relative to their own location (../media/foo.jpg). Once
    concatenated into one file living in a different directory (docs/), that
    relative path no longer points at the right place. Rewrite each local
    image reference to be relative to out_dir instead.
    """

    def replace(match: "re.Match[str]") -> str:
        prefix, path, suffix = match.group(1), match.group(2), match.group(3)
        if path.startswith(("http://", "https://", "data:")):
            return match.group(0)
        abs_path = os.path.normpath(os.path.join(source_dir, path))
        rel_path = os.path.relpath(abs_path, out_dir).replace(os.sep, "/")
        return f"{prefix}{rel_path}{suffix}"

    return IMAGE_RE.sub(replace, content)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--summary", required=True, help="Path to SUMMARY.md")
    parser.add_argument("--out", required=True, help="Path to write the combined Markdown file")
    parser.add_argument("--fail-on-missing", action="store_true")
    args = parser.parse_args()

    referenced = exclude_frontmatter(collect_referenced_files(args.summary))
    missing = [p for p in referenced if not os.path.exists(p)]
    if missing and args.fail_on_missing:
        raise SystemExit("Missing referenced Markdown files:\n" + "\n".join(missing))

    out_dir = os.path.dirname(os.path.normpath(args.out)) or "."

    parts: list[str] = []
    for index, path in enumerate(referenced):
        if index > 0:
            # Start each top-level document on a fresh page.
            parts.append("\\newpage\n\n")
        if not os.path.exists(path):
            parts.append(f"<!-- MISSING: {path} -->\n\n")
            continue
        with open(path, encoding="utf-8") as f:
            content = f.read().rstrip()
        content = rewrite_image_paths(content, os.path.dirname(path), out_dir)
        parts.append(content + "\n\n")

    with open(args.out, "w", encoding="utf-8") as f:
        f.write("".join(parts).strip() + "\n")

    print(f"Assembled {len(referenced)} files into {args.out}")


if __name__ == "__main__":
    main()
