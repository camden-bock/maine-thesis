.PHONY: all doc clean unpack template ctan

# Main target: Unpack sources, build documentation, and prepare for release.
all: unpack doc template longtemplate tag ctan

#Target for CI/CD
gitlab: unpack doc ctan packtemplate
ctanupload: unpack doc ctan upload

# Unpacks the DTX files into the working directory.
unpack:
	@echo "--- Unpacking sources ---"
	@l3build unpack

# Builds the main documentation PDF.
doc:
	@echo "--- Building documentation ---"
	@l3build doc
	@cp build/doc/maine-thesis.pdf doc/maine-thesis.pdf
	@cp build/unpacked/example.pdf doc/maine-thesis-example.pdf

template:
	@echo "--- Building template ---"
	@cp build/unpacked/maine-thesis.cls template/maine-thesis.cls
	@cd template && latexmk -c main.tex && latexmk main.tex
	@cp template/_build/main.pdf doc/maine-thesis-template.pdf
	@rm template/maine-thesis.cls

longtemplate:
	@echo "--- Building guide ---"
	@cp build/unpacked/maine-thesis.cls guide/maine-thesis.cls
	@cd guide && latexmk -c main.tex && latexmk main.tex
	@cp guide/_build/main.pdf doc/maine-thesis-guide.pdf
	@rm guide/maine-thesis.cls

tag:
	@echo "--- Checking Tags ---"
	@l3build tag

# Cleans up temporary and generated files.
clean:
	@echo "--- Cleaning up files ---"
	@l3build clean
	@cd template && latexmk -c main.tex

# Prepares a CTAN-ready TDS archive.
ctan:
	@echo "--- Preparing CTAN package ---"
	@l3build ctan

# Prepares a CTAN-ready TDS archive.
upload:
	@echo "--- Uploading CTAN Package ---"
	@l3build upload

#packs the template for overleaf
packtemplate:
	@echo "--- Packing Template for Overleaf ---"
	@mkdir build/distrib/gl
	@cp -r build/distrib/ctan/* build/distrib/gl
	@cp build/unpacked/maine-thesis.cls build/distrib/gl/maine-thesis.cls
	@mkdir -p _template
	@cp -r template/* _template
	@cp build/unpacked/maine-thesis.cls _template/maine-thesis.cls
	@cp build/doc/maine-thesis.pdf _template/documentation.pdf
	@echo "--- Zipping template files ---"
	@(cd _template && zip -r ../build/distrib/gl/maine-thesis-template.zip .)
	@rm -r _template