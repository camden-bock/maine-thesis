# maine-thesis -- A Class for the Graduate School of the University of Maine's Thesis Format

Authors: R. Padraic Springuel, Camden Bock, Hanna Brooks

- Date: 2025-09-05
- Version: 2.0.0

# Abstract

This document class provides assistance for implementing the thesis formatting requirements of the Graduate School at
the University of Maine. The class handles the complex formatting rules for pagination, spacing, and headings, allowing
students to focus on the content of their research.

## Key features include:

- Support for both single- and multiple-appendix formats.
- A variety of heading styles, including APA, Chicago, and decimal numbering.
- Automatic generation of the title page and biography with user-defined variables.
- Integration with modern TeX packages like biblatex for citation management and hyperref for document navigation.
- A draft mode with watermarks and line numbers for easier collaborative review.

The document also provides comprehensive guidance on organizing thesis files, handling common formatting errors, and
working with other LaTeX packages.

## Description

The maine-thesis document class is a comprehensive solution for students at the University of Maine who need to format
their Masters or Doctorate thesis according to the specific guidelines of the Graduate School. It extends the standard
report class, providing a robust framework that automates many of the required formatting tasks, such as margin
settings, line spacing, and the layout of preliminary pages.
Installation

To install this class file, you need to place it in the texmf/tex/latex/ directory of your local TeX installation. Since
this location can vary by system, please consult your system's documentation for the specific path.

If you are using an online editor like Overleaf, all the necessary packages are pre-installed, and you can simply upload
your project files to begin.
Usage

To use the class, your main document file (main.tex) should begin with the document class declaration:

```LaTeX
\documentclass[options]{maine-thesis}
```

Replace options with your desired settings, such as draft, multiappendices, or a specific heading style like apa or
jdecimal.

The class requires a build tool like l3build or latexmk to properly compile the document and handle the bibliography
with biblatex.
Change Log

The maine-thesis class has undergone significant updates from version 1.16 to 2.0.0. Key changes include:

- A new file structure based on l3build for streamlined maintenance.
- Refactored code to use modern TeX packages (biblatex, titlesec, hyperref, etc.).
- New options for heading styles and improved typography.
- Removal of deprecated commands and features no longer required by the Graduate School.

## Bugs and Suggestions

Please report any bugs or formatting problems to the GitLab
repository: https://www.google.com/search?q=https://gitlab.com/maine-thesis/maine-thesis. When submitting an issue,
please include a minimal working example that reproduces the problem.