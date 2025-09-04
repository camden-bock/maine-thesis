# Changelog

## v2.0
### File Structure and Maintenance
* The v1 class was a single, manually maintained `.cls` file.
* In v2, `maine-thesis.dtx` is a single source file that generates both the class file (`maine-thesis.cls`) and its documentation. This allows for a more streamlined and automated maintenance process.
* The `dtx` file format is part of a larger build system that uses `l3build` for unpacking and generating a CTAN-ready package.

### Package and Dependency Updates
* The v1 class file used older packages for a variety of tasks.
* The v2 class has been refactored to use modern packages. For example, it now uses `biblatex` with the `biber` backend for citation management. The previous version did not specify the use of these packages and appears to have a simpler citation approach.
* New dependencies were added, including `fontspec`, `microtype`, `hyperref`, `csquotes`, `titlesec`, and `etoolbox`, which provide more robust font, typography, hyperlinking, and title formatting capabilities.

### Formatting and User Interface
* The v1 class managed heading styles using a numerical counter (`\setcounter{head}`) with `\ifcase` logic.
* The v2 `maine-thesis.cls` uses named macros like `\apaheadings`, `\chicagoheadings`, and `\idecimalheadings` for a clearer and more direct way to set heading formats.
* The v2 provides a unified command for caption formatting with `\DeclareCaptionFormat{thesis}`. The original class handled captions through a redefinition of `\@makecaption` and other low-level commands.
* The title page and abstract environments were completely redesigned with the `\maketitlehooka` and `\maketitlehookd` commands, allowing for more precise control over the layout.

### Code and Variable Changes
* The v1 class contained deprecated commands like `\libraryrights` and `\dissacceptance`.
* The v2 class removes these deprecated commands and replaces them with a `\ClassError` message, informing the user that the Graduate School no longer requires them.
* The `\preliminary` command in the v2 version now sets the `tocdepth` and `secnumdepth` to 1, while the v1 version used a different command for this purpose (`\settocdepth{chapter}`).
* The `\appendix` command in the v2 class now uses `\gdef` to globally change `\chaptername` to "Appendix" and the chapter counter to use alphabetical characters (`\thechapter{\@Alph\c@chapter}`).

`\comment`
The comment command is now pulled from the `changes` packages with more extensive functionality. In v1.14 this command uses the `todonotes` package to create margin notes but also checks a conditional (`ifdraft`) to ensure the notes only appear in draft mode.

`\highlight`
The highlight command is now pulled from the `changes` packages with more extensive functionality. In v1.14 this command uses the `soul` package to create margin notes but also checks a conditional (`ifdraft`) to ensure the notes only appear in draft mode.

`\appendix`
The appendix command should no longer be used to define appendices; however, it is still supported in the appendix package (replacing custom appendix and heading table of contents functionality).

`\multipleappendicestrue`
This command, located in `main.tex`, is a conditional that tells the template to use multiple appendices. If you only have one appendix, you should comment this line out. This has been replaced with the `multiappendices` option for the class.

---

## Changes in v1.16
* **Added University of Maine Graduate School Land Acknowledgment**

---

## Changes in v1.15
* **Add “APPENDICES” to title of first Appendix and TOC when multiple appendices are present.**

---

## Changes in v1.14
* **Ensured double spacing in chapter titles.**
* **Removed extra space above chapter titles.**
* **Removed extra space between chapters in list of figures and list of tables.** This is implemented as an option; you can add the space back (for unofficial copies) with the `loftspacing` option.
* **Changed "The University of Maine" to "the University of Maine" in the auto-sentence of the author biography.**
* **Reduced space between title and author name on abstract pages.**
* **Removed “Chapter” heading from TOC.**
* Fixed problem with link target (when using `hyperref`) and page number in TOC for the reference section.
* **Changed "The University of Maine" to "the University of Maine" in the auto-sentence of the author biography.**
* Improved capitalization enforcement for chapter headings and TOC entries. This should make redefining section names (as when using `babel`) much easier.
* Dropped 2-volume support. (Graduate School no longer needs a printed copy of the thesis.)
* Page number placement is now controlled by a class option. It's also more consistent in its application as a result.
* **Extra space before “Chapter” label in TOC has been removed.**
* “Chapter” and “Appendix” in chapter headings is now printed in all uppercase.
* **Tweaks to make 5-dot minimum in TOC leaders better respected.** Thanks to pmbean6 for this fix.
* **Use a pronoun instead of author name for the last sentence of author biography.** Users now need to define their preferred pronoun with the `\authorpronoun` command. Do not forget to capitalize the first letter of the pronoun. If no pronoun is provided, then the full author name will appear in the last sentence of the biography.
* **When figure/table captions are too long to go into the table of contents, the graduate school wants the entry in the table of contents to match the first sentence of caption exactly.** To facilitate this, the `\caption` command has been redefined so that the optional argument, if given, is automatically prepended to the caption text. Older theses, for which this new behavior would be undesirable, can turn it off with the `legacycaptions` option.
* **On title page, when the name and title of an advisor or committee member is long enough to wrap to a second line, that second line will be indented 1.5em** (the same as the indentation of a paragraph in the body of the thesis).

---

## Changes in v1.13
* The short form of the advisor's name can now be entered as an optional argument of `\principaladvisor`.
* Bugfix: `idecimal` and `jdecimal` heading styles were suppressing the section numbers. Thanks to pmbean6 for this fix.
* Margin widths have been tweaked a little so that they more closely conform to the guidelines. Thanks to pmbean6 for this fix.
* If you edited the class file to get justified text back, then subsection headings were being indented in `jdecimal` style. This has been fixed in preparation for later changes. Thanks to pmbean6 for this fix.
* Package conflict with `float` package has been resolved. Thanks to pmbean6 for this fix. Those updating a thesis should change listof environments to `thesislist`.
* Bugfix: The default setting of `\parindent` was being forced to 0, which was not as intended.
* Indentation for the headings has been decoupled from `\parindent` and is now tied to `\headindent`.
* Added some basic metadata (title and author) handling when `hyperref` is loaded. Thanks to pmbean6 for this enhancement.
* **Adjusted page numbering to account for the removal of the Dissertation Acceptance page.**

---

## Changes in v1.12
* **Eliminated Dissertation Acceptance and Library Rights Statement pages.**

---

## Changes in v1.11
* **Replaced “thesis” with `\@type` on the Library Rights page.**
* **Labels for signature lines now use the same size font as the rest of the thesis (they were formerly reduced).**
* **The gap between the title and the text on the Dissertation Acceptance and Library Rights page has been reduced.**
* **The mandatory sentence at the end of the Author Biography (and which the class file produces automatically) is no longer its own paragraph.**
* **The default headings system has been modified to make it match more closely with the justified decimal example in the Guidelines.**
* Two additional headings systems (`headings` and `idecimal`) have been added. These are based on the headings and indented decimal examples in the Guidelines.
* **Improved Widow/Orphan protection in the TOC.**
* **Improved Widow/Orphan protection in the bibliography.**

---

## Changes in v1.10
* **Alignment of multi-line table of contents entries for Appendices altered.**
* 5-dot leader minimum code reworked to be more robust.

---

## Changes in v1.9
* **Acceptance Page title consolidated to a single line.**
* **Removed “Submitted for graduation...” from the Acceptance Page.**

---

## Changes in v1.8
* **Hyphenation disabled.**
* **Full justification disabled.**

---

## Changes in v1.7
* Added `\highlight` command.
* Modifications to `\pocket` to make its ToC entries match other chapter-level entries.
* Added two-volume support.
* Made some modifications to help with widow/orphan control in the ToC.

---

## Changes in v1.6
* **Changed line length for multiple line entries in the ToC.**
* **Removed the multiple appendices “Appendices” header from the ToC.**
* Added `twoside` option.
* Added `unbound` option.
* Added hooks to alter heading styles.
* Added `chicago` and `apa` options to switch headings automatically to the appropriate style.

---

## Changes in v1.5
* License Changed to LPPL v1.3c.
* Generalized Dissertation Acceptance Page.
* Changed to the signature line on the Library Rights Page.
* Fixed delimiter in figure and table captions.
* Unified `\copyrightyear{...}` and `\copyrightpage` into a single command.
* Refined support for two advisors and the number of committee members.
* Removed support for External Reader on the title page.
* Created patch code to fix list of tables and list of figures when `hyperref` is used.
* Added `layabstract` environment.
* Added `listof` environment.
* Changed font for `verbatim` environment and `\verb` command.
* Fixed typesetting of dedication.
* General file maintenance.
* Added insertion of “Appendices” to ToC when there are multiple appendices.
* Modified `biography` environment to auto-generate the last sentence.
* Made identification of the number of advisors and committee members automatic.
* Removed `\appsection{...}` as it is redundant with `\section*{...}`.
* Changed the way “Chapters” and “Appendices” are added to the TOC.
* Added `tocvsec2` dependence to make the change in TOC depth for the front matter and appendices automatic.
* Modified `preface` environment to make the non-numbering of its sections, subsections, etc. automatic.
* Reserved `\part` for multiple volume support.
* Added `\pocket`.
* Defined a pseudo `\texorpdfstring` command for use in chapter titles. When `hyperref` is loaded (and defines the command properly) this has the effect of hiding `\MakeUppercase` commands from `hyperref`.
* Made Preface, Dedication, and Acknowledgements double spaced.
* Created type variables and commands that allow switching to “thesis” or “project” instead of “dissertation.”
* Removed footnote rule.
* Renamed `\labelchaptersintoc` to `\toclabel`, generalized its function, and made it compatible with `hyperref`.
* Added commands to compress the title page when needed.

---

## Changes prior to v1.5
This list is not entirely complete but is a best reconstruction as I can manage. Changes were not logged prior to v1.5.
* Added Dissertation Acceptance Page.
* Added support for 6-member committees.
* Removed Boldface from TOC entries.
* Reduced size of chapter and section headers to match text font, both in place and TOC entries.
* Added support for two advisors.