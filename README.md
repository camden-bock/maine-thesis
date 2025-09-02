# maine-thesis

A LaTeX class file for typesetting Master's and Doctorate theses at the University of Maine (Orono, ME).

This project aims to update the class file to the current graduate school specifications and make it available on CTAN
for wider use.

## Quick Start

Once maine-thesis is available on CTAN, the easiest way to install it will be through your TeX distribution's package
manager. In the meantime, you can install it manually from this repository.

### CTAN Installation (Future Support)

When the package is on CTAN, you'll be able to install it using your TeX distribution's package manager.

    TeX Live: tlmgr install maine-thesis

    MiKTeX: Use the MiKTeX Console or mpm utility.

### GitLab Installation (Future Support)

In a future revision, the package will be available with automated releases in Gitlab.

### Overleaf Template (Future Support)

In a future version, the template will be made available in overleaf with reference to the class file.

## Development with l3build

This project uses l3build to automate common tasks. To get started, you can use the following commands:

    l3build unpack: Extracts the .cls and .pdf files from the source.

    l3build doc: Compiles the main documentation PDF.

    l3build clean: Removes all temporary and generated files.

    l3build ctan: Prepares a CTAN-ready TDS (TeX Directory Structure) archive.

For a manual installation, see the instructions below.

### Manual Installation (Current Method)

To install the class file, copy or link maine-thesis.cls to your local texmf tree. On Unix-based systems, you can use
one of these commands:

    Copy: cp maine-thesis.cls $(kpsewhich --var-value TEXMFHOME)

    Link: ln maine-thesis.cls $(kpsewhich --var-value TEXMFHOME)

On Windows, the equivalent commands are:

    Copy: for /f "usebackq tokens=*" %a in (\kpsewhich --var-value TEXMFHOME`) do copy maine-thesis.cls %a`

    Link: for /f "usebackq tokens=*" %a in (\kpsewhich --var-value TEXMFHOME`) do mklink %a maine-thesis.cls`

Linking is recommended because it allows you to update the class by simply using git pull from the repository.

# Repository Contents

    sources/: The main source files, including maine-thesis.dtx (the documented source) and CTANREADME.md.

    doc/: Documentation for the class file, which also serves as an example of its use.

    template/: A basic document structure you can use as a starting point for your thesis.

# Contributing

If you find a bug or a formatting issue, please file an issue on GitHub.

When reporting a bug, it's very helpful to include a Minimal Working Example (MWE) that demonstrates the problem and a
description of the desired result.