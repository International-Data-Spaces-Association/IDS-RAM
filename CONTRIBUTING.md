# Contributing to IDS-RAM

The IDS-RAM is one of the core deliverables of the  [IDSA](https://www.internationaldataspaces.org) that comes along with the [IDSA Rulebook](https://docs.internationaldataspaces.org/ids-knowledgebase/idsa-rulebook) and in line with the [Dataspace Protocol](https://docs.internationaldataspaces.org/dataspace-protocol/overview/readme).

All content published here is a working draft of the Working Group Architecture. You are very welcome to contribute
to this project when you find a bug, want to suggest an improvement, or have an idea for a useful
feature. For this, always create an issue and a corresponding branch, and follow our style
guides as described below.

Please note that we have a [code of conduct](CODE_OF_CONDUCT.md) that all contributors should stick to.

## Changelog

We document changes in the [CHANGELOG.md](CHANGELOG.md) on root level which is formatted and
maintained according to the rules documented on http://keepachangelog.com.

## Issues

You always have to create an issue if you want to propose or integrate an improvement, feature or fix.
Briefly and clearly describe the purpose of your contribution in the corresponding issue.
For this purpose, this repository has pre-defined Issue Templates.

**Documentation**: Documenting information that are already discussed and set.
**Content**: Changes / additions of the structure / knowledge
**QuickFix**: Tasks that can be completed in a small amount of time and don’t need too much knowledge (good for beginners)
**Epic**: To collect and organize the existing Issues (see below)

The pre-defined [labels](#labels) improve the understanding of your intentions and help to follow
the scope of your changes.

## Labels

The [labels](https://github.com/International-Data-Spaces-Association/IDS-RAM_4_0/labels) are listed at the
[issues](https://github.com/International-Data-Spaces-Association/IDS-RAM_4_0/issues).
There are two types of labels: one describes the content of the issue and should be used by the
contributor that creates the issue. The other one, starting with `status`, will be added from the
contributor that takes on the issue. New issues should be initially marked with `status:open`.
**Please always use Labels on the Issues you create.**
Some Labels are attached automatically with certain Issue Templates

*  Basic labels: `bug`, `enhancement`, `suggestion`, `documentation`, `question`, `discussion`, `invalid`, `help wanted`, `QuickFix`
*  `status:closed`: issue is closed (after successful approval by issuer and QA)
*  `status:duplicate`: issue is a duplicate of another linked issue and therefore discontinued
*  `status:in-progress`: issue has been assigned and is currently being worked on
*  `status:on-hold`: issue may be implemented at a later date
*  `status:open`: issue has been submitted or re-opened recently
*  `status:out-of-scope`: issue is considered out of the project's scope and therefore not further considered
*  `status:resolved`: issue has been implemented and tested by a contributor
*  `wont-fix`: issue is in scope but considered impossible or too expensive to deal with
*  `Epic`: Issue ia an Epic (see below)

## Workflow and Meetings

In general, tasks that are not in the GitHub repository as issues, are not officially tasks and will not be treated as such by the group and organizers.
Every Issue created will have a deadline.

Epic Issues and Milestones are managed by the organizers.

Projects are managed by their corresponding maintainers. The maintainers will get reminders, should the progress / organization there stagnate.

The meetings are used to discuss progress, problems and new ideas. Therefore, they will be used as deadlines for the Issues, which will be presented in an appropriate amount of time according to the task’s significance, extent and correlating tasks. In addition, the project maintainers will update on what has happened since the last meeting and the organizers will show the progress on the Epic Issues.

## Epic Issues

Epic Issues are needed to organize, structure and visualize existing Issues. They are usually pinned to the top.
**Please do not open an Epic Issue without discussing it with an organizer.**
If you think something should be added to an Epic Issue, please contact its author.

## Branches

After creating an issue yourself or if you want to address an existing issue, you have to create a
branch with a unique number and name that assigns it to an issue. Therefore, follow the guidelines
at https://deepsource.io/blog/git-branch-naming-conventions/. After your changes, update the
`README.md`, Wiki, and `CHANGELOG.md` with necessary details. Then, create a pull request and note
that **directly committing to the main branch is not allowed**. Please use the feature `linked issues` to
link issues and pull requests.

Pull requests have to be approved by the IDSA TSC and the IDSA Working Groups.

## Commits

We encourage all contributors to stick to the commit convention following the specification on
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). In general, use  the
imperative in the present tense. A quick overview of the schema:
```
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
```

Types: `fix`, `feat`, `chore`, `test`, `refactor`, `docs`, `release`. Append `!` for breaking
changes to a type.

An example of a very good commit might look like this: `feat![login]: add awesome breaking feature`

## Milestones

Milestones collect Epics with a set and strict deadline. Milestone progress gets observed and discussed in the RAM5 Meetings.

## Copyright and Licensing

Content that is added to the repository is published under the Creative Commons Attribution 4.0 license (see the [LICENSE.md file](./LICENSE.md)). That means that you implicitly accept that your content is treated by CC4.0 as soon as you push any changes to the main repository and can be further published, updated, or deleted. In particular, you grant the IDSA the copyright on your content and make sure that your addition does not conflict with any other copyright claim of your knowledge, for instance for used pictures or other graphics.

## Versioning

The Versioning will be implemented using the GitHub commits and tags.
