#!/bin/bash
# A script to compile the PhD Thesis - Krishna Kumar 
# Distributed under GPLv2.0 License

compile="compile";
clean="clean";

if test -z "$1"
then
	echo "Shell scrip for compiling the PhD Thesis"
	echo "Usage: sh ./compile-thesis.sh [OPTIONS]"
	echo "  compile: Compiles the PhD Thesis"
	echo "  clean: removes temporary files"
	exit
fi

if [ $1 = $clean ]; then
	echo "Cleaning please wait ..."
	rm -f *~
	rm -f *.aux*
	rm -f *.bbl
	rm -f *.blg
	rm -f *.d
	rm -f *.fls
	rm -f *.ilg
	rm -f *.ind
	rm -f *.toc*
	rm -f *.lot*
	rm -f *.lof*
	rm -f *.log
	rm -f *.idx
	rm -f *.out*
	rm -f *.pdf
	rm -f *.nlo
	echo "Cleaning complete!"
	exit
elif [ $1 = $compile ]; then
	echo "Compiling your PhD Thesis...please wait...!"
	pdflatex -interaction=nonstopmode thesis.tex
	bibtex thesis.aux 
	pdflatex -interaction=nonstopmode thesis.tex
	echo "Success!"
	exit
fi


if test -z "$2"
then
	exit
fi
