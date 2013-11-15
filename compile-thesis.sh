#!/bin/bash
# A script to compile the PhD Thesis - Krishna Kumar 
# Distributed under GPLv2.0 License

echo "Compiling your PhD Thesis...please wait...!"
pdflatex -interaction=nonstopmode thesis.tex
bibtex thesis.aux 
pdflatex -interaction=nonstopmode thesis.tex
echo "Done!"
