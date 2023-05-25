%%h-physrev4.bst
%%Modified by Marek Szuba to acommodate new format of eprint references (archivePrefix:eprint [primaryClass])
%%h-physrev3.bst
%%Modified to avoid extra comma at end of citations
%%h-physrev2.bst
%%Jonathan Flynn's h-physrev.bst modified to allow citation information
%%for SPIRES processing by Heath O'Connell following suggestions by
%%Jacques Distler.

ENTRY
{ address
archivePrefix
primaryClass
eprint
author
booktitle
chapter
collaboration
SLACcitation
edition
editor
howpublished
institution
journal
key
month
note
number
organization
pages
publisher
school
series
title
type
volume
year
}
{}
{ label }
INTEGERS { output.state before.all mid.sentence after.sentence after.block }
FUNCTION {init.state.consts}
{ #0 'before.all :=
#1 'mid.sentence :=
#2 'after.sentence :=
#3 'after.block :=
}
STRINGS { s t }
FUNCTION {output.nonnull}
{ 's :=
output.state mid.sentence =
{ ", " * write$ }
{ output.state after.block =
{ "," * write$
newline$
"\newblock " write$
}
{ output.state before.all =
'write$
{ add.period$ " " * write$ }
if$
}
if$
mid.sentence 'output.state :=
}
if$
s
}
FUNCTION {output}
{ duplicate$ empty$
'pop$
'output.nonnull
if$
}
FUNCTION {output.check}
{ 't :=
duplicate$ empty$
{ pop$ "empty " t * " in " * cite$ * warning$ }
'output.nonnull
if$
}
FUNCTION {output.bibitem}
{ newline$
"\bibitem{" write$
cite$ write$
"}" write$
newline$
""
before.all 'output.state :=
}
FUNCTION {fin.entry}
{ add.period$
write$
% modified to add SLACcitation field if present
SLACcitation empty$
  'skip$
  { newline$ SLACcitation write$ }
  if$
% end of modification
newline$
}
FUNCTION {new.block}
{ output.state before.all =
'skip$
{ after.block 'output.state := }
if$
}
FUNCTION {new.sentence}
{ skip$
}
FUNCTION {not}
{   { #0 }
{ #1 }
if$
}
FUNCTION {and}
{   'skip$
{ pop$ #0 }
if$
}
FUNCTION {or}
{   { pop$ #1 }
'skip$
if$
}
FUNCTION {new.block.checka}
{ empty$
'skip$
'new.block
if$
}
FUNCTION {new.block.checkb}
{ empty$
swap$ empty$
and
'skip$
'new.block
if$
}
FUNCTION {new.sentence.checka}
{ empty$
'skip$
'new.sentence
if$
}
FUNCTION {new.sentence.checkb}
{ empty$
swap$ empty$
and
'skip$
'new.sentence
if$
}
FUNCTION {field.or.null}
{ duplicate$ empty$
{ pop$ "" }
'skip$
if$
}
FUNCTION {emphasize}
{ duplicate$ empty$
{ pop$ "" }
{ "{\em " swap$ * "}" * }
if$
}
FUNCTION {embolden}
{ duplicate$ empty$
{ pop$ "" }
{ "{\bf " swap$ * "}" * }
if$
}
FUNCTION {paren}
{ duplicate$ empty$
{ pop$ "" }
{ "(" swap$ * ")" * }
if$
}
INTEGERS { nameptr namesleft numnames }
INTEGERS { etal }
FUNCTION {format.names}
{ 's :=
#1 'nameptr :=
s num.names$ 'numnames :=
numnames #5 >
s numnames "{ll}" format.name$ "others" = numnames #1 > and
or 'etal :=
etal
{ #1 #1 + 'namesleft := }
{ numnames 'namesleft := }
if$
{ namesleft #0 > }
{ s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
nameptr #1 >
{ namesleft #1 >
{ ", " * t * }
{ nameptr #2 >
{ "," * }
'skip$
if$
t "others" =
etal or
{ " {\em et~al.}" * }
{ " and " * t * }
if$
}
if$
}
't
if$
nameptr #1 + 'nameptr :=
namesleft #1 - 'namesleft :=
}
while$
}
FUNCTION {format.authors}
{ author empty$
{ "" }
{ author format.names }
if$
}
FUNCTION {format.editors}
{ editor empty$
{ "" }
{ editor format.names
editor num.names$ #1 >
{ ", editors" * }
{ ", editor" * }
if$
}
if$
}
FUNCTION {format.edited}
{ editor empty$
{ "" }
{ "edited by " editor format.names * }
if$
}
FUNCTION {format.eprint}
{ archivePrefix empty$
{ eprint }
{ archivePrefix ":" * eprint * }
if$
}
FUNCTION {format.title}
{ title empty$
{ "" }
{ title "t" change.case$ }
if$
}
FUNCTION {n.dashify}
{ 't :=
""
{ t empty$ not }
{ t #1 #1 substring$ "-" =
{ t #1 #2 substring$ "--" = not
{ "--" *
t #2 global.max$ substring$ 't :=
}
{   { t #1 #1 substring$ "-" = }
{ "-" *
t #2 global.max$ substring$ 't :=
}
while$
}
if$
}
{ t #1 #1 substring$ *
t #2 global.max$ substring$ 't :=
}
if$
}
while$
}
FUNCTION {first.page}
{ 't :=
""
{  t empty$ not t #1 #1 substring$ "-" = not and }
{ t #1 #1 substring$ *
t #2 global.max$ substring$ 't :=
}
while$
}
FUNCTION {format.date}
{ year empty$
{ "" }
'year
if$
}
%FUNCTION {format.SLACcitation}
%{ SLACcitation empty$
%  {""}
%  { SLACcitation }
%  if$
%}
FUNCTION {format.btitle}
{ title emphasize
}
FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
{ "~" }
{ " " }
if$
swap$ * *
}
FUNCTION {either.or.check}
{ empty$
'pop$
{ "can't use both " swap$ * " fields in " * cite$ * warning$ }
if$
}
FUNCTION {format.bvolume}
{ volume empty$
{ "" }
{ series empty$
'skip$
{ ", " series * }
if$
" Vol." volume tie.or.space.connect *
"volume and number" number either.or.check
}
if$
}
FUNCTION {format.number.series}
{ volume empty$
{ number empty$
{ series field.or.null }
{  series empty$
{ "there's a number but no series in " cite$ * warning$ }
{ ", " series * }
if$
" No. " number tie.or.space.connect *
}
if$
}
{ "" }
if$
}
FUNCTION {format.edition}
{ edition empty$
{ "" }
{ output.state mid.sentence =
{ ", " edition "l" change.case$ *  }
{ ", " edition "t" change.case$ *  }
if$
" ed." *
}
if$
}
INTEGERS { multiresult }
FUNCTION {multi.page.check}
{ 't :=
#0 'multiresult :=
{ multiresult not
t empty$ not
and
}
{ t #1 #1 substring$
duplicate$ "-" =
swap$ duplicate$ "," =
swap$ "+" =
or or
{ #1 'multiresult := }
{ t #2 global.max$ substring$ 't := }
if$
}
while$
multiresult
}
FUNCTION {format.pages}
{ pages empty$
{ "" }
{ pages multi.page.check
{ "pp." pages n.dashify tie.or.space.connect }
{ "p." pages tie.or.space.connect }
if$
}
if$
}
FUNCTION {format.pages.a}
{ pages empty$
{ "" }
{ "p." pages first.page tie.or.space.connect }
if$
}
FUNCTION {format.vol.num.pages}
{ volume field.or.null embolden
" " swap$ * *
pages empty$
'skip$
{ duplicate$ empty$
{ pop$ format.pages.a }
{ ", " * pages first.page * }
if$
}
if$
}
FUNCTION {format.chapter.pages}
{ chapter empty$
'format.pages
{ type empty$
{ "chap." }
{ type "l" change.case$ }
if$
chapter tie.or.space.connect
pages empty$
'skip$
{ ", " * format.pages * }
if$
}
if$
}
FUNCTION {format.pub.addr.date}
{ publisher empty$
{ "" "empty publisher in " cite$ * warning$ }
{ publisher
address empty$
'skip$
{ ", " * address * }
if$
}
if$
year empty$
{ "empty year in " cite$ * warning$ }
{ ", " * year * }
if$
paren " " swap$ *
}
FUNCTION {format.book.entry}
{ format.btitle
format.bvolume *
format.number.series *
format.edition *
format.pub.addr.date *
}
FUNCTION {format.inbook.entry}
{ format.book.entry
", " *
format.chapter.pages *
}
FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
{ "" }
{ editor empty$
{ "in " booktitle emphasize * }
{ "in " booktitle emphasize * ", " * format.edited * }
if$
}
if$
}
FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
month empty$ year empty$ note empty$
and and and and and
{ "all relevant fields are empty in " cite$ * warning$ }
'skip$
if$
}
FUNCTION {format.thesis.type}
{ type empty$
'skip$
{ pop$
type "t" change.case$
}
if$
}
FUNCTION {format.inst.tr.num.date}
{ institution empty$
{ "" "empty institution in " cite$ * warning$ }
{ institution }
if$
" Report No." *
number empty$
{ "" }
{ number tie.or.space.connect }
if$
year empty$
{ "empty year in " cite$ * warning$ }
{ ", " * year * " (unpublished)" * }
if$
}
FUNCTION {format.article.crossref}
{ key empty$
{ journal empty$
{ "need key or journal for " cite$ * " to crossref " * crossref *
warning$
""
}
{ "In " journal * }
if$
}
{ "In " key * }
if$
" \cite{" * crossref * "}" *
}
FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
editor num.names$ duplicate$
#2 >
{ pop$ " {\em et~al.}" * }
{ #2 <
'skip$
{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
{ " {\em et~al.}" * }
{ " and " * editor #2 "{vv~}{ll}" format.name$ * }
if$
}
if$
}
if$
}
FUNCTION {format.book.crossref}
{ volume empty$
{ "empty volume in " cite$ * "'s crossref of " * crossref * warning$
"In "
}
{ "Volume" volume tie.or.space.connect
" of " *
}
if$
editor empty$
editor field.or.null author field.or.null =
or
{ key empty$
{ series empty$
{ "need editor, key, or series for " cite$ * " to crossref " *
crossref * warning$
"" *
}
{ "{\em " * series * "\/}" * }
if$
}
{ key * }
if$
}
{ format.crossref.editor * }
if$
" \cite{" * crossref * "}" *
}
FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
editor field.or.null author field.or.null =
or
{ key empty$
{ booktitle empty$
{ "need editor, key, or booktitle for " cite$ * " to crossref " *
crossref * warning$
""
}
{ "In {\em " booktitle * "\/}" * }
if$
}
{ "In " key * }
if$
}
{ "In " format.crossref.editor * }
if$
" \cite{" * crossref * "}" *
}
FUNCTION {article}
{ output.bibitem
collaboration embolden output
format.authors "author" output.check
new.block
format.title "title" output.check
new.block
crossref missing$
{ journal field.or.null
format.vol.num.pages 
format.date empty$
'skip$
{ duplicate$ empty$
{ pop$ format.date paren }
{ " " * format.date paren * }
if$
}
if$
output
}
{ format.article.crossref output.nonnull
format.pages output
}
if$
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {book}
{ output.bibitem
collaboration output
author empty$
{ format.editors "author and editor" output.check }
{ format.authors output.nonnull
crossref missing$
{ "author and editor" editor either.or.check }
'skip$
if$
}
if$
new.block
crossref missing$
{ format.book.entry output }
{ new.block
format.book.crossref output.nonnull
}
if$    
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {booklet}
{ output.bibitem
collaboration output
format.authors output
new.block
format.title "title" output.check
howpublished address new.block.checkb
howpublished output
address output
format.date output
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {inbook}
{ output.bibitem
collaboration output
author empty$
{ format.editors "author and editor" output.check }
{ format.authors output.nonnull
crossref missing$
{ "author and editor" editor either.or.check }
'skip$
if$
}
if$
new.block
crossref missing$
{ format.inbook.entry output }
{ format.chapter.pages "chapter and pages" output.check
new.block
format.book.crossref output.nonnull
}
if$
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {incollection}
{ output.bibitem
collaboration output
format.authors "author" output.check
new.block
format.title "title" output.check
new.block
crossref missing$
{ format.in.ed.booktitle "booktitle" output.check
format.bvolume output
format.number.series output
format.chapter.pages output
new.sentence
publisher "publisher" output.check
address output
format.edition output
format.date "year" output.check
}
{ format.incoll.inproc.crossref output.nonnull
format.chapter.pages output
}
if$
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {inproceedings}
{ output.bibitem
collaboration output
format.authors "author" output.check
new.block
format.title "title" output.check
new.block
crossref missing$
{ format.in.ed.booktitle "booktitle" output.check
format.bvolume output
format.number.series output
format.pages output
address empty$
{ organization publisher new.sentence.checkb
organization output
publisher output
format.date "year" output.check
}
{ address output.nonnull
format.date "year" output.check
new.sentence
organization output
publisher output
}
if$
}
{ format.incoll.inproc.crossref output.nonnull
format.pages output
}
if$
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {conference} { inproceedings }
FUNCTION {manual}
{ output.bibitem
collaboration output
author empty$
{ organization empty$
'skip$
{ organization output.nonnull
address output
}
if$
}
{ format.authors output.nonnull }
if$
new.block
format.btitle "title" output.check
author empty$
{ organization empty$
{ address new.block.checka
address output
}
'skip$
if$
}
{ organization address new.block.checkb
organization output
address output
}
if$
format.edition output
format.date output
format.eprint output
new.block
note output
fin.entry
}
FUNCTION {mastersthesis}
{ output.bibitem
format.authors "author" output.check
new.block
format.title "title" output.check
new.block
"Master's thesis" format.thesis.type output.nonnull
school "school" output.check
address output
format.date "year" output.check
format.eprint output
new.block
note output
fin.entry
}
FUNCTION {misc}
{ output.bibitem
collaboration output
format.authors output
title howpublished new.block.checkb
format.title output
howpublished new.block.checka
howpublished output
format.date output
format.eprint output
new.block
note output
fin.entry
empty.misc.check
}
FUNCTION {phdthesis}
{ output.bibitem
format.authors "author" output.check
new.block
format.btitle "title" output.check
new.block
"PhD thesis" format.thesis.type output.nonnull
school "school" output.check
address output
format.date "year" output.check
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {proceedings}
{ output.bibitem
collaboration output
new.block
format.title "title" output.check
new.block
editor empty$
{ organization output }
{ format.editors output.nonnull }
if$
new.block
format.btitle "title" output.check
format.bvolume output
format.number.series output
address empty$
{ editor empty$
{ publisher new.sentence.checka }
{ organization publisher new.sentence.checkb
organization output
}
if$
publisher output
format.date "year" output.check
}
{ address output.nonnull
format.date "year" output.check
new.sentence
editor empty$
'skip$
{ organization output }
if$
publisher output
}
if$
format.eprint output
new.block
note output
%format.SLACcitation output
fin.entry
}
FUNCTION {techreport}
{ output.bibitem
collaboration output
format.authors "author" output.check
new.block
format.inst.tr.num.date output.nonnull
format.eprint output
new.block
note output
fin.entry
}
FUNCTION {unpublished}
{ output.bibitem
collaboration output
format.authors "author" output.check
new.block
format.title "title" output.check
new.block
note "note" output.check
format.date output
%format.SLACcitation output
fin.entry
}
FUNCTION {default.type} { misc }
MACRO {jan} {"Jan."}
MACRO {feb} {"Feb."}
MACRO {mar} {"Mar."}
MACRO {apr} {"Apr."}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {jul} {"July"}
MACRO {aug} {"Aug."}
MACRO {sep} {"Sept."}
MACRO {oct} {"Oct."}
MACRO {nov} {"Nov."}
MACRO {dec} {"Dec."}
MACRO {acmcs} {"ACM Comput. Surv."}
MACRO {acta} {"Acta Inf."}
MACRO {cacm} {"Commun. ACM"}
MACRO {ibmjrd} {"IBM J. Res. Dev."}
MACRO {ibmsj} {"IBM Syst.~J."}
MACRO {ieeese} {"IEEE Trans. Softw. Eng."}
MACRO {ieeetc} {"IEEE Trans. Comput."}
MACRO {ieeetcad}
{"IEEE Trans. Comput.-Aided Design Integrated Circuits"}
MACRO {ipl} {"Inf. Process. Lett."}
MACRO {jacm} {"J.~ACM"}
MACRO {jcss} {"J.~Comput. Syst. Sci."}
MACRO {scp} {"Sci. Comput. Programming"}
MACRO {sicomp} {"SIAM J. Comput."}
MACRO {tocs} {"ACM Trans. Comput. Syst."}
MACRO {tods} {"ACM Trans. Database Syst."}
MACRO {tog} {"ACM Trans. Gr."}
MACRO {toms} {"ACM Trans. Math. Softw."}
MACRO {toois} {"ACM Trans. Office Inf. Syst."}
MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}
MACRO {tcs} {"Theoretical Comput. Sci."}
MACRO {advp} {"Adv. Phys."}
MACRO {ajp} {"Am. J. Phys."}
MACRO {ao} {"Appl. Opt."}
MACRO {apj} {"Astrophys. J."}
MACRO {apl} {"Appl. Phys. Lett."}
MACRO {arnps} {"Ann. Rev. Nucl. Sci."}
MACRO {arns} {"Ann. Rev. Nucl. Part. Sci."}
MACRO {baps} {"Bull. Am. Phys. Soc."}
MACRO {cpc} {"Computer Phys. Comm."}
MACRO {cppcf} {"Comments Plasma Phys. Controlled Fusion"}
MACRO {fed} {"Fusion Eng. Design"}
MACRO {ft} {"Fusion Tech."}
MACRO {ieeens} {"IEEE Trans. Nucl. Sci."}
MACRO {ieeeps} {"IEEE Trans. Plasma Sci."}
MACRO {ijimw} {"Int. J. Infrared Millimeter Waves"}
MACRO {ip} {"Infrared Phys."}
MACRO {jap} {"J. Appl. Phys."}
MACRO {jcp} {"J. Comput. Phys."}
MACRO {jetp} {"Sov. Phys.-JETP"}
MACRO {jfe} {"J. Fusion Energy"}
MACRO {jfm} {"J. Fluid Mech."}
MACRO {jgr} {"J. Geophys. Res."}
MACRO {jmp} {"J. Math. Phys."}
MACRO {jne} {"J. Nucl. Energy"}
MACRO {jnm} {"J. Nucl. Mater."}
MACRO {josa} {"J. Opt. Soc. Am."}
MACRO {jpg} {"J. Phys.~G: Nucl. and Part. Phys."}
MACRO {jphys} {"J. Phys"}
MACRO {jpp} {"J. Plasma Phys."}
MACRO {jpsj} {"J. Phys. Soc. Jpn"}
MACRO {jvst} {"J. Vac. Sci. Technol."}
MACRO {modphyslettA} {"Mod. Phys. Lett. A"}
MACRO {nedf} {"Nucl. Eng. Design/Fusion"}
MACRO {nf} {"Nucl. Fusion"}
MACRO {nim} {"Nucl. Instrum. Methods"}
MACRO {np} {"Nucl. Phys."}
MACRO {npb} {"Nucl. Phys.~B"}
MACRO {npbps} {"Nucl. Phys. B (Proc. Suppl.)"}
MACRO {nt/f} {"Nucl. Tech./Fusion"}
MACRO {pf} {"Phys. Fluids"}
MACRO {pl} {"Phys. Lett."}
MACRO {plb} {"Phys. Lett.~B"}
MACRO {pnas} {"Proc. Nat. Acad. Sci. USA"}
MACRO {pp} {"Plasma Phys."}
MACRO {physrep} {"Phys. Rep."}
MACRO {physrev} {"Phys. Rev."}
MACRO {pr} {"Phys. Rev."}
MACRO {prd} {"Phys. Rev.~D"}
MACRO {prl} {"Phys. Rev. Lett."}
MACRO {procroysoc} {"Proc. Roy. Soc"}
MACRO {ps} {"Physica Scripta"}
MACRO {rmp} {"Rev. Mod. Phys."}
MACRO {rsi} {"Rev. Sci. Instrum."}
MACRO {sjnp} {"Sov. J. Nucl. Phys."}
MACRO {sjpp} {"Sov. J. Plasma Phys."}
MACRO {spd} {"Sov. Phys.-Dokl."}
MACRO {sptp} {"Sov. Phys.-Tech. Phys."}
MACRO {spu} {"Sov. Phys.-Usp."}
MACRO {zp} {"Z. Phys."}
MACRO {zpc} {"Z. Phys.~C"}
READ
STRINGS { longest.label }
INTEGERS { number.label longest.label.width }
FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
#1 'number.label :=
#0 'longest.label.width :=
}
FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
number.label #1 + 'number.label :=
label width$ longest.label.width >
{ label 'longest.label :=
label width$ 'longest.label.width :=
}
'skip$
if$
}
EXECUTE {initialize.longest.label}
ITERATE {longest.label.pass}
FUNCTION {begin.bib}
{ preamble$ empty$
'skip$
{ preamble$ write$ newline$ }
if$
"\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}
EXECUTE {begin.bib}
EXECUTE {init.state.consts}
ITERATE {call.type$}
FUNCTION {end.bib}
{ newline$
"\end{thebibliography}" write$ newline$
}
EXECUTE {end.bib}
