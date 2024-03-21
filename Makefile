.PHONY: lectures exercises clean distclean

lectures: lectures.pdf

lectures.pdf: lectures.tex 2024-hea.bib
	xelatex lectures
	bibtex lectures
	xelatex lectures
	xelatex lectures

exercises: exercises.pdf

exercises.pdf: exercises.tex 2024-hea.bib
	xelatex exercises
	bibtex exercises
	xelatex exercises
	xelatex exercises

clean:
	rm -f *.aux *.log *.out	*.bbl *.blg *.toc

distclean:
	rm -f *.pdf