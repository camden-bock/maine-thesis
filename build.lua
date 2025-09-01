typesetexe = "lualatex"
checkengines = {"luatex", "pdftex", "xetex"}

-- Identify the bundle and main module
bundle = "maine-thesis"
module = "maine-thesis"

-- Specify the directory where the main source files (.dtx, .ins) are located
sourcefiledir = "sources"

-- Identify all source files to be processed
sourcefiles = {
    "maine-thesis.dtx",
    "pagestyle.dtx",
    "options.dtx",
    "requirements.dtx",
    "variables.dtx",
    "depreciated.dtx",
    "format/captions.dtx",
    "format/general-format.dtx",
    "format/headings.dtx",
    "format/pagestyle.dtx",
    "format/titlepage.dtx",
    "format/toc.dtx",
    "environments/abstract.dtx",
    "environments/acknowledgements.dtx",
    "environments/appendix.dtx",
    "environments/biography.dtx",
    "environments/copyright.dtx",
    "environments/dedication.dtx",
    "environments/main-seperator.dtx",
    "environments/preface.dtx",
    "environments/references.dtx"
}

unpackfiles = {"*.dtx"}

-- Identify files to be installed. These are the *generated* files, and
-- l3build will expect them in the main directory after running `l3build unpack`.
installfiles = {
    "maine-thesis.cls",
    "maine-thesis-pagestyle.sty",
    "maine-thesis-options.sty",
    "maine-thesis-requirements.sty",
    "maine-thesis-variables.sty",
    "maine-thesis-depreciated.sty",
    "maine-thesis-caption.sty",
    "maine-thesis-general-format.sty",
    "maine-thesis-headings.sty",
    "maine-thesis-pagestyle.sty",
    "maine-thesis-titlepage.sty",
    "maine-thesis-contents.sty",
    "maine-thesis-abstract.sty",
    "maine-thesis-acknowledgements.sty",
    "maine-thesis-appendix.sty",
    "maine-thesis-biography.sty",
    "maine-thesis-copyright.sty",
    "maine-thesis-dedication.sty",
    "maine-thesis-main-seperator.sty",
    "maine-thesis-preface.sty",
    "maine-thesis-references.sty"
}

-- Set the name for the main documentation.
-- We'll assume the main documentation is compiled from myclass.dtx
typesetfile = {"maine-thesis.dtx"}

-- This is the new part for handling examples and templates!
-- `demofiles` lists files that should be packaged as examples.
-- The path is relative to the directory where the command is run.
-- You can use wildcards here.
demofiles = {
    install = "example", -- The directory in the TDS archive
    files = {
        "mwe/maine-thesis-example.tex",
        "template/main.tex"
    }
}