.PHONY: all doc clean unpack ctan

# Main target: Unpack sources, build documentation, and prepare for release.
all: unpack doc

# Unpacks the DTX files into the working directory.
unpack:
	@echo "--- Unpacking sources ---"
	@l3build unpack

# Builds the main documentation PDF.
doc:
	@echo "--- Building documentation ---"
	@l3build doc

# Cleans up temporary and generated files.
clean:
	@echo "--- Cleaning up files ---"
	@l3build clean
	@rm -f *.pdf *.cls *.sty *.log *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.synctex.gz *.out *.lot *.lol *.lof *.toc
	@rm -f myclass*.zip

# Prepares a CTAN-ready TDS archive.
ctan:
	@echo "--- Preparing CTAN package ---"
	@l3build ctan