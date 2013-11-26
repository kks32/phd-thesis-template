SET FILENAME=thesis

DEL "%FILENAME%.aux"
DEL "%FILENAME%.bbl"
DEL "%FILENAME%.blg"
DEL "%FILENAME%.d"
DEL "%FILENAME%.fls"
DEL "%FILENAME%.ild"
DEL "%FILENAME%.ind"
DEL "%FILENAME%.toc"
DEL "%FILENAME%.lot"
DEL "%FILENAME%.lof"
DEL "%FILENAME%.idx"
DEL "%FILENAME%.out"
DEL "%FILENAME%.nlo"
DEL "%FILENAME%.nls"
DEL "%FILENAME%.pdf"
DEL "%FILENAME%.ps"
DEL "%FILENAME%.dvi"

pdflatex -interaction=nonstopmode "%FILENAME%.tex"
bibtex "%FILENAME%.aux"
makeindex "%FILENAME%.aux"
makeindex "%FILENAME%.idx"
makeindex "%FILENAME%.nlo" -s nomencl.ist -o "%FILENAME%".nls
pdflatex -interaction=nonstopmode "%FILENAME%.tex"
makeindex "%FILENAME%.nlo" -s nomencl.ist -o "%FILENAME%".nls
pdflatex -interaction=nonstopmode "%FILENAME%.tex"


DEL "%FILENAME%.aux"
DEL "%FILENAME%.bbl"
DEL "%FILENAME%.blg"
DEL "%FILENAME%.d"
DEL "%FILENAME%.fls"
DEL "%FILENAME%.ild"
DEL "%FILENAME%.ind"
DEL "%FILENAME%.toc"
DEL "%FILENAME%.lot"
DEL "%FILENAME%.lof"
DEL "%FILENAME%.idx"
DEL "%FILENAME%.out"
DEL "%FILENAME%.nlo"
DEL "%FILENAME%.nls"


"%FILENAME%.pdf"
