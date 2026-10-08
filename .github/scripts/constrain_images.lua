-- Pandoc Lua filter for the PDF export pipeline only.
--
-- Some local source images are wider than the PDF page's text width (e.g. a
-- 836px screenshot against a ~6.3in printable width at 2.5cm margins on
-- A4), and pandoc's default LaTeX scaling (\pandocbounded) does not
-- reliably shrink them, so they bleed past the page margin with content
-- cut off. This filter reads each local image's real pixel size and DPI
-- and only caps the width (to 90% of the text width, aspect ratio kept)
-- when the image's native size actually exceeds the page. Images that
-- already fit (icons, small badges) are left untouched -- an earlier,
-- blunter version of this filter that forced width=90% on every image
-- blew up a small CC-license badge to near full-page width.
--
-- Remote images (http/https, e.g. the CC badge pulled from
-- creativecommons.org) are left untouched entirely: we have no local file
-- to measure, and every remote image in this repo is a small icon/badge,
-- not a diagram.
--
-- This only runs for the PDF export (release.yml); it is not applied to
-- the Markdown source files, so GitHub and the knowledge base keep
-- rendering images at native size.

local MAX_WIDTH_IN = 6.0 -- a bit under the ~6.3in text width (A4, 2.5cm margins), as a safety margin

local function read_file(path)
  local f = io.open(path, "rb")
  if not f then return nil end
  local data = f:read("a")
  f:close()
  return data
end

local function find_local_file(src)
  if read_file(src) then return src end
  local roots = (PANDOC_STATE and PANDOC_STATE.resource_path) or {}
  for _, root in ipairs(roots) do
    local candidate = pandoc.path.join({ tostring(root), src })
    if read_file(candidate) then return candidate end
  end
  return nil
end

-- JPEG: walk markers to the first SOFn segment for width/height, and read
-- the JFIF APP0 segment (if present) for DPI.
local function jpeg_dimensions(data)
  local len = #data
  local dpi_x, dpi_y = 96, 96
  local pos = 3 -- skip SOI (FF D8)
  while pos + 3 < len do
    if data:byte(pos) ~= 0xFF then return nil end
    local marker = data:byte(pos + 1)
    if marker == 0xD8 or marker == 0x01 or (marker >= 0xD0 and marker <= 0xD7) then
      pos = pos + 2
    else
      local seglen = data:byte(pos + 2) * 256 + data:byte(pos + 3)
      if marker == 0xE0 and seglen >= 14 and data:sub(pos + 4, pos + 8) == "JFIF\0" then
        local units = data:byte(pos + 11)
        local xd = data:byte(pos + 12) * 256 + data:byte(pos + 13)
        local yd = data:byte(pos + 14) * 256 + data:byte(pos + 15)
        if units == 1 and xd > 0 and yd > 0 then
          dpi_x, dpi_y = xd, yd
        elseif units == 2 and xd > 0 and yd > 0 then
          dpi_x, dpi_y = xd * 2.54, yd * 2.54
        end
      end
      local is_sof = marker >= 0xC0 and marker <= 0xCF
        and marker ~= 0xC4 and marker ~= 0xC8 and marker ~= 0xCC
      if is_sof then
        local h = data:byte(pos + 5) * 256 + data:byte(pos + 6)
        local w = data:byte(pos + 7) * 256 + data:byte(pos + 8)
        return w, h, dpi_x, dpi_y
      end
      if marker == 0xD9 or seglen < 2 then return nil end
      pos = pos + 2 + seglen
    end
  end
  return nil
end

-- PNG: fixed-offset IHDR for width/height, optional pHYs chunk for DPI.
local function png_dimensions(data)
  if data:sub(1, 8) ~= "\137PNG\r\n\26\n" then return nil end
  local width = data:byte(17) * 16777216 + data:byte(18) * 65536 + data:byte(19) * 256 + data:byte(20)
  local height = data:byte(21) * 16777216 + data:byte(22) * 65536 + data:byte(23) * 256 + data:byte(24)
  local dpi_x, dpi_y = 96, 96
  local pos, len = 9, #data
  while pos + 8 <= len do
    local clen = data:byte(pos) * 16777216 + data:byte(pos + 1) * 65536 + data:byte(pos + 2) * 256 + data:byte(pos + 3)
    local ctype = data:sub(pos + 4, pos + 7)
    if ctype == "pHYs" and pos + 16 <= len then
      local ppu_x = data:byte(pos + 8) * 16777216 + data:byte(pos + 9) * 65536 + data:byte(pos + 10) * 256 + data:byte(pos + 11)
      local ppu_y = data:byte(pos + 12) * 16777216 + data:byte(pos + 13) * 65536 + data:byte(pos + 14) * 256 + data:byte(pos + 15)
      local unit = data:byte(pos + 16)
      if unit == 1 and ppu_x > 0 and ppu_y > 0 then
        dpi_x, dpi_y = ppu_x * 0.0254, ppu_y * 0.0254
      end
      break
    end
    if ctype == "IDAT" or clen < 0 then break end
    pos = pos + 12 + clen
  end
  return width, height, dpi_x, dpi_y
end

local function natural_width_inches(path)
  local data = read_file(path)
  if not data then return nil end
  local w, _, dpi_x = nil, nil, nil
  if path:lower():match("%.png$") then
    w, _, dpi_x = png_dimensions(data)
  elseif path:lower():match("%.jpe?g$") then
    w, _, dpi_x = jpeg_dimensions(data)
  end
  if w and dpi_x and dpi_x > 0 then
    return w / dpi_x
  end
  return nil
end

function Image(img)
  if img.attributes.width then
    return img -- author already set an explicit width; respect it
  end
  if img.src:match("^https?://") then
    return img -- remote images: nothing to measure, known to be small badges
  end

  local path = find_local_file(img.src)
  if not path then
    return img -- can't find/read it; leave sizing to the LaTeX default
  end

  local width_in = natural_width_inches(path)
  if width_in and width_in > MAX_WIDTH_IN then
    img.attributes.width = "90%"
  end
  return img
end
