[![link to most recent release](https://gitlab.com/maine-thesis/maine-thesis/-/badges/release.svg)](https://gitlab.com/maine-thesis/maine-thesis/-/releases)

![pipeline status](https://gitlab.com/maine-thesis/maine-thesis/badges/master/pipeline.svg?ignore_skipped=true)

# maine-thesis

A LaTeX class file for typesetting Master's and Doctorate theses at the University of Maine (Orono, ME).

This project aims to update the class file to the current graduate school specifications and make it available on CTAN
for wider use.

## Quick Start: Overleaf Template

Click the link below to create a new template in Overleaf from the template.

[Open Template in Overleaf](https://www.overleaf.com/docs?snip_uri=https%3A%2F%2Fgitlab.com%2Fapi%2Fv4%2Fprojects%2F72873936%2Fpackages%2Fgeneric%2Fmaine-thesis%2Flatest%2Fmaine-thesis-template.zip&engine=lualatex)

[Read Maine-Thesis Documentation](https://gitlab.com/api/v4/projects/72873936/packages/generic/maine-thesis/latest/maine-thesis.pdf)

## Other Installation Methods

### CTAN Installation (Future Support)

When the package is on CTAN, you'll be able to install it using your TeX distribution's package manager.

    TeX Live: tlmgr install maine-thesis

    MiKTeX: Use the MiKTeX Console or mpm utility.

### Manual Installation from GitLab Release

Include the class file at the root directory of your project.

- [Class File](https://gitlab.com/api/v4/projects/72873936/packages/generic/maine-thesis/latest/maine-thesis.cls)
- [Template (includes class file)](https://gitlab.com/api/v4/projects/72873936/packages/generic/maine-thesis/latest/maine-thesis-template.zip)

### Command Line Installation (Linux / macOS)

Follow these steps to download and install the package into your personal texmf directory.

#### Step 1: Find your local texmf directory

First, determine the location of your user-specific TeX directory by running the following command. The output should be
a path like ~/texmf.

```bash
TEXMFHOME=$(kpsewhich --var-value=TEXMFHOME)
echo "Your local texmf directory is: $TEXMFHOME"
```

If the command doesn't return a path, you may need to create the directory yourself. It is typically located at ~/texmf.

#### Step 2: Download and Unzip the Package

Use wget to download the TDS .zip file directly from the provided URL, and then unzip it into your texmf directory.

Define the URL for clarity

```bash
PACKAGE_URL="[https://gitlab.com/maine-thesis/maine-thesis/-/package_files/226178653/download](https://gitlab.com/maine-thesis/maine-thesis/-/package_files/226178653/download)"
```

Download the file to a temporary location

```bash
wget --output-document maine-thesis.zip "$PACKAGE_URL"
```

Unzip the contents directly into your texmf directory

```bash
unzip maine-thesis.zip -d "$TEXMFHOME"
```

Clean up the downloaded zip file

```bash
rm maine-thesis.zip
```

#### Step 3: Update the TeX Filename Database

Finally, you must update TeX's filename database so that it can find the new package files.

```
# Update the filename database for your personal texmf tree
texhash "$TEXMFHOME"

# Alternatively, you can use mktexlsr (it's the same command)
# mktexlsr "$TEXMFHOME"
```

The package is now installed and ready to be used in your LaTeX documents.

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