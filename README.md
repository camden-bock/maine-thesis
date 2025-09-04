# maine-thesis

A LaTeX class file for typesetting Master's and Doctorate theses at the University of Maine (Orono, ME).

This project aims to update the class file to the current graduate school specifications and make it available on CTAN
for wider use.

## Quick Start

Once maine-thesis is available on CTAN, the easiest way to install it will be through your TeX distribution's package
manager. In the meantime, you can install it manually from this repository.

### Overleaf Template (Easiest Method)

Click the link below to create a new template in Overleaf from the template.

[Create New Project in Overleaf](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F72873936%2Fpackages%2Fgeneric%2Fmaine-thesis%2Flatest%2Fmaine-thesis-template.zip&engine=lualatex)

### CTAN Installation (Future Support)

When the package is on CTAN, you'll be able to install it using your TeX distribution's package manager.

    TeX Live: tlmgr install maine-thesis

    MiKTeX: Use the MiKTeX Console or mpm utility.

### Manual Installation from GitLab Release

Include the class file at the root directory of your project, or download a zip of the repository.

- [Class File](https://gitlab.com/api/v4/projects/72873936/packages/generic/maine-thesis/v2.0/maine-thesis.cls)
- [Template (includes class file)](https://gitlab.com/api/v4/projects/72873936/packages/generic/maine-thesis/latest/maine-thesis-template.zip)
- [Documentation PDF](https://gitlab.com/api/v4/projects/72873936/packages/generic/maine-thesis/latest/maine-thesis.pdf)

## Changes v1.14 --> v2.0 [rpspringuel/maine-thesis](https://github.com/rpspringuel/maine-thesis/blob/master/maine-thesis.cls)

This class is a fork of rpspringuel's maine-thesis class (v.1.14).

The correct use for these changes is reflected in the template.

The updates to the maine-thesis class provide compatibility with biber, update format requirements, and refactor to
simplify the codebase. Version 2.0 is the first version uploaded to CTAN.

- Removal of Commands: V2 removes the `\libraryrights` and `\dissacceptance` commands, which will cause a `\ClassError`
  if a user attempts to use them.

- Removal of Environments: The `\part` command, used for multi-volume theses in V1, is no longer supported and now
  throws a `\ClassError` in V2.

- Changed Command Arguments: The syntax for the `\copyrightpage` command has changed. In V1, it took optional arguments
  for the author and year, but in V2, it takes a single optional argument.

- Changes to Headings and Numbering: The method for selecting heading styles has been completely altered. Instead of
  setting a number with `\setcounter{head}`, V2 uses specific macros like `\apaheadings`.

- Changes to Spacing: V2 relies on the setspace package for managing line spacing, replacing the custom `\doublespacing`
  and `\singlespacing` definitions from V1.

- Bibliography and Citations: V2 uses the modern biblatex and biber system, a significant departure from V1. This change
  means that older documents using `\bibliography{...}` and `\bibliographystyle{...}` will fail and must be updated to
  use commands like `\addbibresource{...}` and `\printbibliography`.

## Development with l3build

This project uses l3build to automate common tasks. To get started, you can use the following commands:

    l3build unpack: Extracts the .cls and .pdf files from the source.

    l3build doc: Compiles the main documentation PDF.

    l3build template: Compiles the template PDF.

    l3build tag: updates version tags.

    l3build clean: Removes all temporary and generated files.

    l3build ctan: Prepares a CTAN-ready TDS (TeX Directory Structure) archive.

For a manual installation, see the instructions below.

### Manual Installation (Current Method)

To install the class file, copy or link maine-thesis.cls to your local texmf tree. On Unix-based systems, you can use
one of these commands:
Copy:

```bash
cp maine-thesis.cls $(kpsewhich --var-value TEXMFHOME)
```

Link:

```bash
ln maine-thesis.cls $(kpsewhich --var-value TEXMFHOME)
```

On Windows, the equivalent commands are:

Copy:

```cmd
for /f "usebackq tokens=*" %a in (\kpsewhich --var-value TEXMFHOME`) do copy maine-thesis.cls %a`
```

Link:

```cmd
for /f "usebackq tokens=*" %a in (\kpsewhich --var-value TEXMFHOME`) do mklink %a maine-thesis.cls`
```

Linking is recommended because it allows you to update the class by simply using git pull from the repository.

# Repository Contents

    sources/: The main source files, including maine-thesis.dtx (the documented source) and CTANREADME.md.

    doc/: Documentation for the class file, which also serves as an example of its use.

    template/: A basic document structure you can use as a starting point for your thesis.

# Contributing

If you find a bug or a formatting issue, please file an issue on GitHub.

When reporting a bug, it's very helpful to include a Minimal Working Example (MWE) that demonstrates the problem and a
description of the desired result.