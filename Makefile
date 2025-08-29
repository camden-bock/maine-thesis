# Define the source files and the main executable
MAIN_DTX = sources/maine-thesis.dtx
INS_FILE = maine-thesis.ins
CLS_FILE = maine-thesis.cls
MWE_DIR = mwe/
EXAMPLE_FILE = $(MWE_DIR)main.tex
TEMP_DTX = $(CLS_FILE).tmp.dtx

# List all the modular .dtx files in the correct order
MODULES = \
	sources/options.dtx \
	sources/requirements.dtx \
	sources/custom-commands.dtx \
	sources/format/general-formatting.dtx \
	sources/format/heading-definitions.dtx \
	sources/format/headings.dtx \
	sources/format/float-format.dtx \
	sources/format/toc.dtx \
	sources/format/titlepage.dtx \
	sources/environments/abstract.dtx \
	sources/environments/acknowledgements.dtx \
	sources/environments/appendix.dtx \
	sources/environments/biography.dtx \
	sources/environments/copyright.dtx \
	sources/environments/dedication.dtx \
	sources/environments/preface.dtx \
	sources/environments/references.dtx \
	sources/environments/main-seperator.dtx \
	sources/depreciated.dtx \
	sources/end.dtx

# The main target to build everything
all: $(CLS_FILE) $(EXAMPLE_FILE)

# The following lines MUST be indented with a single TAB character
$(CLS_FILE): $(INS_FILE) $(MAIN_DTX) $(MODULES)
	@echo "--- Generating temporary combined DTX file ---"
	cat $(MAIN_DTX) $(MODULES) > $(TEMP_DTX)
	@echo "--- Running docstrip to create $(CLS_FILE) ---"
	lualatex $(INS_FILE)

# Rule to copy the generated .cls file to the mwe directory
copy-cls: $(CLS_FILE)
	@echo "--- Copying $(CLS_FILE) to $(MWE_DIR) ---"
	cp $(CLS_FILE) $(MWE_DIR)

# Rule to compile the user example
$(EXAMPLE_FILE): $(CLS_FILE)
	@echo "--- Compiling example document ---"
	lualatex $(EXAMPLE_FILE)
	lualatex $(EXAMPLE_FILE)

# Clean up temporary files
clean:
	rm -f *.log *.aux *.out *.pdf *.fls *.cls.tmp.dtx *.cls
	@echo "--- Cleaned up all generated files. ---"

# The distclean target removes all generated files, including the .cls and PDF
distclean: clean
	rm -f $(CLS_FILE) $(MWE_DIR)$(CLS_FILE) $(MWE_DIR)*.pdf
	@echo "--- Performed a thorough clean of all generated files. ---"