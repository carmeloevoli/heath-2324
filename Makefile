# Compiler commands
LATEX = xelatex
BIBTEX = bibtex

# Directories and files
FIG_FILES := $(wildcard figures/*)
BIB_FILES := $(wildcard *.bib)
LECTURE_FILES := $(wildcard sections/acceleration/*.tex sections/appendix/*.tex sections/plasma/*.tex sections/radiative/*.tex sections/sources/*.tex sections/transport/*.tex)
PROBLEM_FILES := $(wildcard problems/*.tex)

# Output files
LECTURE_PDF = lectures.pdf
EXERCISE_PDF = exercises.pdf

# Output directory
OUTPUT_DIR = files
LECTURE_COPY = $(OUTPUT_DIR)/CEvoli_HEATh24_lectures.pdf
EXERCISE_COPY = $(OUTPUT_DIR)/CEvoli_HEATh24_exercises.pdf

# Rules
all: lectures exercises

lectures: $(LECTURE_COPY)

exercises: $(EXERCISE_COPY)

$(LECTURE_COPY): $(LECTURE_PDF)
	@mkdir -p $(OUTPUT_DIR)
	cp $< $@

$(EXERCISE_COPY): $(EXERCISE_PDF)
	@mkdir -p $(OUTPUT_DIR)
	cp $< $@

$(LECTURE_PDF): lectures.tex $(LECTURE_FILES) $(FIG_FILES) $(BIB_FILES)
	$(LATEX) lectures
	$(BIBTEX) lectures
	$(LATEX) lectures
	$(LATEX) lectures

$(EXERCISE_PDF): exercises.tex $(PROBLEM_FILES) $(FIG_FILES) $(BIB_FILES)
	$(LATEX) exercises
	$(BIBTEX) exercises
	$(LATEX) exercises
	$(LATEX) exercises

clean:
	-rm -fv *.aux *.log *.out *.bbl *.blg *.toc *.synctex.gz

cleanall: clean
	-rm -fv *.pdf $(OUTPUT_DIR)/*.pdf

.PHONY: all lectures exercises clean cleanall
