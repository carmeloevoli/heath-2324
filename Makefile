FIG_FILES := $(shell echo "figures/*") 
BIB_FILES := $(shell echo "*.bib")
LECTURE_FILES := $(shell echo "sections/*.tex") 
PROBLEM_FILES := $(shell echo "problems/*.tex") 


lectures: lectures.pdf 

lectures.pdf: lectures.tex $(LECTURE_FILES) $(FIG_FILES) $(BIB_FILES)
	xelatex lectures
	bibtex lectures
	xelatex lectures
	xelatex lectures
	cp lectures.pdf files/CEvoli_HEATh24_lectures.pdf

exercises: exercises.pdf

exercises.pdf: exercises.tex $(PROBLEM_FILES) $(FIG_FILES) $(BIB_FILES)
	xelatex exercises
	bibtex exercises
	xelatex exercises
	xelatex exercises
	cp exercises.pdf files/CEvoli_HEATh24_exercises.pdf

clean:
	-rm -fv *.aux
	-rm -fv *.log 
	-rm -fv *.out 
	-rm -fv *.bbl 
	-rm -fv *.blg 
	-rm -fv *.toc 
	-rm -fv *.synctex.gz

cleanall: clean
	-rm -fv *.pdf

.PHONY: lectures exercises clean cleanall
