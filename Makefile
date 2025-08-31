# Define the source files and the main executable
MAIN_DTX = maine-thesis.dtx
INS_FILE = maine-thesis.ins
CLS_FILE = maine-thesis.cls
MWE_DIR = mwe/
TEMPLATE_DIR = template/
EXAMPLE_FILE = $(MWE_DIR)maine-thesis-example.tex
TEMP_DTX = $(CLS_FILE).tmp.dtx

# The main target to build everything
all: $(CLS_FILE)  $(EXAMPLE_FILE) copy-cls

# The following lines MUST be indented with a single TAB character
$(CLS_FILE): $(INS_FILE) $(MAIN_DTX)
	@echo "--- Running docstrip to create $(CLS_FILE) ---"
	lualatex $(INS_FILE)
	lualatex $(MAIN_DTX)

# Rule to copy the generated .cls file to the mwe directory
copy-cls: $(CLS_FILE)
	@echo "--- Copying $(CLS_FILE) to $(MWE_DIR) ---"
	cp $(CLS_FILE) $(MWE_DIR)
	cp $(CLS_FILE) $(TEMPLATE_DIR)

# Rule to compile the user example and run biber
$(EXAMPLE_FILE): $(CLS_FILE)
	@echo "--- Compiling example document with lualatex ---"
	lualatex $(EXAMPLE_FILE)

# Clean up temporary files
clean:
	rm -f *.log *.aux *.out *.pdf *.fls *.cls.tmp.dtx *.cls
	@echo "--- Cleaned up all generated files. ---"

# The distclean target removes all generated files, including the .cls and PDF
distclean: clean
	rm -f $(CLS_FILE) $(MWE_DIR)$(CLS_FILE) $(MWE_DIR)*.pdf
	rm -f $(MWE_DIR)*.aux $(MWE_DIR)*.bbl $(MWE_DIR)*.bcf $(MWE_DIR)*.blg $(MWE_DIR)*.log $(MWE_DIR)*.run.xml
	@echo "--- Performed a thorough clean of all generated files. ---"