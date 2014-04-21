# Use of glossaries, extra indexes, epstopdf, and other images conversions
# Thanks to Herb Schulz


$pdflatex = 'pdflatex --shell-escape %O %S';

# Custom dependency for glossary/glossaries package
# if you make custom glossaries you may have to add items to the @cus_dep_list and corresponding sub-routines
add_cus_dep( 'glo', 'gls', 0, 'makeglo2gls' );
sub makeglo2gls {
    system( "makeindex -s \"$_[0].ist\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0].glo\"" );
}
# The glossaries package, with the [acronym] option, produces a .acn file when processed with (xe/pdf)latex and
# then makeindex to process the .acn into .acr and finally runs of (xe/pdf)latex to read in the .acr file. Unfortunately
# the glossary package does just the reverse; i.e. (xe/pdf)latex processing produces a .acr files and makeindex then
# is used to convert the .acr file to a .acn file which is then ... . This dependency assumes the glossaries package.
add_cus_dep( 'acn', 'acr', 0, 'makeacn2acr' );
sub makeacn2acr {
    system( "makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"" );
}
# for glossary package (Sigh...) --- they can co-exist!		
add_cus_dep( 'acr', 'acn', 0, 'makeacr2acn' );
sub makeacr2acn {
    system( "makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acn\" \"$_[0].acr\"" );
}
# example of an added custom glossary type that is used in some of the glossary/glossaries example files:
# this is for the new glossary type command \newglossary[nlg]{notation}{not}{ntn}{Notation} from the glossaries package
# NOTE: the glossary package uses a very different command: the <in-ext> and <out-ext>
# are reversed in the calling sequence :-(
add_cus_dep( 'ntn', 'not', 0, 'makentn2not' );
sub makentn2not {
    system("makeindex -s \"$_[0].ist\" -t \"$_[0].nlg\" -o \"$_[0].not\" \"$_[0].ntn\"" );
}
# for the	glossary package (Sigh...) --- they can co-exist!
add_cus_dep( 'not', 'ntn', 0, 'makenot2ntn' );
sub makenot2ntn {
    system("makeindex -s \"$_[0].ist\" -t \"$_[0].nlg\" -o \"$_[0].ntn\" \"$_[0].not\"" );
}

# dependencies for custom indexes using the index package
# examples for sample.tex for index package:
 add_cus_dep( 'adx', 'and', 0, 'makeadx2and' );
sub makeadx2and {
    system( "makeindex -o \"$_[0].and\" \"$_[0].adx\"" );
}
add_cus_dep( 'ndx', 'nnd', 0, 'makendx2nnd' );
sub makendx2nnd {
    system( "makeindex -o \"$_[0].nnd\" \"$_[0].ndx\"" );
}
add_cus_dep( 'ldx', 'lnd', 0, 'makeldx2lnd' );
sub makeldx2lnd {
    system( "makeindex -o \"$_[0].lnd\" \"$_[0].ldx\"" );
}

# Custom dependency and function for nomencl package
add_cus_dep( 'nlo', 'nls', 0, 'makenlo2nls' );
sub makenlo2nls {
    system( "makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"" );
}

# Custom dependency and function(s) for epstopdf package

# FOR USERS OF epstopf v1.4 and before: should also work with v1.5 and later
# note: you may get extras runs if you use the .eps extension in the \includgraphics command
# deletes an outdated pdf-image, and triggers a pdflatex-run
add_cus_dep( 'eps', 'pdf', 0, 'cus_dep_delete_dest' );

# FOR USERS OF epstopdf v1.5 and later only:
# load it as \usepackage[update,prepend]{epstopdf}
# detects an outdated pdf-image, and triggers a pdflatex-run
#add_cus_dep( 'eps', 'pdf', 0, 'cus_dep_require_primary_run' );

# Custom dependency to convert tif to png
add_cus_dep( 'tif', 'png', 0, 'maketif2png' );
sub maketif2png {
    system( "convert \"$_[0].tif\" \"$_[0].png\"" );
}

# Custom dependency for mpost files
add_cus_dep('mp', '1', 0, 'mpost');
sub mpost {
    my $file = $_[0];
    my ($name, $path) =  fileparse( $file );
    pushd( $path );
    my $return = system "mpost $name" ;
    popd();
    return $return;
}

# use inkscape for missing pdf_tex files
add_cus_dep('svg', 'pdf_tex', 0, 'svg2pdf');
sub svg2pdf {
    system("inkscape -D -z --file=\"$_[0].svg\" --export-pdf=\"$_[0].pdf\" --export-latex");
}
