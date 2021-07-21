# Copyright 2004 Chris Monson (shiblon@gmail.com)
#           2011 Andrew McNabb
#           2013 Krishna Kumar
#           2017 Holger Nahrstaedt
# Latest version available at http://www.bouncingchairs.net/oss
#
#    This file is part of ``Chris Monson's Free Software''.
#
#    ``Chris Monson's Free Software'' is free software; you can redistribute it
#    and/or modify it under the terms of the GNU General Public License as
#    published by the Free Software Foundation, Version 2.
#
#    ``Chris Monson's Free Software'' is distributed in the hope that it will
#    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
#    Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with ``Chris Monson's Free Software''; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#    It is also available on the web at http://www.gnu.org/copyleft/gpl.html
#
#    Note that using this makefile to build your documents does NOT place them
#    under the GPL unless you, the author, specifically do so.  In other words,
#    I, Chris Monson, the copyright holder and author of this makefile,
#    consider it impossible to ``link'' to this makefile in any way covered by
#    the GPL.
#
#
# TO OBTAIN INSTRUCTIONS FOR USING THIS FILE, RUN:
#    make help
#
fileinfo	:= LaTeX Makefile
author		:= Chris Monson
version		:= 2.2.1-alpha10
#
.DEFAULT_GOAL	:= all
# Note that the user-global version is imported *after* the source directory,
# so that you can use stuff like ?= to get proper override behavior.
.PHONY: Makefile GNUmakefile Makefile.ini $(HOME)/.latex-makefile/Makefile.ini
-include Makefile.ini
-include $(HOME)/.latex-makefile/Makefile.ini
# Better names for these things
.PHONY: Variables.ini $(HOME)/.latex-makefile/Variables.ini
-include Variables.ini
-include $(HOME)/.latex-makefile/Variables.ini
#
# This can be pdflatex or latex - you can change this by adding the following line to your Makefile.ini:
# BUILD_STRATEGY := latex
BUILD_STRATEGY		?= pdflatex
#BIB_STRATEGY		?= biblatex
BIB_STRATEGY		?= bibtex
# This can be used to pass extra options to latex.
LATEX_OPTS		?=
#
# Sets LC_ALL=C, by default, so that the locale-aware tools, like sort, be
# # immune to changes to the locale in the user environment.
export LC_ALL		?= C
#
#
# If you specify sources here, all other files with the same suffix
# will be treated as if they were _include_ files.
#onlysources.tex	?= main.tex
#onlysources.lhs	?=
#onlysources.tex.sh	?=
#onlysources.tex.pl	?=
#onlysources.tex.py	?=
#onlysources.rst	?=
#onlysources.mp		?=
#onlysources.fig	?=
#onlysources.gpi	?=
#onlysources.dot	?=
#onlysources.xvg	?=
#onlysources.svg	?=
#onlysources.eps.gz	?=
#onlysources.eps	?=
#
# If you list files here, they will be treated as _include_ files
#includes.tex		?= file1.tex file2.tex
#includes.lhs		?=
#includes.tex.sh	?=
#includes.tex.pl	?=
#includes.tex.py	?=
#includes.rst		?=
#includes.mp		?=
#includes.fig		?=
#includes.gpi		?=
#includes.dot		?=
#includes.xvg		?=
#includes.svg		?=
#includes.eps.gz	?=
#includes.eps		?=
#
# If you list files or wildcards here, they will *not* be cleaned - default is
# to allow everything to be cleaned.
#neverclean		?= *.pdf
#
# Alternatively (recommended), you can add those lines to a Makefile.ini file
# and it will get picked up automatically without your having to edit this
# Makefile.
#
# KNOWN ISSUES:
# * The following occurs:
#   file with: \usepackage{named}\bibliographystyle{named}
#   Compile
#   change to: \usepackage{apalike}\bibliographystyle{apalike}
#   Compile again -- BARF!
#
#   The workaround: make clean-nographics; make
#
#   Note that we may not be able to fix this.  LaTeX itself barfs
#   on this, not the makefile.  The very first invocation of LaTeX
#   (when something like this has happened) reads the existing .aux
#   file and discovers invalid commands like \citeauthoryear that
#   are only valid in the package that was just removed.  It then
#   tries to parse them and explodes.  It's not at all clear to me
#   how to fix this.  I tried removing the .aux files on the first
#   run of LaTeX, but that necessarily requires more subsequent
#   rebuilds on common edits.  There does not appear to be a
#   graceful solution to this issue.
#
#
# CHANGES:
# Holger Nahrstaedt (2017-09-25):
# * Bumped version to 2.2.1-alpha10
# * Added XELATEX and LUALATEX to BUILD_STRATEGY
# * New option BIB_STRATEGY, can be biblatex or bibtex
# * Added all Authors to Copyright section
# * Added asymptote file generation
# * Added shell-escape to pdflatex, xelatex and lualatex
# Krishna Kumar (2013-11-27):
# * Added PS to rm_ext to remove PS files generated during LaTeX output
# Krishna Kumar (2013-11-26):
# * Changed PS_EMBED_OPTION ?= -dPDFSETTINGS=/prepress from /printer
#
# Chris Monson (2012-06-25):
# * Bumped version to 2.2.1-alpha9
# * Built with Holger Dell's changes to fix multiple unnecessary compilations.
# Chris Monson (2011-11-10):
# * Issue 144: Help patch from girard.nicolas applied
# Andrew McNabb (2011-09-30):
# * Bumped version to 2.2.1-alpha8
# * Issue 141: No font embedding for gnuplot when not doing pdf
# * Syntax error fixed for gpi handling code
# Chris Monson (2011-09-06):
# * Issue 140: clean mlt*, mlf*, and mtc* files
# * Issue 136: initial support for metapost files
# Chris Monson (2011-08-09):
# * Bumped version to 2.2.1-alpha7
# * Issue 138: existing .eps files now included correctly
# * Issue 139: added missing backslash to ps build rule
# Chris Monson (2011-07-20):
# * Added LATEX_OPTS
# Chris Monson (2011-06-23):
# * Bumped version to 2.2.1-alpha6
# * Issue 133: Set jobname to fix .fls generation to always have the source name
# * Removed unnecessary (?) double-invocation of cygpath
# Chris Monson (2011-06-16):
# * Added support for keeping .rst and .lhs tex intermediates around.
# * Separated scripts from source generation files (rst and lhs)
# * Fixed run-script problem for lhs2tex (was invoked incorrectly)
# * Issue 133: Fixed typo from literate Haskell support
# Chris Monson (2011-06-13):
# * Bumped version to 2.2.1-alpha5
# * Fixed problems with detecting graphics for very long source names.
# Chris Monson (2011-06-13):
# * Issue 134: name of self corrected for dependency graph
# * Issue 133: Added literate Haskell support (lhs2tex)
# Chris Monson (2011-05-31):
# * Rewrote specials (%%COMMENTS) to be easier to extend and parse.
# Chris Monson (2011-05-11):
# * Bumped version to 2.2.1-alpha4
# * Issue 129: nomenclature dependency fix
# Chris Monson (2011-05-09):
# * Bumped version to 2.2.1-alpha3
# * Issue 112: Cygpath fixes
# Chris Monson (2011-04-27):
# * Bumped version to 2.2.1-alpha2
# * Issue 126: Broken log parsing for latex pipeline
# * Fixed month in recent changes (had May, should be April)
# * Noticed problems with some existing parsing (colorizing errors, notably) and
#     fixed them.
# * New test case for specified graphic extensions.
# * Added .bb generation for .eps files (when extensionless in latex pipeline)
# Chris Monson (2011-04-22):
# * Bumped version to 2.2.1-alpha1
# * Issue 105: add support for format file detection and compilation
# Chris Monson (2011-04-20):
# * Bumped version to 2.2.0 (release!)
# Chris Monson (2011-04-19):
# * Bumped version to 2.2.0-rc15
# * Issue 125: infinite recursion with nomenclature files
# * Issue 125: removed .d as a target for .nls in get-log-index
# * Cleaned up invocation of run-makeindex to take an optional .ist instead of flags.
# Chris Monson (2011-04-06):
# * Bumped version to 2.2.0-rc14
# * Issue 121: Added Targets.ini and corresponding help text for it.
# * Issue 121: Added Variables.ini (Makefile.ini still works, though).
# * Issue 121: Added .DEFAULT_GOAL optional setting.
# * Issue 120: xindy compatibility
# Chris Monson (2011-03-16):
# * Bumped version to 2.2.0-rc13
# * Fixed a bug in kspewhich invocation - random characters and a missing pipe.
# * Added font embedding to gnuplot output.
# Chris Monson (2011-03-15):
# * Bumped version to 2.2.0-rc12
# * Issue 119: Annoying warning from which if Gnuplot not installed.
# * Fixed catchall error output to show more info from the log.  Cutting off the
#     first line is too jarring.
# * Issue 118: Better glossary support
# Chris Monson (2011-03-03):
# * Bumped version to 2.2.0-rc11
# * Issue 112: Fixed regression introduced by use of cygpath (ugly warnings)
# Chris Monson (2011-02-03):
# * Bumped version to 2.2.0-rc10
# * Issue 112: Added path normalization for cygwin systems
# * Fixed a bug in get-missing-inputs where we weren't specifying target files
# Chris Monson (2011-01-24):
# * Issue 111: Added .jpeg as a possible image extension
# Chris Monson (2011-01-21):
# * Issue 110: Long filenames not produced correctly in .d file
# * Fixed problem with unknown control sequence error parsing
# * Fixed problem with \r in fatal output (was interpreted as LF by echo)
# * Removed a spurious "hi"
# Chris Monson (2011-01-14):
# * Bumped version to 2.2.0-rc8
# * Issue 107: Removed comment with embedded newline, fixing MinGW on Windows 7.
# Chris Monson (2011-01-07):
# * Emit an error if .gpi.d files have dependencies with : in the name
# Chris Monson (2011-01-05):
# * Bumped version to 2.2.0-rc7
# * Issue 106: existing graphic dependencies not generated correctly
# Chris Monson (2011-01-04):
# * Issue 106: not cleaning eps log files properly
# * Issue 106: not rebuilding after creating .pdf graphics from .eps
# * Issue 94: svg going unnecessarily through eps (can't reproduce)
# Chris Monson (2010-12-31):
# * Issue 100: make hanging because of faulty graphics detection (sed bug)
# * Issue 108: do not ignore fatal errors from pdftex
# Chris Monson (2010-12-23):
# * Added gpi_global to gnuplot dependencies so that changes are detected
# Chris Monson (2010-12-20):
# * Updated build file to be smarter about Python version detection
# * Created a bunch of test files and supporting scripts
# * Issue 72: added apacite capaability (thanks to matkarat)
# Chris Monson (2010-11-23):
# * Changed to multi-part makefile build (split out sed scripts)
# * Added build script and supporting infrastructure
# * Updated test directory format
# * Added notes about needed test cases
# * Changed to use -file-line-error and fixed multiple inclusion/error bugs
# * Added run_sed.py to allow easy testing of sed scripts outside of make
# Chris Monson (2010-11-11):
# * Bumped version to 2.2.0-rc7
# * issue 92: broken hyperref driver detection fixed
# * issue 101: Broken inkscape conversion
# * issue 102: Broken specification of font size for gnuplot pdfcairo
# * Added KEEP_TEMP so that we can avoid deleting useful temporaries for debugging
# * Restructured gnuplot code to be easier to follow
# * Fixed a bug in convert-gpi where we were using $< instead of $1
# Chris Monson (2010-11-03):
# * Bumped version to 2.2.0-rc6
# * issue 96: Fix sed errors when using make variables in substitutions
# Chris Monson (2010-07-28):
# * Bumped version to 2.2.0-rc5 (rc4 is broken)
# * Bail out when we find the use of the import.sty package
# * Issue 90: Add -z to dvips invocation
# * Issue 67: Add xelatex support (thanks to Nikolai Prokoschenko for the patch!)
# * Issue 85: Add warning about make 3.80
# Chris Monson (2010-06-20):
# * Bumped version to 2.2.0-rc3
# * Attempt to fix bug with ! error detection (issue 88)
# * Added svg->pdf direct support (issue 89)
# Chris Monson (2010-04-28):
# * Bumped version to 2.2.0-rc2
# * Fixed %._show target
# Chris Monson (2010-04-08):
# * Bumped version to 2.2.0-rc1
# * Added back in the rst_style_file stuff that got broken when switching
#     rst -> tex to use the script mechanism
# Chris Monson (2010-03-23):
# * Bumped version to 2.2.0-beta8
# * Work on issue 76: bad backtick escape for some sed versions, failure
#     to clear out the hold buffer when outputting MISSING comment.
#     - Backed out 2>&1 to &> (doesn't work in sh)
#     - Backed out using . to source variables
# Chris Monson (2010-03-22):
# * Bumped version to 2.2.0-beta7
# * Issue 72: Fix latex/bibtex invocation order for annotated bib styles
# * Fixed informational output to reflect which LaTeX run we're on
# * Fixed graphic detection to include graphics that are already there in
#     .d files
# * Tightened up the .d file output to only make .d depend on graphic
#     *source* files.  This means that building foo.d no longer
#     builds all of the graphics files on which foo.tex depends.
#     Had to use .SECONDEXPANSION trickery to make it work.
# * Changed get-graphics to only accept a stem.
# * Fixed build-once logic for scripted .tex to work better
# * Made get-inputs sed script more maintainable.
# * Moved Makefile.ini import up higher.
# * Changed bare stems to not recursively invoke make
# * Updated diff output to be more silent everywhere
# * Added a MISSING comment to the .d file if stuff isn't found - forces
#     removal of .1st.make file, which often forces it to try again.
# * Fixed broken graphics-target function
# * Added sleep to .d file generation when stuff is missing - if it
#     builds too fast, make doesn't realize it needs to be reloaded,
#     and thus never discovers some deeper dependencies (especially
#     evident when graphics are included from scripted include
#     files).
# Chris Monson (2010-03-17):
# * Bumped version to 2.2.0-beta6
# * Fixed bareword builds to actually work (requires static patterns)
# * Fixed colorization to work with new paragraph stuff
# Chris Monson (2010-03-17):
# * Bumped version to 2.2.0-beta5
# * Fixed graphic detection to be much more focused - splits log file
#     into paragraphs before doing pattern matching.
# * Fixed make foo to work properly (recursively calls make foo.pdf)
# * Fixed gpi -> pdf generation to not waste time building .eps *after*
#     the pdf already exists.
# * Changed log copies to include MAKE_RESTARTS as part of the name.
# * Fixed missing include file detection (also makes use of the paragraph
#     stuff) to detect missing scripted include files.
# Chris Monson (2010-03-16):
# * Bumped version to 2.2.0-beta4
# * issue 70: .pdf not moved out of the way properly on first
#     compilation, resulting in early error detection failure.
# * issue 74: fixed broken error on missing .aux files: the
#     implementation was masking real errors.
# Chris Monson (2010-03-15):
# * Bumped version to 2.2.0-beta3
# * issue 71: Made the tput dependency optional
# * issue 73: Made .tex targets not pull in .d files (building them from
#     scripts should not require a .d)
# * issue 74: Output a much saner error when a .aux file is not produced
#     (e.g., when you are typing "make" without arguments in a
#     directory with included .tex files that are not named with
#     ._include_.)
# Chris Monson (2010-03-11):
# * Bumped version to 2.2.0-beta2
# * Fixed clean-graphics to get rid of intermediate .eps files that may
#     be hanging around
# * Added an automatic setting to use eps terminals in pdflatex mode for
#     gnuplot if it doesn't understand pdf.
# * issue 66: Removed grayscale generation via magic suffix.  Grayscale
#     generation is now only available via GRAY=1
# * issue 68: Added explicit handling of LC_ALL for locale-aware tools
#     like "sort"
# Chris Monson (2010-03-10):
# * Bumped version to 2.2.0-beta1
# * Fixed success message to handle output message in different places
# * Added name of produced file to success message
# Chris Monson (2010-03-10):
# * Bumped version to 2.2.0-alpha3
# * Added meaningful error message for wrong hyperref options
# * Added meaningful error message for incorrect graphics extensions
# Chris Monson (2010-03-09):
# * Bumped version to 2.2.0-alpha2
# * Updated graphics handling (gnuplot and fig generate pdf natively)
# * Changed xmgrace to output monochrome natively
# Chris Monson (2010-03-09):
# * Bumped version to 2.2.0-alpha1 - major change!
# * Support pdflatex natively and by default (issue 6 - a long time coming)
# * Add ability to have a single $HOME/.latex-makefile/Makefile.ini for
#     all invocations
# * Reworked graphic inclusion detection so that extensions need not be
#     specified for either build strategy (e.g.,
#     \includegraphics{test1.eps} -> \includegrahpics{test1})
# * Changed log format to include filenames and line numbers
# Chris Monson (2010-02-04):
# * Bumped version to 2.1.43
# * All of the following are for issue 63 (thanks to mojoh81):
# * Added documentation about fixing Makefile.ini default target
# * Added perl and python script targets
# * Fixed run logic to allow included .tex files to be scripted (the
#     run-again logic now detects missing .tex files, and the MV
#     command has been switched out for a command that only invokes
#     MV if the files exist)
# * Changed scripted generation to only run once per make invocation
# * Added dependency on expr
# Chris Monson (2010-01-19):
# * Bumped version to 2.1.42
# * issue 62: Added .brf extension to cleanable files (backrefs)
# Chris Monson (2010-01-07):
# * Bumped version to 2.1.41
# * issue 60: bad makeindex runs now error out on subsequent tries
# Chris Monson (2009-12-01):
# * Bumped version to 2.1.40
# * issue 36: build all indices (for e.g., splitidx usage)
# * issue 59: clean up all generated files (including indices)
# Chris Monson (2009-11-23):
# * Bumped version to 2.1.39
# * issue 57: change ps2pdf invocations to just use gs directly
# Chris Monson (2009-11-19):
# * Bumped version to 2.1.38
# * issue 57: Added some limited support for Cygwin (spaces in filenames)
# Chris Monson (2009-11-15):
# * Bumped version to 2.1.37
# * Removed svninfo, since this is now managed by mercurial
# * Fixed typo in changelist
# * Issue 52: added jpg->eps conversion (thanks to brubakee)
# * Issue 54: fix missing Overfull colorization due to lack of a blank
#     line preceding the first error.
# * Issue 51: remove head.tmp and body.tmp in make clean invocation
# * Issue 56: maintain multiple versions of log files (for debugging)
# Chris Monson (2009-11-14):
# * Bumped version to 2.1.36
# * Issues 53 and 49: added .brf, .mtc, and .maf to the cleanables
# Chris Monson (2009-11-05):
# * Bumped version to 2.1.35
# * Added nomenclature support (see issue 48)
# Chris Monson (2009-10-29):
# * Bumped version to 2.1.34
# * Fixed _out_ creation bug introduced in 2.1.33 (it was always created)
# * Fixed erroneous help output for $HOME in BINARY_TARGET_DIR
# * Changed contact email address - bring on the spam!
# Chris Monson (2009-10-21):
# * Bumped version to 2.1.33
# * Fixed issue 46, adding support for dot2tex (thanks to fdemesmay)
# * Made all_files.* settable in Makefile.ini (using ?= instead of :=)
# * Fixed issue 47, thanks to fdemesmay: add binary copy directory, copy
#     dvi, pdf, and ps if it exists
# Chris Monson (2009-09-25):
# * Bumped version to 2.1.32
# * Fixed so that a changed lol file will cause a rebuild
# * Added .lol files to the cleanable list
# Chris Monson (2009-09-08):
# * Bumped version to 2.1.31
# * Closed issue 43: evince doesn't notice pdf change w/out touch
# Chris Monson (2009-08-28):
# * Bumped version to 2.1.30
# * Closed issue 39: Capture multi-line log warnings/errors to output
# Chris Monson (2009-08-26):
# * Bumped version to 2.1.29
# * Closed issue 42: add svg support using inkscape
# Chris Monson (2009-08-17):
# * Bumped version to 2.1.28
# * Patch from paul.biggar for issue 38: package warnings are overlooked
# Chris Monson (2009-08-07):
# * Bumped version to 2.1.27
# * Included patch for issue 37 - removes pdf/ps files before copying,
#     allowing some broken viewers to see changes properly.
# Chris Monson (2009-05-15):
# * Bumped version to 2.1.26
# * Included patch for issue 9 from favonia - detects .fig changes for
#     pstex files during regular compilation, so long as the pstex
#     has been built at least once with make all-pstex.
# Chris Monson (2009-03-27):
# * Bumped version to 2.1.25
# * Cleaned up a bunch of variable setting stuff - more stuff is now
#     settable from Makefile.ini
# * Cleaned up documentation for various features, especially settable
#     variables.
# * issue 28: support for png -> eps conversion (it even looks good!)
# * issue 29: support for "neverclean" files in Makefile.ini
# * issue 30: make ps2pdf14 the default - fall back when not there
# Chris Monson (2009-03-09):
# * Bumped version to 2.1.24
# * issue 27: xmgrace support (thanks to rolandschulzhd)
# Chris Monson (2008-10-23):
# * Bumped version to 2.1.23
# * issue 23: fixed _check_programs to not use bash string subs
# Chris Monson (2008-09-02):
# * Bumped version to 2.1.22
# * Appled patch from Holger <yllohy@googlemail.com> to add include
#     sources and some documentation updates.
# * Updated backup_patterns to be a bit more aggressive (also thanks to
#     Holger)
# Chris Monson (2008-08-30):
# * Bumped version to 2.1.21
# * Added ability to specify onlysources.* variables to indicate the only
#     files that should *not* be considered includes.  Thanks to Holger
#     <yllohy@googlemail.com> for this patch.
# * Added an automatic include of Makefile.ini if it exists.  Allows
#     settings to be made outside of this makefile.
# Chris Monson (2008-05-21):
# * Bumped version to 2.1.20
# * Added manual pstex compilation support (run make all-pstex first)
# * Removed all automatic pstex support.  It was totally breaking
#     everything and is very hard to incorporate into the makefile
#     concept because it requires LaTeX to *fail* before it can
#     determine that it needs the files.
# Chris Monson (2008-04-17):
# * Bumped version to 2.1.19
# * Changed the pstex build hack to be on by default
# Chris Monson (2008-04-09):
# * Bumped version to 2.1.18
# * issue 16: fixed pstex build problems, seems nondeterministic.  Added
#     gratuitious hack for testing: set PSTEX_BUILD_ALL_HACK=1.
# Chris Monson (2008-04-09):
# * Bumped version to 2.1.17
# * issue 20: fixed accumulation of <pid>*.make files - wildcard was
#     refusing to work on files that are very recently created.
# Chris Monson (2008-04-02):
# * Bumped version to 2.1.16
# * issue 19: Removed the use of "type" to fix broken "echo" settings
# Chris Monson (2008-03-27):
# * Bumped version to 2.1.15
# * issue 18: Favors binary echo over builtin, as binary understands -n
# * issue 16: Fixed handling of missing pstex_t files in the log
# * issue 9: Added .SECONDARY target for .pstex files
# Chris Monson (2008-03-21):
# * Bumped version to 2.1.14
# * Fixed broken aux file flattening, which caused included bibs to be
#     missed.
# Chris Monson (2008-03-20):
# * Bumped version to 2.1.13
# * Changed error output colorization to show errors for missing files
#     that are not graphics files.
# Chris Monson (2008-03-20):
# * Bumped version to 2.1.12
# * Fixed a regression introduced in r28 that makes bibtex fail when
#     there is no index file present
# Chris Monson (2008-03-03):
# * Bumped version to 2.1.11
# * Fixed issue 11 (handle index files, reported by abachn)
# * Cleaned up some comments and help text
# Chris Monson (2008-01-24):
# * Bumped version to 2.1.10
# * Fixed to work when 'sh' is a POSIX shell like 'dash'
# Chris Monson (2007-12-12):
# * Bumped version to 2.1.9
# * Fixed documentation and dependency graph for pstex files
# Chris Monson (2007-12-12):
# * Bumped version to 2.1.8
# * Added basic pstex_t support for fig files (Issue 9 by favonia)
#     I still suggest that psfrag be used instead.
# Chris Monson (2007-10-16):
# * Bumped version to 2.1.7
# * Removed todo item: allow other comment directives for rst conversion
# * Added ability to use global rst style file _rststyle_._include_.tex
# * Added help text to that effect
# Chris Monson (2007-05-20):
# * Bumped version to 2.1.6
# * Changed default paper size for rst files
# * Added todo item: fix paper size for rst files
# * Added todo item: allow other comment directives for rst conversion
# Chris Monson (2007-04-02):
# * Bumped version to 2.1.5
# * Addressed Issue 7, incorrect .gpi.d generation in subdirectories
# Chris Monson (2007-03-28):
# * Bumped version to 2.1.4
# * Fixed syntax error in dot output
# Chris Monson (2007-03-01):
# * Bumped version to 2.1.3
# * Added reST to the included documentation
# * Fixed graphics and script generation to be settable in the
#     environment.
# Chris Monson (2007-02-23):
# * Bumped version to 2.1.2
# * Added the ability to generate .tex files from .rst files
# Chris Monson (2006-10-17):
# * Bumped version to 2.1.1
# * Fixed includes from subdirectories (sed-to-sed slash escape problem)
# Chris Monson (2006-10-05):
# * Bumped version to 2.1.0 (pretty serious new feature added)
# * New feature: bib files can now be anywhere on the BIBINPUTS path
# * New programs: kpsewhich (with tetex) and xargs (BSD)
# Chris Monson (2006-09-28):
# * Bumped version to 2.0.9
# * Added ability to parse more than one bibliography
# Chris Monson (2006-06-01):
# * Bumped version to 2.0.8
# * Added .vrb to the list of cleaned files
# Chris Monson (2006-04-26):
# * Bumped version to 2.0.7
# * Fixed so that clean-nographics does not remove .gpi.d files
# * Removed jpg -> eps hack (not working properly -- just pre-convert)
# * Fixed so that postscript grayscale can be done with BSD sed
# Chris Monson (2006-04-25):
# * Bumped version to 2.0.6
# * Fixed so that changed toc, lot, lof, or out causes a rebuild
# Chris Monson (2006-04-17):
# * Bumped version to 2.0.5
# * Added jpg -> eps conversion target
# Chris Monson (2006-04-12):
# * Bumped version to 2.0.4
# * Fixed BSD sed invocation to not use \| as a branch delimiter
# * Added a comment section on what is and is not allowed in BSD sed
# * Made paper size handling more robust while I was at it
# * Fixed postscript RGB grayscale to use a weighted average
# * Fixed postscript HSB grayscale to convert to RGB first
# * Fixed a problem with rebuilding .bbl files
# Chris Monson (2006-04-11):
# * Bumped version to 2.0.3
# * Fixed some BSD sed problems: can't use \n in substitutions
# Chris Monson (2006-04-10):
# * Bumped version to 2.0.2
# * Once again removed ability to create .tex files from scripts
# * \includeonly works again
# Chris Monson (2006-04-09):
# * Bumped version to 2.0.1
# * Fixed grayscale postscript handling to be more robust
# * Added ability to generate ._gray_. files from eps and eps.gz
# * Added ability to clean ._gray_.eps files created from .eps files
# Chris Monson (2006-04-07):
# * Bumped version to 2.0.0
# * Removed clunky ability to create included .tex files from scripts
# * Added note in the help about included tex scripting not working
# * Fixed the .eps generation to delete %.gpihead.make when finished
# * Abandoned designs to use shell variables to create sed scripts
# * Abandoned __default__.tex.sh idea: it causes recursion with %: .
# * Removed web page to-do.  All items are now complete.
# * Added better grayscale conversion for dot figures (direct ps fixup).
# * Include files can now be scripted (at the expense of \includeonly).
# * Updated dependency graph to contain better node names.
# Chris Monson (2006-04-06):
# * Bumped version to 2.0b3
# * Top level includes now fail if there is no rule to build them
# * A helpful message is printed when they do fail
# * Grayscale has been changed to be ._gray_, other phonies use _ now, too
# * Grayscale handling has been completed
# * Changed _include_stems target to _includes target.
# * Fixed _includes target to be useful by itself.
# * Removed the ability to specify clean and build targets at once
# * Verified that epsfig works fine with current code
# * Fixed included scripts so that they are added to the dep files
# * Fixed so that graphics includes don't happen if they aren't for gpi
# * Fixed dot output to allow grayscale.
# Chris Monson (2006-04-05):
# * Bumped version to 2.0b2
# * Removed automatic -gray output.  It needs fixing in a bad way.
# * Revamped dependency creation completely.
# * Fixed conditional inclusion to actually work (test.nobuild.d, test.d).
# * Fixed clean target to remove log targets
# * Added the 'monochrome' word for gray gpi output
# * Added a _check_gpi_files target that checks for common problems
# * Changed the _version target into the version target (no _)
# * Added better handling of grayscale files.  Use the .gray.pdf target.
# * Fixed testing for rebuilds
# Chris Monson (2006-04-04):
# * Bumped version to 2.0b1
# * Changed colorization of output
# * Made .auxbbl and .auxtex .make files secondary targets
# * Shortened and simplified the final latex invocation loop
# * Added version-specific output ($$i vs. $$$$i) in latex loop
# * Added a build message for the first .dvi run (Building .dvi (0))
# * Removed some build messages that most people don't care about.
# * Simplified procedure for user-set colors -- simple text specification
# * Fixed diff output to...not output.
# * Fixed rerun bug -- detect not only when preceded with LaTeX Warning
# * Sped up gpi plotting
# * Added error handling and colorized output for gpi failure
# * Documented color changing stuff.
# * Now sort the flattened aux file to avoid false recompilation needs
# * Added clean-nographics target
# * Don't remove self.dvi file if self.aux is missing in the log
# * Clarified some code.  Did some very minor adjusting.
# Chris Monson (2006-04-03):
# * Bumped version to 2.0a7
# * Added .dvi and .ps files as secondary files.
# * Fixed handling of multiple run detection when includeonly is in use.
# * Added code to flatten .aux files.
# * Added more files as .SECONDARY prerequisites to avoid recompilation.
# * Fixed the inputs generation to be much simpler and to use pipes.
# * Added the dependency graph directly into the makefile.
# * Changed flatten-aux to remove \@writefile \relax \newlabel, etc.
# * Undid pipe changes with sed usage (BSD sed doesn't know -f-).
# * Added a _check_programs target that tells you what your system has.
# * Fixed an error in colorization that made unnecessary errors appear
# * Added view targets.
# * Updated help text.
# * Augmented cookies so that .aux can trigger .bbl and .dvi rebuilds
# * Added more informative error handling for dvips and ps2pdf
# Chris Monson (2006-04-02):
# * Bumped version to 2.0a6
# * Added indirection to .bbl dependencies to avoid rebuilding .bbl files
# * Streamlined the diff invocation to eliminate an existence test
# * Removed special shell quote escape variables
# * Moved includes to a more prominent location
# * Fixed .inputs.make to not contain .aux files
# * Fixed embedding to use a file instead of always grepping.
# * Added *.make.temp to the list of cleanable files
# * Fixed Ruby.  It should now be supported properly.
# * Now differentiate between all, default, and buildable files.
# * Fixed to bail out on serious errors.
# * Revised the handling of includable files.  Still working on it.
# Chris Monson (2006-03-31):
# * Bumped version to 2.0a5
# * Fixed a bug with LaTeX error detection (there can be spaces)
# * Added .bbl support, simplifying everything and making it more correct
# * Refactored some tests that muddy the code
# * Did a little cleanup of some shell loops that can safely be make loops
# * Added support for graphviz .dot files
# * Made _all_programs output easier to read
# * Added the ruby support that has long been advertised
# * Font embedding was screwed up for PostScript -- now implicit
# * Changed the generation of -gray.gpi files to a single command
# * Changed any make-generated file that is not included from .d to .make
# Chris Monson (2006-03-30):
# * Bumped version to 2.0a4
# * Fixed a bug with very long graphics file names
# * Added a todo entry for epsfig support
# * Fixed a bug paper size bug: sometimes more than one entry appears
# * Fixed DVI build echoing to display the number instead of process ID
# * DVI files are now removed on first invocation if ANY file is missing
# * Added a simple grayscale approach: if a file ends with -gray.gpi, it
#     is created from the corresponding .gpi file with a special
#     comment ##GRAY in its header, which causes coloring to be
#     turned off.
# * Fixed a bug in the handling of .tex.sh files.  For some reason I had
#     neglected to define file stems for scripted output.
# * Removed a trailing ; from the %.graphics dependencies
# * Added dvips embedding (I think it works, anyway)
# Chris Monson (2006-03-29):
# * Bumped version to 2.0a3
# * Fixed error in make 3.79 with MAKEFILE_LIST usage
# * Added the presumed filename to the _version output
# * Added a vim macro for converting sed scripts to make commands
# * Added gpi dependency support (plotting external files and loading gpi)
# * Allow .gpi files to be ignored if called .include.gpi or .nobuild.gpi
# * Fixed sed invocations where \+ was used.  BSD sed uses \{1,\}.
# Chris Monson (2006-03-28):
# * Bumped version to 2.0a2
# * Added SHELL_DEBUG and VERBOSE options
# * Changed the default shell back to /bin/sh (unset, in other words)
# * Moved .PHONY declarations closer to their targets
# * Moved help text into its own define block to obtain better formatting
# * Removed need for double-entry when adding a new program invocation
# * Moved .SECONDARY declaration closer to its relevant occurrence
# * Commented things more heavily
# * Added help text about setting terminal and output in gnuplot
# * Created more fine-grained clean targets
# * Added a %.graphics target that generates all of %'s graphics
# * Killed backward-compatible graphics generation (e.g., eps.gpi=gpi.eps)
# * For now, we're just GPL 2, not 3.  Maybe it will change later
# * Made the version and svninfo into variables
# Chris Monson (2006-03-27):
# * Bumped version to 2.0a1
# * Huge, sweeping changes -- automatic dependencies
#

# IMPORTANT!
#
# When adding to the following list, do not introduce any blank lines.  The
# list is extracted for documentation using sed and is terminated by a blank
# line.
#
# EXTERNAL PROGRAMS:
# = ESSENTIAL PROGRAMS =
# == Basic Shell Utilities ==
CAT		?= cat
CP		?= cp -f
DIFF		?= diff
ECHO		?= echo
EGREP		?= egrep
ENV		?= env
EXPR		?= expr
MV		?= mv -f
SED		?= sed
SORT		?= sort
TOUCH		?= touch
UNIQ		?= uniq
WHICH		?= which
XARGS		?= xargs
SLEEP		?= sleep
# == LaTeX (tetex-provided) ==
BIBTEX		?= bibtex
BIBER		?= biber
DVIPS		?= dvips
LATEX		?= latex
PDFLATEX	?= pdflatex --shell-escape
XELATEX		?= xelatex --shell-escape
LUALATEX    ?= lualatex --shell-escape
EPSTOPDF	?= epstopdf
MAKEINDEX	?= makeindex
XINDY		?= xindy
KPSEWHICH	?= kpsewhich
GS		?= gs
# = OPTIONAL PROGRAMS =
# == For MikTex under Cygwin, to get path names right
CYGPATH		?= cygpath
# == Makefile Color Output ==
TPUT		?= tput
# == TeX Generation ==
PERL		?= perl
PYTHON		?= python
RST2LATEX	?= rst2latex.py
LHS2TEX		?= lhs2tex
# == EPS Generation ==
CONVERT		?= convert	# ImageMagick
DOT		?= dot		# GraphViz
DOT2TEX		?= dot2tex	# dot2tex - add options (not -o) as needed
MPOST		?= mpost	# MetaPost
FIG2DEV		?= fig2dev	# XFig
GNUPLOT		?= gnuplot	# GNUplot
INKSCAPE	?= inkscape	# Inkscape (svg support)
XMGRACE		?= xmgrace	# XMgrace
PNGTOPNM	?= pngtopnm	# From NetPBM - step 1 for png -> eps
PPMTOPGM	?= ppmtopgm	# From NetPBM - (gray) step 2 for png -> eps
PNMTOPS		?= pnmtops	# From NetPBM - step 3 for png -> eps
GUNZIP		?= gunzip	# GZipped EPS
ASYMPTOTE   ?= asy
# == Beamer Enlarged Output ==
PSNUP		?= psnup
# == Viewing Stuff ==
VIEW_POSTSCRIPT	?= gv
VIEW_PDF	?= xpdf
VIEW_GRAPHICS	?= display

# Xindy glossaries
XINDYLANG	?= english
XINDYENC	?= utf8

# If cygpath is present, then we create a path-norm function that uses it,
# otherwise the function is just a no-op.  Issue 112 has details.
USE_CYGPATH := $(if $(shell $(WHICH) $(CYGPATH) 2>/dev/null),yes,)

define path-norm
$(if $(USE_CYGPATH),$(shell $(CYGPATH) -u "$1"),$1)
endef

# Command options for embedding fonts and postscript->pdf conversion
PS_EMBED_OPTIONS	?= -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100
PS_COMPATIBILITY	?= 1.4

# If set to something, will cause temporary files to not be deleted immediately
KEEP_TEMP	?=

# Defaults for GPI
DEFAULT_GPI_EPS_FONTSIZE	?= 22
DEFAULT_GPI_PDF_FONTSIZE	?= 12

# Style file for ReST
RST_STYLE_FILE			?= $(wildcard _rststyle_._include_.tex)

# This ensures that even when echo is a shell builtin, we still use the binary
# (the builtin doesn't always understand -n)
FIXED_ECHO	:= $(if $(findstring -n,$(shell $(ECHO) -n)),$(shell which echo),$(ECHO))
ECHO		:= $(if $(FIXED_ECHO),$(FIXED_ECHO),$(ECHO))

define determine-gnuplot-output-extension
$(if $(shell $(WHICH) $(GNUPLOT) 2>/dev/null),
     $(if $(findstring unknown or ambiguous, $(shell $(GNUPLOT) -e "set terminal pdf" 2>&1)),
	  eps, pdf),
     none)
endef

GNUPLOT_OUTPUT_EXTENSION	?= $(strip $(call determine-gnuplot-output-extension))

# Internal code should use this because of :=.  This means that the potentially
# expensive script invocation used to determine whether pdf is available will
# only be run once.
GPI_OUTPUT_EXTENSION := $(strip $(GNUPLOT_OUTPUT_EXTENSION))

# Note, if the terminal *does* understand fsize, then we expect this call to
# create a specific error here: "fsize: expecting font size".  Otherwise, we
# assume that fsize is not understood.
GPI_FSIZE_SYNTAX := $(strip \
$(if \
  $(filter pdf,$(GPI_OUTPUT_EXTENSION)),\
  $(if \
    $(findstring fsize: expecting font size,$(shell $(GNUPLOT) -e "set terminal pdf fsize" 2>&1)),\
    fsize FONTSIZE,\
    font ",FONTSIZE"),\
  FONTSIZE))

# Directory into which we place "binaries" if it exists.
# Note that this can be changed on the commandline or in Makefile.ini:
#
# Command line:
#   make BINARY_TARGET_DIR=$HOME/pdfs myfile.pdf
#
# Also, you can specify a relative directory (relative to the Makefile):
#   make BINARY_TARGET_DIR=pdfs myfile.pdf
#
# Or, you can use Makefile.ini:
#
#   BINARY_TARGET_DIR := $(HOME)/bin_out
#
BINARY_TARGET_DIR	?= _out_

RESTARTS		:= $(if $(MAKE_RESTARTS),$(MAKE_RESTARTS),0)
# SH NOTES
#
# On some systems, /bin/sh, which is the default shell, is not linked to
# /bin/bash.  While bash is supposed to be sh-compatible when invoked as sh, it
# just isn't.  This section details some of the things you have to stay away
# from to remain sh-compatible.
#
#	* File pattern expansion does not work for {}
#	* [ "$x" = "$y" ] has to be [ x"$x" x"$y" ]
#	* &> for stderr redirection doesn't work, use 2>&1 instead
#
# BSD SED NOTES
#
# BSD SED is not very nice compared to GNU sed, but it is the most
# commonly-invoked sed on Macs (being based on BSD), so we have to cater to
# it or require people to install GNU sed.  It seems like the GNU
# requirement isn't too bad since this makefile is really a GNU makefile,
# but apparently GNU sed is much less common than GNU make in general, so
# I'm supporting it here.
#
# Sad experience has taught me the following about BSD sed:
#
# 	* \+ is not understood to mean \{1,\}
# 	* \| is meaningless (does not branch)
# 	* \n cannot be used as a substitution character
# 	* ? does not mean \{0,1\}, but is literal
# 	* a\ works, but only reliably for a single line if subsequent lines
# 		have forward slashes in them (as is the case in postscript)
#
# For more info (on the Mac) you can consult
#
# man -M /usr/share/man re_format
#
# And look for the word "Obsolete" near the bottom.

#
# EXTERNAL PROGRAM DOCUMENTATION SCRIPT
#

# $(call output-all-programs,[<output file>])
define output-all-programs
	[ -f '$(this_file)' ] && \
	$(SED) \
		-e '/^[[:space:]]*#[[:space:]]*EXTERNAL PROGRAMS:/,/^$$/!d' \
		-e '/EXTERNAL PROGRAMS/d' \
		-e '/^$$/d' \
		-e '/^[[:space:]]*#/i\ '\
		-e 's/^[[:space:]]*#[[:space:]][^=]*//' \
		$(this_file) $(if $1,> '$1',) || \
	$(ECHO) "Cannot determine the name of this makefile."
endef

# If they misspell gray, it should still work.
GRAY	?= $(call get-default,$(GREY),)

#
# Utility Functions and Definitions
#
#
# Transcript
# For debug/testing purposes: writes a message to
# filename.transcript.make for each command that was run, including
# some human-readable justification for why it had to be run.
# For example: "Running latex (log-file indicated that this is necessary)"
# Set WRITE_TRANSCRIPT to something to activate
WRITE_TRANSCRIPT ?=
# Set reason for the next run call
# $(call set-run-reason,message)
set-run-reason = export run_reason="$1"
# Log command to the transcript file
# $(call set-run-reason,command,job_name)
define transcript
$(if $(WRITE_TRANSCRIPT), \
	$(ECHO) "Running $1 ($$run_reason)" >> $2.transcript.make; \
	export run_reason="", \
	$(sh_true))
endef

# Don't call this directly - it is here to avoid calling wildcard more than
# once in remove-files.
remove-files-helper	= $(if $1,$(RM) $1,$(sh_true))

# $(call remove-files,file1 file2)
remove-files		= $(call remove-files-helper,$(wildcard $1))

# Removes all cleanable files in the given list
# $(call clean-files,file1 file2 file3 ...)
# Works exactly like remove-files, but filters out files in $(neverclean)
clean-files		= \
	$(call remove-files-helper,$(call cleanable-files,$(wildcard $1)))

# Outputs all generated files to STDOUT, along with some others that are
# created by these (e.g., .idx files end up producing .ilg and .ind files).
# Discovered by reading *.fls OUTPUT lines and producing corresponding .ind
# filenames as needed.
#
# $(call get-generated-names,<source recorder file (*.fls)>)
define get-generated-names
[ -f '$1' ] && \
$(SED) \
	-e '/^OUTPUT /{' \
	-e '  s///' \
	-e '  p' \
	-e '  s/\.idx/\.ind/p' \
	-e '  s/\.ind/\.ilg/p' \
	-e '}' \
	-e 'd' \
	'$1' \
| $(SORT) | $(UNIQ)
endef

# This removes files without checking whether they are there or not.  This
# sometimes has to be used when the file is created by a series of shell
# commands, but there ends up being a race condition: make doesn't know about
# the file generation as quickly as the system does, so $(wildcard ...) doesn't
# work right.  Blech.
# $(call remove-temporary-files,filenames)
remove-temporary-files	= $(if $(KEEP_TEMP),:,$(if $1,$(RM) $1,:))

# Create an identifier from a file name
# $(call cleanse-filename,filename)
cleanse-filename	= $(subst .,_,$(subst /,__,$1))

# Escape dots
# $(call escape-fname-regex,str)
escape-fname-regex	= $(subst /,\\/,$(subst .,\\.,$1))

# Test that a file exists
# $(call test-exists,file)
test-exists		= [ -e '$1' ]
# $(call test-not-exists,file)
test-not-exists   = [ ! -e '$1' ]

# $(call move-files,source,destination)
move-if-exists		= $(call test-exists,$1) && $(MV) '$1' '$2'

# Copy file1 to file2 only if file2 doesn't exist or they are different
# $(call copy-if-different,sfile,dfile)
copy-if-different	= $(call test-different,$1,$2) && $(CP) '$1' '$2'
copy-if-exists		= $(call test-exists,$1) && $(CP) '$1' '$2'
move-if-different	= $(call test-different,$1,$2) && $(MV) '$1' '$2'
replace-if-different-and-remove	= \
	$(call test-different,$1,$2) \
	&& $(MV) '$1' '$2' \
	|| $(call remove-files,'$1')

# Note that $(DIFF) returns success when the files are the SAME....
# $(call test-different,sfile,dfile)
test-different		= ! $(DIFF) -q '$1' '$2' >/dev/null 2>&1
test-exists-and-different	= \
	$(call test-exists,$2) && $(call test-different,$1,$2)

# Return value 1, or value 2 if value 1 is empty
# $(call get-default,<possibly empty arg>,<default value if empty>)
get-default	= $(if $1,$1,$2)

# Copy a file and log what's going on
# $(call copy-with-logging,<source>,<target>)
define copy-with-logging
if [ -d '$2/' ]; then \
	if $(CP) '$1' '$2/'; then \
		$(ECHO) "$(C_INFO)Copied '$1' to '$2/'$(C_RESET)"; \
	else \
		$(ECHO) "$(C_ERROR)Failed to copy '$1' to '$2/'$(C_RESET)"; \
	fi; \
fi
endef

# Gives a reassuring message about the failure to find include files
# $(call include-message,<list of include files>)
define include-message
$(strip \
$(if $(filter-out $(wildcard $1),$1),\
	$(shell $(ECHO) \
	"$(C_INFO)NOTE: You may ignore warnings about the"\
	"following files:" >&2;\
	$(ECHO) >&2; \
	$(foreach s,$(filter-out $(wildcard $1),$1),$(ECHO) '     $s' >&2;)\
	$(ECHO) "$(C_RESET)" >&2)
))
endef
# Characters that are hard to specify in certain places
space		:= $(empty) $(empty)
colon		:= \:
comma		:= ,

# Useful shell definitions
sh_true		:= :
sh_false	:= ! :

# Clear out the standard interfering make suffixes
.SUFFIXES:

# Turn off forceful rm (RM is usually mapped to rm -f)
ifdef SAFE_RM
RM	:= rm
endif

# Turn command echoing back on with VERBOSE=1
ifndef VERBOSE
QUIET	:= @
endif

# Turn on shell debugging with SHELL_DEBUG=1
# (EVERYTHING is echoed, even $(shell ...) invocations)
ifdef SHELL_DEBUG
SHELL	+= -x
endif

# Get the name of this makefile (always right in 3.80, often right in 3.79)
# This is only really used for documentation, so it isn't too serious.
ifdef MAKEFILE_LIST
this_file	:= $(firstword $(MAKEFILE_LIST))
else
this_file	:= $(wildcard GNUmakefile makefile Makefile)
endif

# Terminal color definitions

REAL_TPUT 	:= $(if $(NO_COLOR),,$(shell $(WHICH) $(TPUT)))

# $(call get-term-code,codeinfo)
# e.g.,
# $(call get-term-code,setaf 0)
get-term-code = $(if $(REAL_TPUT),$(shell $(REAL_TPUT) $1),)

black	:= $(call get-term-code,setaf 0)
red	:= $(call get-term-code,setaf 1)
green	:= $(call get-term-code,setaf 2)
yellow	:= $(call get-term-code,setaf 3)
blue	:= $(call get-term-code,setaf 4)
magenta	:= $(call get-term-code,setaf 5)
cyan	:= $(call get-term-code,setaf 6)
white	:= $(call get-term-code,setaf 7)
bold	:= $(call get-term-code,bold)
uline	:= $(call get-term-code,smul)
reset	:= $(call get-term-code,sgr0)

#
# User-settable definitions
#
LATEX_COLOR_WARNING	?= magenta
LATEX_COLOR_ERROR	?= red
LATEX_COLOR_INFO	?= green
LATEX_COLOR_UNDERFULL	?= magenta
LATEX_COLOR_OVERFULL	?= red bold
LATEX_COLOR_PAGES	?= bold
LATEX_COLOR_BUILD	?= cyan
LATEX_COLOR_GRAPHIC	?= yellow
LATEX_COLOR_DEP		?= green
LATEX_COLOR_SUCCESS	?= green bold
LATEX_COLOR_FAILURE	?= red bold

# Gets the real color from a simple textual definition like those above
# $(call get-color,ALL_CAPS_COLOR_NAME)
# e.g., $(call get-color,WARNING)
get-color	= $(subst $(space),,$(foreach c,$(LATEX_COLOR_$1),$($c)))

#
# STANDARD COLORS
#
C_WARNING	:= $(call get-color,WARNING)
C_ERROR		:= $(call get-color,ERROR)
C_INFO		:= $(call get-color,INFO)
C_UNDERFULL	:= $(call get-color,UNDERFULL)
C_OVERFULL	:= $(call get-color,OVERFULL)
C_PAGES		:= $(call get-color,PAGES)
C_BUILD		:= $(call get-color,BUILD)
C_GRAPHIC	:= $(call get-color,GRAPHIC)
C_DEP		:= $(call get-color,DEP)
C_SUCCESS	:= $(call get-color,SUCCESS)
C_FAILURE	:= $(call get-color,FAILURE)
C_RESET		:= $(reset)

#
# PRE-BUILD TESTS
#

# Check that clean targets are not combined with other targets (weird things
# happen, and it's not easy to fix them)
hascleangoals	:= $(if $(sort $(filter clean clean-%,$(MAKECMDGOALS))),1)
hasbuildgoals	:= $(if $(sort $(filter-out clean clean-%,$(MAKECMDGOALS))),1)
ifneq "$(hasbuildgoals)" ""
ifneq "$(hascleangoals)" ""
$(error $(C_ERROR)Clean and build targets specified together$(C_RESET)))
endif
endif

#
# VARIABLE DECLARATIONS
#

# Names of sed scripts that morph gnuplot files -- only the first found is used
GNUPLOT_SED	:= global-gpi.sed gnuplot.sed
GNUPLOT_GLOBAL	:= global._include_.gpi gnuplot.global

ifeq "$(strip $(BUILD_STRATEGY))" "latex"
default_graphic_extension	?= eps
latex_build_program		?= $(LATEX)
build_target_extension		?= dvi
hyperref_driver_pattern		?= hdvips
hyperref_driver_error		?= Using dvips: specify ps2pdf in the hyperref options.
endif

ifeq "$(strip $(BUILD_STRATEGY))" "pdflatex"
default_graphic_extension	?= pdf
latex_build_program		?= $(PDFLATEX)
build_target_extension		?= pdf
hyperref_driver_pattern		?= hpdf.*
hyperref_driver_error		?= Using pdflatex: specify pdftex in the hyperref options (or leave it blank).
endif

ifeq "$(strip $(BUILD_STRATEGY))" "xelatex"
default_graphic_extension	?= pdf
latex_build_program		?= $(XELATEX)
build_target_extension		?= pdf
hyperref_driver_pattern		?= hdvipdf.*
hyperref_driver_error		?= Using xelatex: specify xelatex in the hyperref options (or leave it blank).
endif

ifeq "$(strip $(BUILD_STRATEGY))" "lualatex"
default_graphic_extension	?= pdf
latex_build_program		?= $(LUALATEX)
build_target_extension		?= pdf
hyperref_driver_pattern		?= hdvipdf.*
hyperref_driver_error		?= Using xelatex: specify lualatex in the hyperref options (or leave it blank).
endif


# Files of interest
all_files.tex		?= $(wildcard *.tex)
all_files.xmpdata	?= $(wildcard *.xmpdata)
all_files.tex.sh	?= $(wildcard *.tex.sh)
all_files.tex.pl	?= $(wildcard *.tex.pl)
all_files.tex.py	?= $(wildcard *.tex.py)
all_files.rst		?= $(wildcard *.rst)
all_files.lhs		?= $(wildcard *.lhs)
all_files.mp		?= $(wildcard *.mp)
all_files.fig		?= $(wildcard *.fig)
all_files.asy   	?= $(wildcard *.asy)
all_files.gpi		?= $(wildcard *.gpi)
all_files.dot		?= $(wildcard *.dot)
all_files.xvg		?= $(wildcard *.xvg)
all_files.svg		?= $(wildcard *.svg)
all_files.png		?= $(wildcard *.png)
all_files.jpg		?= $(wildcard *.jpg)
all_files.jpeg		?= $(wildcard *.jpeg)
all_files.eps.gz	?= $(wildcard *.eps.gz)
all_files.eps		?= $(wildcard *.eps)

# Utility function for obtaining all files not specified in $(neverclean)
# $(call cleanable-files,file1 file2 file3 ...)
# Returns the list of files that is not in $(wildcard $(neverclean))
cleanable-files = $(filter-out $(wildcard $(neverclean)), $1)

# Utility function for getting all .$1 files that are to be ignored
#  * files listed in $(includes.$1)
#  * files not listed in $(onlysources.$1) if it is defined
ignore_files = \
  $(includes.$1) \
  $(if $(onlysources.$1),$(filter-out $(onlysources.$1), $(all_files.$1)))

# Patterns to never be allowed as source targets
ignore_patterns	:= %._include_

# Patterns allowed as source targets but not included in 'all' builds
nodefault_patterns := %._nobuild_ $(ignore_patterns)

# Utility function for getting targets suitable building
# $(call filter-buildable,suffix)
filter-buildable	= \
	$(filter-out $(call ignore_files,$1) \
		$(addsuffix .$1,$(ignore_patterns)),$(all_files.$1))

# Utility function for getting targets suitable for 'all' builds
# $(call filter-default,suffix)
filter-default		= \
	$(filter-out $(call ignore_files,$1) \
		$(addsuffix .$1,$(nodefault_patterns)),$(all_files.$1))

# Top level sources that can be built even when they are not by default
files.tex	:= $(call filter-buildable,tex)
files.tex.sh	:= $(call filter-buildable,tex.sh)
files.tex.pl	:= $(call filter-buildable,tex.pl)
files.tex.py	:= $(call filter-buildable,tex.py)
files.rst	:= $(call filter-buildable,rst)
files.lhs	:= $(call filter-buildable,lhs)
files.gpi	:= $(call filter-buildable,gpi)
files.dot	:= $(call filter-buildable,dot)
files.mp	:= $(call filter-buildable,mp)
files.fig	:= $(call filter-buildable,fig)
files.asy	:= $(call filter-buildable,asy)
files.xvg	:= $(call filter-buildable,xvg)
files.svg	:= $(call filter-buildable,svg)
files.png	:= $(call filter-buildable,png)
files.jpg	:= $(call filter-buildable,jpg)
files.jpeg	:= $(call filter-buildable,jpeg)
files.eps.gz	:= $(call filter-buildable,eps.gz)
files.eps	:= $(call filter-buildable,eps)

# Make all pstex targets secondary.  The pstex_t target requires the pstex
# target, and nothing else really depends on it, so it often gets deleted.
# This avoids that by allowing *all* fig files to be pstex targets, which is
# perfectly valid and causes no problems even if they're going to become eps
# files in the end.
.SECONDARY:	$(patsubst %.fig,%.pstex,$(files.fig))

# Make all .tex targets secondary that result .rst and .lhs:
.SECONDARY:	$(patsubst %.rst,%.tex,$(files.rst))
.SECONDARY:	$(patsubst %.lhs,%.tex,$(files.lhs))

# Top level sources that are built by default targets
default_files.tex	:= $(call filter-default,tex)
default_files.tex.sh	:= $(call filter-default,tex.sh)
default_files.tex.pl	:= $(call filter-default,tex.pl)
default_files.tex.py	:= $(call filter-default,tex.py)
default_files.rst	:= $(call filter-default,rst)
default_files.lhs	:= $(call filter-default,lhs)
default_files.gpi	:= $(call filter-default,gpi)
default_files.dot	:= $(call filter-default,dot)
default_files.mp	:= $(call filter-default,mp)
default_files.fig	:= $(call filter-default,fig)
default_files.asy	:= $(call filter-default,asy)
default_files.xvg	:= $(call filter-default,xvg)
default_files.svg	:= $(call filter-default,svg)
default_files.png	:= $(call filter-default,png)
default_files.jpg	:= $(call filter-default,jpg)
default_files.jpeg	:= $(call filter-default,jpeg)
default_files.eps.gz	:= $(call filter-default,eps.gz)
default_files.eps	:= $(call filter-default,eps)

# Utility function for creating larger lists of files
# $(call concat-files,suffixes,[prefix])
concat-files	= $(foreach s,$1,$($(if $2,$2_,)files.$s))

# Useful file groupings
all_files_source	:= $(call concat-files,tex,all)
all_files_source_gen	:= $(call concat-files,rst rhs,all)
all_files_scripts	:= $(call concat-files,tex.sh tex.pl tex.py,all)

.PHONY: $(all_files_scripts)

default_files_source		:= $(call concat-files,tex,default)
default_files_source_gen	:= $(call concat-files,rhs lhs,default)
default_files_scripts		:= $(call concat-files,tex.sh tex.pl tex.py,default)

files_source		:= $(call concat-files,tex)
files_source_gen	:= $(call concat-files,rst lhs)
files_scripts		:= $(call concat-files,tex.sh tex.pl tex.py)

# Utility function for obtaining stems
# $(call get-stems,suffix,[prefix])
get-stems	= $(sort $($(if $2,$2_,)files.$1:%.$1=%))

# List of all stems (including ._include_ and ._nobuild_ file stems)
all_stems.tex		:= $(call get-stems,tex,all)
all_stems.tex.sh	:= $(call get-stems,tex.sh,all)
all_stems.tex.pl	:= $(call get-stems,tex.pl,all)
all_stems.tex.py	:= $(call get-stems,tex.py,all)
all_stems.rst		:= $(call get-stems,rst,all)
all_stems.lhs		:= $(call get-stems,lhs,all)
all_stems.mp		:= $(call get-stems,mp,all)
all_stems.fig		:= $(call get-stems,fig,all)
all_stems.gpi		:= $(call get-stems,gpi,all)
all_stems.dot		:= $(call get-stems,dot,all)
all_stems.xvg		:= $(call get-stems,xvg,all)
all_stems.svg		:= $(call get-stems,svg,all)
all_stems.png		:= $(call get-stems,png,all)
all_stems.jpg		:= $(call get-stems,jpg,all)
all_stems.jpeg		:= $(call get-stems,jpeg,all)
all_stems.eps.gz	:= $(call get-stems,eps.gz,all)
all_stems.eps		:= $(call get-stems,eps,all)

# List of all default stems (all default PDF targets):
default_stems.tex		:= $(call get-stems,tex,default)
default_stems.tex.sh		:= $(call get-stems,tex.sh,default)
default_stems.tex.pl		:= $(call get-stems,tex.pl,default)
default_stems.tex.py		:= $(call get-stems,tex.py,default)
default_stems.rst		:= $(call get-stems,rst,default)
default_stems.lhs		:= $(call get-stems,lhs,default)
default_stems.mp		:= $(call get-stems,mp,default)
default_stems.fig		:= $(call get-stems,fig,default)
default_stems.gpi		:= $(call get-stems,gpi,default)
default_stems.dot		:= $(call get-stems,dot,default)
default_stems.xvg		:= $(call get-stems,xvg,default)
default_stems.svg		:= $(call get-stems,svg,default)
default_stems.png		:= $(call get-stems,png,default)
default_stems.jpg		:= $(call get-stems,jpg,default)
default_stems.jpeg		:= $(call get-stems,jpeg,default)
default_stems.eps.gz		:= $(call get-stems,eps.gz,default)
default_stems.eps		:= $(call get-stems,eps,default)

# List of all stems (all possible bare PDF targets created here):
stems.tex		:= $(call get-stems,tex)
stems.tex.sh		:= $(call get-stems,tex.sh)
stems.tex.pl		:= $(call get-stems,tex.pl)
stems.tex.py		:= $(call get-stems,tex.py)
stems.rst		:= $(call get-stems,rst)
stems.lhs		:= $(call get-stems,lhs)
stems.mp		:= $(call get-stems,mp)
stems.fig		:= $(call get-stems,fig)
stems.gpi		:= $(call get-stems,gpi)
stems.dot		:= $(call get-stems,dot)
stems.xvg		:= $(call get-stems,xvg)
stems.svg		:= $(call get-stems,svg)
stems.png		:= $(call get-stems,png)
stems.jpg		:= $(call get-stems,jpg)
stems.jpeg		:= $(call get-stems,jpeg)
stems.eps.gz		:= $(call get-stems,eps.gz)
stems.eps		:= $(call get-stems,eps)

# Utility function for creating larger lists of stems
# $(call concat-stems,suffixes,[prefix])
concat-stems	= $(sort $(foreach s,$1,$($(if $2,$2_,)stems.$s)))

# The most likely to be source but not finished product go first
graphic_source_extensions	:= mp \
				   fig \
				   gpi \
				   xvg \
				   svg \
				   dot \
				   asy \
				   eps.gz

ifeq "$(strip $(BUILD_STRATEGY))" "latex"
graphic_source_extensions	+= png jpg jpeg eps
graphic_target_extensions	:= eps ps
endif

ifeq "$(strip $(BUILD_STRATEGY))" "pdflatex"
graphic_source_extensions	+= eps
graphic_target_extensions	:= pdf png jpg jpeg mps tif
endif

ifeq "$(strip $(BUILD_STRATEGY))" "xelatex"
graphic_source_extensions	+= eps
graphic_target_extensions	:= pdf png jpg jpeg mps tif
endif

ifeq "$(strip $(BUILD_STRATEGY))" "lualatex"
graphic_source_extensions	+= eps
graphic_target_extensions	:= pdf png jpg jpeg mps tif
endif

all_stems_source	:= $(call concat-stems,tex,all)
all_stems_source_gen	:= $(call concat-stems,rst lhs,all)
all_stems_script	:= $(call concat-stems,tex.sh tex.pl tex.py,all)
all_stems_graphic	:= $(call concat-stems,$(graphic_source_extensions),all)
all_stems_ss		:= $(sort $(all_stems_source) $(all_stems_source_gen) $(all_stems_script))
all_stems_sg		:= $(sort $(all_stems_script) $(all_stems_source_gen))
all_stems_ssg		:= $(sort $(all_stems_ss))

default_stems_source		:= $(call concat-stems,tex,default)
default_stems_source_gen	:= $(call concat-stems,rst lhs,default)
default_stems_script		:= $(call concat-stems,tex.sh tex.pl tex.py,default)
default_stems_ss	:= $(sort $(default_stems_source) $(default_stems_source_gen) $(default_stems_script))
default_stems_sg	:= $(sort $(default_stems_script) $(default_stems_source_gen))
default_stems_ssg	:= $(sort $(default_stems_ss))

stems_source		:= $(call concat-stems,tex)
stems_source_gen	:= $(call concat-stems,rst lhs)
stems_script		:= $(call concat-stems,tex.sh tex.pl tex.py)
stems_graphic		:= $(call concat-stems,$(graphic_source_extensions))
stems_gg		:= $(sort $(stems_graphic))
stems_ss		:= $(sort $(stems_source) $(stems_source_gen) $(stems_script))
stems_sg		:= $(sort $(stems_script) $(stems_source_gen))
stems_ssg		:= $(sort $(stems_ss))

# Calculate names that can generate the need for an include file.  We can't
# really do this with patterns because it's too easy to screw up, so we create
# an exhaustive list.
allowed_source_suffixes	:= \
	pdf \
	ps \
	dvi \
	ind \
	nls \
	bbl \
	bci \
	aux \
	aux.make \
	d \
	auxbbl.make \
	_graphics \
	_show
allowed_source_patterns		:= $(addprefix %.,$(allowed_source_suffixes))

allowed_graphic_suffixes	:= \
	pdf \
	eps \
	gpihead.make \
	gpi.d
allowed_graphic_patterns	:= $(addprefix %.,$(allowed_graphic_suffixes))

# All targets allowed to build documents
allowed_source_targets	:= \
	$(foreach suff,$(allowed_source_suffixes),\
	$(addsuffix .$(suff),$(stems_ssg)))

# All targets allowed to build graphics
allowed_graphic_targets	:= \
	$(foreach suff,$(allowed_graphic_suffixes),\
	$(addsuffix .$(suff),$(stems_gg)))

# All targets that build multiple documents (like 'all')
allowed_batch_source_targets	:= \
	all \
	all-pdf \
	all-ps \
	all-dvi \
	all-bbl \
	all-ind \
	all-gls \
	all-nls \
	show

# All targets that build multiple graphics (independent of document)
allowed_batch_graphic_targets	:= \
	all-graphics \
	all-pstex \
	all-dot2tex \
	show-graphics

# Now we figure out which stuff is available as a make target for THIS RUN.
real_goals	:= $(call get-default,$(filter-out _includes,$(MAKECMDGOALS)),\
			all)

specified_source_targets	:= $(strip \
	$(filter $(allowed_source_targets) $(stems_ssg),$(real_goals)) \
	)

specified_batch_source_targets	:= $(strip \
	$(filter $(allowed_batch_source_targets),$(real_goals)) \
	)

specified_graphic_targets	:= $(strip \
	$(filter $(allowed_graphic_targets),$(real_goals)) \
	)

specified_batch_graphic_targets	:= $(strip \
	$(filter $(allowed_batch_graphic_targets),$(real_goals)) \
	)

specified_gpi_targets	:= $(patsubst %.gpi,%.$(default_graphic_extension),\
	$(filter $(patsubst %.$(default_graphic_extension),%.gpi,$(specified_graphic_targets)),\
		$(all_files.gpi)) \
	)

# Determine which .d files need including from the information gained above.
# This is done by first checking whether a batch target exists.  If it does,
# then all *default* stems are used to create possible includes (nobuild need
# not apply for batch status).  If no batch targets exist, then the individual
# targets are considered and appropriate includes are taken from them.
source_stems_to_include	:= \
	$(sort\
	$(if $(specified_batch_source_targets),\
		$(default_stems_ss),\
		$(foreach t,$(specified_source_targets),\
		$(foreach p,$(allowed_source_patterns),\
			$(patsubst $p,%,$(filter $p $(stems_ssg),$t)) \
		)) \
	))

# Determine which .gpi.d files are needed using the above information.  We
# first check whether a batch target is specified, then check individual
# graphics that may have been specified.
graphic_stems_to_include	:= \
	$(sort\
	$(if $(specified_batch_graphic_targets),\
		$(default_stems.gpi),\
		$(foreach t,$(specified_gpi_targets),\
		$(foreach p,$(allowed_graphic_patterns),\
			$(patsubst $p,%,$(filter $p,$t)) \
		)) \
	))

# All dependencies for the 'all' targets
all_pdf_targets		:= $(addsuffix .pdf,$(stems_ssg))
all_ps_targets		:= $(addsuffix .ps,$(stems_ssg))
all_dvi_targets		:= $(addsuffix .dvi,$(stems_ssg))
all_tex_targets		:= $(addsuffix .tex,$(stems_sg))
all_d_targets		:= $(addsuffix .d,$(stems_ssg))
all_graphics_targets	:= $(addsuffix .$(default_graphic_extension),$(stems_gg))
all_pstex_targets	:= $(addsuffix .pstex_t,$(stems.fig))
all_dot2tex_targets	:= $(addsuffix .dot_t,$(stems.dot))

all_known_graphics	:= $(sort $(all_graphics_targets) $(wildcard *.$(default_graphic_extension)))

default_pdf_targets	:= $(addsuffix .pdf,$(default_stems_ss))

ifeq "$(strip $(BUILD_STRATEGY))" "latex"
default_ps_targets	:= $(addsuffix .ps,$(default_stems_ss))
default_dvi_targets	:= $(addsuffix .dvi,$(default_stems_ss))
pre_pdf_extensions	:= dvi ps
endif

# Extensions generated by LaTeX invocation that can be removed when complete
rm_ext		:= \
	log *.log aux $(pre_pdf_extensions) ps pdf blg bcf bbl out nav snm toc lof lot lol pfg \
	fls vrb idx ind ilg glg glo gls lox nls nlo nlg brf mtc* mlf* mlt* maf brf ist fmt
backup_patterns	:= *~ *.bak *.backup body.tmp head.tmp

graph_stem	:= _graph

# All LaTeX-generated files that can be safely removed

rm_tex := \
	$(foreach e,$(rm_ext),$(addsuffix .$e,$(all_stems_source))) \
	$(foreach e,$(rm_ext) tex,$(addsuffix .$e,$(all_stems_sg))) \
	$(addsuffix .log,$(all_ps_targets) $(all_pdf_targets)) \
	$(addsuffix .*.log,$(stems_graphic))

# These are the files that will affect .gpi transformation for all .gpi files.
#
# Use only the first one found.  Backward compatible values are at the end.
# Note that we use foreach, even though wildcard also returns a list, to ensure
# that the order in the uppercase variables is preserved.  Directory listings
# provide no such guarantee, so we avoid relying on them.
gpi_sed		:= $(strip \
	$(firstword $(foreach f,$(GNUPLOT_SED),$(wildcard $f))))
gpi_global	:= $(strip \
	$(firstword $(foreach f,$(GNUPLOT_GLOBAL),$(wildcard $f))))

#
# Functions used in generating output
#

# Outputs all source dependencies to stdout.  The first argument is the file to
# be parsed, the second is a list of files that will show up as dependencies in
# the new .d file created here.
#
# $(call get-inputs,<parsed file>,<target files>)
define get-inputs
$(SED) \
-e '/^INPUT/!d' \
-e 's!^INPUT \(\./\)\{0,1\}!!' \
-e 's/[[:space:]]/\\ /g' \
-e 's/\(.*\)\.aux$$/\1.tex/' \
-e '/\.tex$$/b addtargets' \
-e '/\.cls$$/b addtargets' \
-e '/\.sty$$/b addtargets' \
-e '/\.pstex_t$$/b addtargets' \
-e '/\.dot_t$$/b addtargets' \
-e 'd' \
-e ':addtargets' \
-e 's!.*!$2: $$(call path-norm,&)!' \
'$1' | $(SORT) | $(UNIQ)
endef

# $(call get-format,<tex file>,<target files>)
define get-format
$(SED) \
-e '1!d' \
-e '/^%&\([[:alnum:]]\{1,\}\)\( .*\)*$$/{' \
-e '  s!!\1!' \
-e '  h' \
-e '  s/.*/# MISSING format "&.fmt" (comment forces rebuild of target file)/' \
-e '  p' \
-e '  g' \
-e '  s!.*!$2: $$(call path-norm,&.fmt)!' \
-e '  p' \
-e '}' \
-e 'd' \
'$1'
endef

# $(call get-missing-inputs,<log file>,<target files>)
define get-missing-inputs
$(SED) \
-e '$${' \
-e '  /^$$/!{' \
-e '    H' \
-e '    s/.*//' \
-e '  }' \
-e '}' \
-e '/^$$/!{' \
-e '  H' \
-e '  d' \
-e '}' \
-e '/^$$/{' \
-e '  x' \
-e '  s/^\(\n\)\(.*\)/\2\1/' \
-e '}' \
-e '/^::P\(P\{1,\}\)::/{' \
-e '  s//::\1::/' \
-e '  G' \
-e '  h' \
-e '  d' \
-e '}' \
-e '/^::P::/{' \
-e '  s//::0::/' \
-e '  G' \
-e '}' \
-e 'b start' \
-e ':needonemore' \
-e 's/^/::P::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':needtwomore' \
-e 's/^/::PP::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':needthreemore' \
-e 's/^/::PPP::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':start' \
-e '/^! LaTeX Error: File `/{' \
-e '  b needtwomore' \
-e '}' \
-e '/^::0::\(.*\)/{' \
-e '  s//\1/' \
-e '  /Default extension: /!d' \
-e '  s/.*File `\([^'"'"']*\)'"'"' not found.*/\1/' \
-e '  s/[[:cntrl:]]//' \
-e '  /\.tex/!s/$$/.tex/' \
-e '  s/[[:space:]]/\\ /g' \
-e '  h' \
-e '  s/.*/# MISSING input "&" - (presence of comment affects build)/' \
-e '  p' \
-e '  s/.*//' \
-e '  x' \
-e '  s!^.*!$2: $$(call path-norm,&)!' \
-e '  p' \
-e '}' \
-e 'd' \
'$1' | $(SORT) | $(UNIQ)
endef

# Get source file for specified graphics stem.
#
# $(call graphics-source,<stem>)
define graphics-source
$(strip $(firstword \
	$(wildcard \
		$(addprefix $1.,\
			$(graphic_source_extensions))) \
	$1 \
))
endef

# Get the target file for the specified graphics file/stem
#
# $(call graphics-target,<stem>)
define graphics-target
$(strip $(if 	$(filter $(addprefix %.,$(graphic_target_extensions)),$1), $1,
	$(firstword $(patsubst $(addprefix %.,$(graphic_source_extensions) $(graphic_target_extensions)), %, $1).$(default_graphic_extension) $1.$(default_graphic_extension))))
endef

# Outputs all of the graphical dependencies to stdout.  The first argument is
# the stem of the source file being built, the second is a list of suffixes
# that will show up as dependencies in the generated .d file.
#
# Note that we try to escape spaces in filenames where possible.  We have to do
# it with three backslashes so that as the name percolates through the makefile
# it eventually ends up with the proper escaping when the build rule is found.
# Ugly, but it appears to work.  Note that graphicx doesn't allow filenames
# with spaces, so this could in many ways be moot unless you're using something
# like grffile.
#
# For pdflatex, we really need the missing file to be specified without an
# extension, otherwise compilation barfs on the first missing file.  Truly
# annoying, but there you have it.
#
# It turns out that the graphics errors, although they have lines with empty
# space, are only made of two paragraphs.  So, we just use some sed magic to
# get everything into paragraphs, detect when it's a paragraph that interests
# us, and double it up.  Then we get the filename only if we're missing
# extensions (a sign that it's graphicx complaining).
#
# $(call get-graphics,<target file stem>)
define get-graphics
$(SED) \
-e '/^File: \(.*\) Graphic file (type [^)]*)/{' \
-e '  s//\1/' \
-e '  s/\.e\{0,1\}ps$$//' \
-e '  b addtargets' \
-e '}' \
-e '$${' \
-e '  /^$$/!{' \
-e '    H' \
-e '    s/.*//' \
-e '  }' \
-e '}' \
-e '/^$$/!{' \
-e '  H' \
-e '  d' \
-e '}' \
-e '/^$$/{' \
-e '  x' \
-e '  s/^\(\n\)\(.*\)/\2\1/' \
-e '}' \
-e '/^::P\(P\{1,\}\)::/{' \
-e '  s//::\1::/' \
-e '  G' \
-e '  h' \
-e '  d' \
-e '}' \
-e '/^::P::/{' \
-e '  s//::0::/' \
-e '  G' \
-e '}' \
-e 'b start' \
-e ':needonemore' \
-e 's/^/::P::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':needtwomore' \
-e 's/^/::PP::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':needthreemore' \
-e 's/^/::PPP::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':start' \
-e '/^[^[:cntrl:]:]*:[[:digit:]]\{1,\}:[[:space:][:cntrl:]]*LaTeX[[:space:][:cntrl:]]*Error:[[:space:][:cntrl:]]*File `/{' \
-e '  s/\n//g' \
-e '  b needonemore' \
-e '}' \
-e '/^::0::.*: LaTeX Error: File `/{' \
-e '  /\n\n$$/{' \
-e '    s/^::0:://' \
-e '    b needonemore' \
-e '  }' \
-e '  s/\n\{1,\}/ /g' \
-e '  s/[[:space:]]\{1,\}/ /g' \
-e '  s/^.*File `//' \
-e '  /extensions: /{' \
-e '    s/'"'"' not found\..*extensions: \([^[:space:]]*\).*/::::\1/' \
-e '    b fileparsed' \
-e '  }' \
-e '  s/'"'"' not found\..*/::::/' \
-e '  :fileparsed' \
-e '  s/\.e\{0,1\}ps::::$$/::::/' \
-e '  h' \
-e '  s/\(.*\)::::\(.*\)/# MISSING stem "\1" - allowed extensions are "\2" - leave comment here - it affects the build/' \
-e '  p' \
-e '  g' \
-e '  s/::::.*//' \
-e '  b addtargets' \
-e '}' \
-e 'd' \
-e ':addtargets' \
-e 's/[[:space:]]/\\\\\\&/g' \
-e 'h' \
-e 's/.*/-include &.gpi.d/' \
-e 'p' \
-e 'g' \
-e 's!.*!$1.d: $$$$(call graphics-source,&)!' \
-e 'p' \
-e 's/.*//' \
-e 'x' \
-e 's!.*!$1.$(build_target_extension) $1._graphics: $$$$(call graphics-target,&)!' \
-e 'p' \
-e 'd' \
$1.log
endef

# Get some special comments out of the source file (e.g., paper size, beamer
# usage, etc.)
#
# $(call get-source-specials,<source file name>,<output file>)
define get-source-specials
$(SED) \
-e '/^%%[[:space:]]*\([^%].*\)[[:space:]]*$$/{' \
-e '  s//\1/' \
-e '  s/[[:space:]]//g' \
-e '  /BEAMER/{' \
-e '    /BEAMERLARGE/!d' \
-e '    s/.*/BEAMER/' \
-e '  }' \
-e '  p' \
-e '  d' \
-e '}' \
-e '/\\documentclass[^{]*{.*}/b procclass' \
-e '/\\documentclass/,/}/{' \
-e '  s/%.*//' \
-e '  H' \
-e '  /}/{' \
-e '    s/.*//' \
-e '    x' \
-e '    b procclass' \
-e '  }' \
-e '  d' \
-e '}' \
-e 'd' \
-e ':procclass' \
-e 's/\\documentclass//' \
-e 's/[][]//g' \
-e 's/{.*}//' \
-e 's/[[:cntrl:][:space:]]*//g' \
-e 's/,/ /g' \
-e 's/^/ /' \
-e 's/$$/ /' \
-e '/.* \([[:alnum:]]\{1,\}\)paper .*/{' \
-e '  h' \
-e '  s//PAPERSIZE=\1/' \
-e '  p' \
-e '  g' \
-e '}' \
-e '/.* landscape .*/{' \
-e '  h' \
-e '  s//ORIENTATION=landscape/' \
-e '  p' \
-e '  g' \
-e '}' \
-e 'd' \
$1 > '$2'
endef

# Checks for build failure due to pstex inclusion, and gives instructions.
#
# $(call die-on-pstexs,<parsed file>)
define die-on-pstexs
if $(EGREP) -q '^! LaTeX Error: File .*\.pstex.* not found' $1; then \
	$(ECHO) "$(C_ERROR)Missing pstex_t file(s)$(C_RESET)"; \
	$(ECHO) "$(C_ERROR)Please run$(C_RESET)"; \
	$(ECHO) "$(C_ERROR)  make all-pstex$(C_RESET)"; \
	$(ECHO) "$(C_ERROR)before proceeding.$(C_RESET)"; \
	exit 1; \
fi
endef

# Checks for the use of import.sty and bails - we don't support subdirectories
#
# $(call die-on-import-sty,<log file>)
define die-on-import-sty
if $(EGREP) -s '/import.sty\)' '$1'; then \
	$(ECHO) "$(C_ERROR)import.sty is not supported - included files must"; \
	$(ECHO) "$(C_ERROR)be in the same directory as the primary document$(C_RESET)"; \
	exit 1; \
fi
endef

# Checks for build failure due to dot2tex, and gives instructions.
#
# $(call die-on-dot2tex,<parsed file>)
define die-on-dot2tex
if $(EGREP) -q ' LaTeX Error: File .*\.dot_t.* not found' $1; then \
	$(ECHO) "$(C_ERROR)Missing dot_t file(s)$(C_RESET)"; \
	$(ECHO) "$(C_ERROR)Please run$(C_RESET)"; \
	$(ECHO) "$(C_ERROR)  make all-dot2tex$(C_RESET)"; \
	$(ECHO) "$(C_ERROR)before proceeding.$(C_RESET)"; \
	exit 1; \
fi
endef

# Checks for the existence of a .aux file, and dies with an error message if it
# isn't there.  Note that we pass the file stem in, not the full filename,
# e.g., to check for foo.aux, we call it thus: $(call die-on-no-aux,foo)
#
# $(call die-on-no-aux,<aux stem>)
define die-on-no-aux
if $(call test-not-exists,$1.aux); then \
	$(call colorize-latex-errors,$1.log); \
	$(ECHO) "$(C_ERROR)Error: failed to create $1.aux$(C_RESET)"; \
	exit 1; \
fi
endef

# Outputs all index files to stdout.  Arg 1 is the source file stem, arg 2 is
# the list of targets for the discovered dependency.
#
# $(call get-log-index,<log file stem>,<target files>)
define get-log-index
$(SED) \
-e 's/^No file \(.*\.ind\)\.$$/TARGETS=\1/' \
-e 's/^No file \(.*\.[gn]ls\)\.$$/TARGETS=\1/' \
-e 's/[[:space:]]/\\&/g' \
-e '/^TARGETS=/{' \
-e '  h' \
-e '  s!^TARGETS=!$2: !p' \
-e '  g' \
-e '  s!^TARGETS=\(.*\)!\1: $1.tex!p' \
-e '}' \
-e 'd' \
'$1.log' | $(SORT) | $(UNIQ)
endef


# Outputs all bibliography files to stdout.  Arg 1 is the source stem, arg 2 is
# a list of targets for each dependency found.
#
# The script kills all lines that do not contain bibdata.  Remaining lines have
# the \bibdata macro and delimiters removed to create a dependency list.  A
# trailing comma is added, then all adjacent commas are collapsed into a single
# comma.  Then commas are replaced with the string .bib[space], and the
# trailing space is killed off.  Finally, all filename spaces are escaped.
# This produces a list of space-delimited .bib filenames, which is what the
# make dep file expects to see.
#
# Note that we give kpsewhich a bogus argument so that a failure of sed to
# produce output will not cause an error.
#
# $(call get-bibs,<aux file>,<targets>)
define get-bibs
$(SED) \
-e '/^\\bibdata/!d' \
-e 's/\\bibdata{\([^}]*\)}/\1,/' \
-e 's/,\{2,\}/,/g' \
-e 's/[[:space:]]/\\&/g' \
-e 's/,/.bib /g' \
-e 's/ \{1,\}$$//' \
'$1' | $(XARGS) $(KPSEWHICH) '#######' | \
$(SED) \
-e 's!.*!$2: $$(call path-norm,&)!' | \
$(SORT) | $(UNIQ)
endef

# Makes a an aux file that only has stuff relevant to the target in it
# $(call make-auxtarget-file,<flattened-aux>,<new-aux>)
define make-auxtarget-file
$(SED) \
-e '/^\\newlabel/!d' \
$1 > $2
endef

# Makes an aux file that only has stuff relevant to the bbl in it
# $(call make-auxbbl-file,<flattened-aux>,<new-aux>)
define make-auxbbl-file
$(SED) \
-e '/^\\newlabel/d' \
$1 > $2
endef

# Makes a .gpi.d file from a .gpi file
# $(call make-gpi-d,<.gpi>,<.gpi.d>)
define make-gpi-d
$(ECHO) '# vim: ft=make' > $2; \
$(ECHO) 'ifndef INCLUDED_$(call cleanse-filename,$2)' >> $2; \
$(ECHO) 'INCLUDED_$(call cleanse-filename,$2) := 1' >> $2; \
$(call get-gpi-deps,$1,$(addprefix $(2:%.gpi.d=%).,$(GPI_OUTPUT_EXTENSION) gpi.d)) >> $2; \
$(ECHO) 'endif' >> $2;
endef

# Parse .gpi files for data and loaded dependencies, output to stdout
#
# The sed script here tries to be clever about obtaining valid
# filenames from the gpi file.  It assumes that the plot command starts its own
# line, which is not too difficult a constraint to satisfy.
#
# This command script also generates 'include' directives for every 'load'
# command in the .gpi file.  The load command must appear on a line by itself
# and the file it loads must have the suffix .gpi.  If you don't want it to be
# compiled when running make graphics, then give it a suffix of ._include_.gpi.
#
# $(call get-gpi-deps,<gpi file>,<targets>)
define get-gpi-deps
$(SED) \
-e '/^[[:space:]]*s\{0,1\}plot/,/[^\\]$$/{' \
-e ' H' \
-e ' /[^\\]$$/{' \
-e '  s/.*//' \
-e '  x' \
-e '  s/\\\{0,1\}\n//g' \
-e '  s/^[[:space:]]*s\{0,1\}plot[[:space:]]*\(\[[^]]*\][[:space:]]*\)*/,/' \
-e '  s/[[:space:]]*\(['"'"'\'"'"''"'"'"][^'"'"'\'"'"''"'"'"]*['"'"'\'"'"''"'"'"]\)\{0,1\}[^,]*/\1/g' \
-e '  s/,['"'"'\'"'"''"'"'"]-\{0,1\}['"'"'\'"'"''"'"'"]//g' \
-e '  s/[,'"'"'\'"'"''"'"'"]\{1,\}/ /g' \
-e '  s/.*:.*/$$(error Error: Filenames with colons are not allowed: &)/' \
-e '  s!.*!$2: &!' \
-e '  p' \
-e ' }' \
-e ' d' \
-e '}' \
-e 's/^[[:space:]]*load[[:space:]]*['"'"'\'"'"''"'"'"]\([^'"'"'\'"'"''"'"'"]*\.gpi\)['"'"'\'"'"''"'"'"].*$$/-include \1.d/p' \
-e 'd' \
'$1'
endef

# Colorizes real, honest-to-goodness LaTeX errors that can't be overcome with
# recompilation.
#
# Note that we only ignore file not found errors for things that we know how to
# build, like graphics files.
#
# Also note that the output of this is piped through sed again to escape any
# backslashes that might have made it through.  This is to avoid sending things
# like "\right" to echo, which interprets \r as LF.  In bash, we could just do
# ${var//\\/\\\\}, but in other popular sh variants (like dash), this doesn't
# work.
#
# $(call colorize-latex-errors,<log file>)
define colorize-latex-errors
$(SED) \
-e '$${' \
-e '  /^$$/!{' \
-e '    H' \
-e '    s/.*//' \
-e '  }' \
-e '}' \
-e '/^$$/!{' \
-e '  H' \
-e '  d' \
-e '}' \
-e '/^$$/{' \
-e '  x' \
-e '  s/^\(\n\)\(.*\)/\2\1/' \
-e '}' \
-e '/^::P\(P\{1,\}\)::/{' \
-e '  s//::\1::/' \
-e '  G' \
-e '  h' \
-e '  d' \
-e '}' \
-e '/^::P::/{' \
-e '  s//::0::/' \
-e '  G' \
-e '}' \
-e 'b start' \
-e ':needonemore' \
-e 's/^/::P::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':needtwomore' \
-e 's/^/::PP::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':needthreemore' \
-e 's/^/::PPP::/' \
-e 'G' \
-e 'h' \
-e 'd' \
-e ':start' \
-e '/^! LaTeX Error: File /{' \
-e '  s/\n//g' \
-e '  b needtwomore' \
-e '}' \
-e 's/^[^[:cntrl:]:]*:[[:digit:]]\{1,\}:/!!! &/' \
-e 's/^\(.*\n\)\([^[:cntrl:]:]*:[[:digit:]]\{1,\}: .*\)/\1!!! \2/' \
-e '/^!!! .*[[:space:][:cntrl:]]LaTeX[[:space:][:cntrl:]]Error:[[:space:][:cntrl:]]*File /{' \
-e '  s/\n//g' \
-e '  b needonemore' \
-e '}' \
-e '/^::0::! LaTeX Error: File .*/{' \
-e '  /\n\n$$/{' \
-e '    s/^::0:://' \
-e '    b needonemore' \
-e '  }' \
-e '  s/^::0::! //' \
-e '  s/^\(.*not found.\).*Enter file name:.*\n\(.*[[:digit:]]\{1,\}\): Emergency stop.*/\2: \1/' \
-e '  b error' \
-e '}' \
-e '/^::0::!!! .*LaTeX Error: File .*/{' \
-e '  /\n\n$$/{' \
-e '    s/^::0:://' \
-e '    b needonemore' \
-e '  }' \
-e '  s/::0::!!! //' \
-e '  /File .*\.e\{0,1\}ps'"'"' not found/b skip' \
-e '  /could not locate.*any of these extensions:/{' \
-e '    b skip' \
-e '  }' \
-e '  s/\(not found\.\).*/\1/' \
-e '  s/^/!!! /' \
-e '  b error' \
-e '}' \
-e '/^\(.* LaTeX Error: Missing .begin.document.\.\).*/{' \
-e '  s//\1 --- Are you trying to build an include file?/' \
-e '  b error' \
-e '}' \
-e '/.*\(!!! .*Undefined control sequence\)[^[:cntrl:]]*\(.*\)/{' \
-e '  s//\1: \2/' \
-e '  s/\nl\.[[:digit:]][^[:cntrl:]]*\(\\[^\\[:cntrl:]]*\).*/\1/' \
-e '  b error' \
-e '}' \
-e '/^\(!pdfTeX error:.*\)s*/{' \
-e '  b error' \
-e '}' \
-e '/.*\(!!! .*\)/{' \
-e '  s//\1/' \
-e '  s/[[:cntrl:]]//' \
-e '  s/[[:cntrl:]]$$//' \
-e '  /Cannot determine size of graphic .*(no BoundingBox)/b skip' \
-e '  b error' \
-e '}' \
-e ':skip' \
-e 'd' \
-e ':error' \
-e 's/^!\(!! \)\{0,1\}\(.*\)/$(C_ERROR)\2$(C_RESET)/' \
-e 'p' \
-e 'd' \
'$1' | $(SED) -e 's/\\\\/\\\\\\\\/g'
endef

# Colorize Makeindex errors
define colorize-makeindex-errors
$(SED) \
-e '/^!! /{' \
-e '  N' \
-e '  s/^.*$$/$(C_ERROR)&$(C_RESET)/' \
-e '  p' \
-e '}' \
-e 'd' \
'$1'
endef

# Colorize xindy errors
# $(call colorize-xindy-errors,<log file>)
define colorize-xindy-errors
$(SED) \
-e 's/^xindy:.*/$(C_ERROR)&$(C_RESET)/p' \
-e 'd' \
'$1'
endef

# Colorize epstopdf errors
#
# $(call colorize-epstopdf-errors,<log file>)
define colorize-epstopdf-errors
$(SED) \
-e '/^Error:/,/^Execution stack:/{' \
-e '  /^Execution stack:/d' \
-e '  s/.*/$(C_ERROR)&$(C_RESET)/' \
-e '  p' \
-e '}' \
-e 'd' \
'$1'
endef

# Colorize GNUplot errors
#
# $(call colorize-gnuplot-errors,<log file>)
define colorize-gnuplot-errors
$(SED) \
-e '/, line [0-9]*:/!{' \
-e '  H' \
-e '  x' \
-e '  s/.*\n\(.*\n.*\)$$/\1/' \
-e '  x' \
-e '}' \
-e '/, line [0-9]*:/{' \
-e '  H' \
-e '  /unknown.*terminal type/{' \
-e '    s/.*/--- Try changing the GNUPLOT_OUTPUT_EXTENSION variable to '"'"'eps'"'"'./' \
-e '    H' \
-e '  }' \
-e '  /gpihead/{' \
-e '    s/.*/--- This could be a Makefile bug - contact the maintainer./' \
-e '    H' \
-e '  }' \
-e '  g' \
-e '  s/.*/$(C_ERROR)&$(C_RESET)/' \
-e '  p' \
-e '}' \
-e '/^gnuplot>/,/^$$/{' \
-e '  s/^gnuplot.*/$(C_ERROR)&/' \
-e '  s/^$$/$(C_RESET)/' \
-e '  p' \
-e '}' \
-e 'd' \
$1
endef

# Colorize GraphViz errors
#
# $(call colorize-dot-errors,<log file>)
define colorize-dot-errors
$(SED) \
-e 's/.*not found.*/$(C_ERROR)&$(C_RESET)/p' \
-e '/^Error:/,/context:/s/.*/$(C_ERROR)&$(C_RESET)/p' \
-e 's/^Warning:.*/$(C_WARNING)&$(C_RESET)/p' \
-e 'd' \
'$1'
endef

# Get all important .aux files from the top-level .aux file and merges them all
# into a single file, which it outputs to stdout.
# It does this by finding all \input commands and creating a new sed script
# that reads those files inline when it encounters one.
# It then runs that sed script, generating a flattened aux file, and
# then it cleans up the flattened file by removing some crufty things.
#
# $(call flatten-aux,<toplevel aux>,<output file>)
define flatten-aux
$(SED) \
-e '/\\@input{\(.*\)}/{' \
-e '  s//\1/' \
-e '  s![.:]!\\&!g' \
-e '  h' \
-e '  s!.*!\\:\\\\@input{&}:{!' \
-e '  p' \
-e '  x' \
-e '  s/\\././g' \
-e '  s/.*/r &/p' \
-e '  s/.*/d/p' \
-e '  s/.*/}/p' \
-e '  d' \
-e '}' \
-e 'd' \
'$1' > "$1.$$$$.sed.make"; \
$(SED) -f "$1.$$$$.sed.make" '$1' > "$1.$$$$.make"; \
$(SED) \
-e '/^\\relax/d' \
-e '/^\\bibcite/d' \
-e 's/^\(\\newlabel{[^}]\{1,\}}\).*/\1/' \
"$1.$$$$.make" | $(SORT) > '$2'; \
$(call remove-temporary-files,$1.$$$$.make $1.$$$$.sed.make)
endef

# Generate pdf from postscript
#
# Note that we don't just call ps2pdf, since there are so many versions of that
# script on various systems.  Instead, we call the postscript interpreter
# directly.
#
# $(call ps2pdf,infile,outfile,[embed fonts])
define ps2pdf
	$(GS) \
		-dSAFER -dCompatibilityLevel=$(PS_COMPATIBILITY) \
		$(if $3,$(PS_EMBED_OPTIONS)) \
		-q -dNOPAUSE -dBATCH \
		-sDEVICE=pdfwrite -sstdout=%stderr \
		'-sOutputFile=$2' \
		-dSAFER -dCompatibilityLevel=$(PS_COMPATIBILITY) \
		$(if $3,$(PS_EMBED_OPTIONS)) \
		-c .setpdfwrite \
		-f '$1'
endef

# Colorize LaTeX output.
color_tex := \
$(SED) \
-e '$${' \
-e '  /^$$/!{' \
-e '    H' \
-e '    s/.*//' \
-e '  }' \
-e '}' \
-e '/^$$/!{' \
-e '  H' \
-e '  d' \
-e '}' \
-e '/^$$/{' \
-e '  x' \
-e '  s/^\n//' \
-e '  /Output written on /{' \
-e '    s/.*Output written on \([^(]*\) (\([^)]\{1,\}\)).*/Success!  Wrote \2 to \1/' \
-e '    s/[[:digit:]]\{1,\}/$(C_PAGES)&$(C_RESET)/g' \
-e '    s/Success!/$(C_SUCCESS)&$(C_RESET)/g' \
-e '    s/to \(.*\)$$/to $(C_SUCCESS)\1$(C_RESET)/' \
-e '    b end' \
-e '  }' \
-e '  / *LaTeX Error:.*/{' \
-e '    s/.*\( *LaTeX Error:.*\)/\1/' \
-e '    b error' \
-e '  }' \
-e '  /^[^[:cntrl:]:]*:[[:digit:]]\{1,\}:/b error' \
-e '  /.*Warning:.*/{' \
-e '    s//$(C_WARNING)&$(C_RESET)/' \
-e '    b end' \
-e '  }' \
-e '  /Underfull.*/{' \
-e '    s/.*\(Underfull.*\)/$(C_UNDERFULL)\1$(C_RESET)/' \
-e '    b end' \
-e '  }' \
-e '  /Overfull.*/{' \
-e '    s/.*\(Overfull.*\)/$(C_OVERFULL)\1$(C_RESET)/' \
-e '    b end' \
-e '  }' \
-e '  d' \
-e '  :error' \
-e '  s/.*/$(C_ERROR)&$(C_RESET)/' \
-e '  b end' \
-e '  :end' \
-e '  G' \
-e '}'

# Colorize BibTeX output.
color_bib := \
$(SED) \
-e 's/^Warning--.*/$(C_WARNING)&$(C_RESET)/' \
-e 't' \
-e '/---/,/^.[^:]/{' \
-e '  H' \
-e '  /^.[^:]/{' \
-e '    x' \
-e '    s/\n\(.*\)/$(C_ERROR)\1$(C_RESET)/' \
-e '    p' \
-e '    s/.*//' \
-e '    h' \
-e '    d' \
-e '  }' \
-e '  d' \
-e '}' \
-e '/(.*error.*)/s//$(C_ERROR)&$(C_RESET)/' \
-e 'd'

# Make beamer output big enough to print on a full page.  Landscape doesn't
# seem to work correctly.
enlarge_beamer	= $(PSNUP) -l -1 -W128mm -H96mm -pletter

# $(call test-run-again,<source stem>)
define test-run-again
$(EGREP) '^(.*Rerun .*|No file $1\.[^.]+\.)$$' $1.log \
| $(EGREP) -q -v '^(Package: rerunfilecheck.*Rerun checks for auxiliary files.*)$$'
endef

# This tests whether the build target commands should be run at all, from
# viewing the log file.
# $(call test-log-for-need-to-run,<source stem>)
define test-log-for-need-to-run
$(SED) \
-e '/^No file $(call escape-fname-regex,$1)\.aux\./d' \
$1.log \
| $(EGREP) '^(.*Rerun .*|No file $1\.[^.]+\.|No file .+\.tex\.|LaTeX Warning: File.*)$$' \
| $(EGREP) -q -v '^(Package: rerunfilecheck.*Rerun checks for auxiliary files.*)$$'
endef

# LaTeX invocations
#
# Note that we use
#
#  -recorder: generates .fls files for things that are input and output
#  -jobname: to make sure that .fls files are named after the source that created them
#  -file-line-error: to make sure that we have good line information for error output
#  -interaction=batchmode: so that we don't stop on errors (we'll parse logs for that)
#
# $(call latex,<tex file stem, e.g., $*>,[extra LaTeX args])
define run-latex
$(latex_build_program) -jobname='$1' -interaction=batchmode -file-line-error $(LATEX_OPTS) $(if $2,$2,) $1 > /dev/null; \
$(call transcript,latex,$1)
endef

# $(call latex-color-log,<LaTeX stem>)
latex-color-log	= $(color_tex) $1.log

# $(call run-makeindex,<input>,<output>,<log>,[.ist style file])
define run-makeindex
success=1; \
if ! $(MAKEINDEX) -q $1 -t $3 -o $2 $(if $4,-s $4,) > /dev/null || $(EGREP) -q '^!!' $3; \
then \
	$(call colorize-makeindex-errors,$3); \
	$(RM) -f '$2'; \
	success=0; \
	$(call transcript,makeindex,$1); \
fi; \
[ "$$success" = "1" ] && $(sh_true) || $(sh_false);
endef

# $(call run-xindy,<input>,<output>,<module>,<log>)
define run-xindy
success=1; \
if ! $(XINDY) -q -o $2 -L $(XINDYLANG) -C $(XINDYENC) -I xindy -M $3 -t $4 $1 > /dev/null || $(EGREP) -q '^xindy:' $4; then \
	$(call colorize-xindy-errors,$4); \
	$(RM) -f '$2'; \
	success=0; \
	$(call transcript,xindy,$1); \
fi; \
[ "$$success" = "1" ] && $(sh_true) || $(sh_false);
endef

# This runs the given script to generate output, and it uses MAKE_RESTARTS to
# ensure that it never runs it more than once for a particular root make
# invocation.
#
# $(call run-script,<interpreter>,<input>,<output>)
define run-script
$(call test-not-exists,$2.cookie) && $(ECHO) "restarts=$(RESTARTS)" \
	> $2.cookie && $(ECHO) "level=$(MAKELEVEL)" >> $2.cookie; \
restarts=`$(SED) -n -e 's/^restarts=//p' $2.cookie`; \
level=`$(SED) -n -e 's/^level=//p' $2.cookie`; \
if $(EXPR) $(MAKELEVEL) '<=' $$level '&' $(RESTARTS) '<=' $$restarts >/dev/null; then \
	$(call echo-build,$2,$3,$(RESTARTS)-$(MAKELEVEL)); \
	$1 '$2' '$3'; \
	$(ECHO) "restarts=$(RESTARTS)" > '$2.cookie'; \
	$(ECHO) "level=$(MAKELEVEL)" >> '$2.cookie'; \
fi
endef

# BibTeX invocations
#
# $(call run-bibtex,<tex stem>)
ifeq "$(strip $(BIB_STRATEGY))" "bibtex"
run-bibtex	= $(BIBTEX) $1 | $(color_bib); $(call transcript,bibtex,$1)
endif
ifeq "$(strip $(BIB_STRATEGY))" "biblatex"
run-bibtex	= $(BIBER) $1 | $(color_bib); $(call transcript,biber,$1)
endif

# $(call convert-eps-to-pdf,<eps file>,<pdf file>,[gray])
# Note that we don't use the --filter flag because it has trouble with bounding boxes that way.
define convert-eps-to-pdf
$(if $3,$(CAT) '$1' | $(call kill-ps-color) > '$1.cookie',$(CP) '$1' '$1.cookie'); \
$(EPSTOPDF) '$1.cookie' --outfile='$2' > $1.log; \
$(call colorize-epstopdf-errors,$1.log);
endef

# $(call default-gpi-fontsize,<output file>)
#
# Find the default fontsize given the *output* file (it is based on the output extension)
#
default-gpi-fontsize = $(if $(filter %.pdf,$1),$(DEFAULT_GPI_PDF_FONTSIZE),$(DEFAULT_GPI_EPS_FONTSIZE))

# $(call gpi-fontsize,<gpi file>,<output file>)
#
# Find out what the gnuplot fontsize should be.  Tries, in this order:
# - ##FONTSIZE comment in gpi file
# - ##FONTSIZE comment in global gpi file
# - default fontsize based on output type
define gpi-fontsize
$(strip $(firstword \
	$(shell $(SED) -e 's/^\#\#FONTSIZE=\([[:digit:]]\{1,\}\)/\1/p' -e 'd' $1 $(strip $(gpi_global))) \
	$(call default-gpi-fontsize,$2)))
endef

# $(call gpi-monochrome,<gpi file>,[gray])
define gpi-monochrome
$(strip $(if $2,monochrome,$(if $(shell $(EGREP) '^\#\#[[:space:]]*GRAY[[:space:]]*$$' $1 $(gpi_global)),monochrome,color)))
endef

# $(call gpi-font-entry,<output file>,<fontsize>)
#
# Get the font entry given the output file (type) and the font size.  For PDF
# it uses fsize or font, for eps it just uses the bare number.
gpi-font-entry = $(if $(filter %.pdf,$1),$(subst FONTSIZE,$2,$(GPI_FSIZE_SYNTAX)),$2)

# $(call gpi-terminal,<gpi file><output file>,[gray])
#
# Get the terminal settings for a given gpi and its intended output file
define gpi-terminal
$(if $(filter %.pdf,$2),pdf enhanced,postscript enhanced eps) \
$(call gpi-font-entry,$2,$(call gpi-fontsize,$1,$2)) \
$(call gpi-monochrome,$1,$3)
endef

# $(call gpi-embed-pdf-fonts,<input file>,<output file>)
#
define gpi-embed-pdf-fonts
$(GS) \
	-q \
	-dSAFER \
	-dNOPAUSE \
	-dBATCH \
	-sDEVICE=$(if $(filter pdf,$(GPI_OUTPUT_EXTENSION)),pdfwrite,pswrite) \
	-sOutputFile='$2' \
	-sstdout=%stderr \
	-dColorConversionStrategy=/LeaveColorUnchanged \
	-dCompatibilityLevel=1.5 \
	-dPDFSETTINGS=/prepress \
	-c .setpdfwrite \
	-f '$1'
endef

# $(call convert-gpi,<gpi file>,<output file>,[gray])
#
define convert-gpi
$(ECHO) 'set terminal $(call gpi-terminal,$1,$2,$3)' > $1head.make; \
$(ECHO) 'set output "$2"' >> $1head.make; \
$(if $(gpi_global),$(CAT) $(gpi_global) >> $1head.make;,) \
fnames='$1head.make $1';\
$(if $(gpi_sed),\
	$(SED) -f '$(gpi_sed)' $$fnames > $1.temp.make; \
	fnames=$1.temp.make;,\
) \
success=1; \
if ! $(GNUPLOT) $$fnames 2>$1.log; then \
	$(call colorize-gnuplot-errors,$1.log); \
	success=0; \
elif [ x"$(suffix $2)" = x".pdf" ]; then \
	if ! $(call gpi-embed-pdf-fonts,$2,$2.embed.tmp.make); then \
		success=0; \
	else \
		$(call move-if-exists,$2.embed.tmp.make,$2); \
	fi; \
fi; \
$(if $(gpi_sed),$(call remove-temporary-files,$1.temp.make);,) \
$(call remove-temporary-files,$1head.make); \
[ "$$success" = "1" ] && $(sh_true) || $(sh_false);
endef

# Creation of .eps files from .png files
#
# The intermediate step of PNM (using NetPBM) produces much nicer output than
# ImageMagick's "convert" binary.  I couldn't get the right combination of
# flags to make it look nice, anyway.
#
# To handle gray scale conversion, we pipe things through ppmtopgm in the
# middle.
#
# $(call convert-png,<png file>,<eps file>)
define convert-png
$(PNGTOPNM) "$1" \
	$(if $3,| $(PPMTOPGM),) \
	| $(PNMTOPS) -noturn \
	> "$2"
endef

# Creation of .eps files from .jpg/.jpeg files
#
# Thanks to brubakee for this solution.
#
# Uses Postscript level 2 to avoid file size bloat
# $(call convert-jpg,<jpg file>,<eps file>)
define convert-jpg
$(CONVERT) $(if $3,-type Grayscale,) '$1' eps2:'$2'
endef

# Creation of .pdf files from .asy files
# $(call convert-asy,<asy file>)
convert-asy	= $(ASYMPTOTE) -V -f pdf $1

# Creation of .eps files from .fig files
# $(call convert-fig,<fig file>,<output file>,[gray])
convert-fig	= $(FIG2DEV) -L $(if $(filter %.pdf,$2),pdf,eps) $(if $3,-N,) $1 $2

# Creation of .pstex files from .fig files
# $(call convert-fig-pstex,<fig file>,<pstex file>)
convert-fig-pstex	= $(FIG2DEV) -L pstex $1 $2 > /dev/null 2>&1

# Creation of .pstex_t files from .fig files
# $(call convert-fig-pstex-t,<fig file>,<pstex file>,<pstex_t file>)
convert-fig-pstex-t	= $(FIG2DEV) -L pstex_t -p $3 $1 $2 > /dev/null 2>&1

# Creation of .dot_t files from .dot files
# #(call convert-dot-tex,<dot file>,<dot_t file>)
convert-dot-tex		= $(DOT2TEX) '$1' > '$2'

# Converts svg files into .eps files
#
# $(call convert-svg,<svg file>,<eps/pdf file>,[gray])
convert-svg	= $(INKSCAPE) --without-gui $(if $(filter %.pdf,$2),--export-pdf,--export-eps)='$2' '$1'

# Converts xvg files into .eps files
#
# $(call convert-xvg,<xvg file>,<eps file>,[gray])
convert-xvg	= $(XMGRACE) '$1' -printfile - -hardcopy -hdevice $(if $3,-mono,) EPS > '$2'

# Converts .eps.gz files into .eps files
#
# $(call convert-epsgz,<eps.gz file>,<eps file>,[gray])
convert-epsgz	= $(GUNZIP) -c '$1' $(if $3,| $(call kill-ps-color)) > '$2'

# Generates a .bb file from a .eps file (sometimes latex really wants this)
#
# $(call eps-bb,<eps file>,<eps.bb file>)
define eps-bb
$(SED) \
-e '/^%%Title:/p' \
-e '/^%%Creator:/p' \
-e '/^%%BoundingBox:/p' \
-e '/^%%CreationDate:/p' \
-e '/^%%EndComments/{' \
-e '  d' \
-e '  q' \
-e '}' \
-e 'd' \
$1 > "$2"
endef

# Converts .eps files into .eps files (usually a no-op, but can make grayscale)
#
# $(call convert-eps,<in file>,<out file>,[gray])
convert-eps	= $(if $3,$(call kill-ps-color) $1 > $2)

# The name of the file containing special postscript commands for grayscale
gray_eps_file	:= gray.eps.make

# Changes sethsbcolor and setrgbcolor calls in postscript to always produce
# grayscale.  In general, this is accomplished by writing new versions of those
# functions into the user dictionary space, which is looked up before the
# global or system dictionaries (userdict is one of the permanent dictionaries
# in postscript and is not read-only like systemdict).
#
# For setrgbcolor, the weighted average of the triple is computed and the
# triple is replaced with three copies of that average before the original
# procedure is called: .299R + .587G + .114B
#
# For sethsbcolor, the color is first converted to RGB, then to grayscale by
# the new setrgbcolor operator as described above.  Why is this done?
# Because simply using the value component will tend to make pure colors
# white, a very undesirable thing.  Pure blue should not translate to white,
# but to some level of gray.  Conversion to RGB does the right thing.  It's
# messy, but it works.
#
# From
# http://en.wikipedia.org/wiki/HSV_color_space#Transformation_from_HSV_to_RGB,
# HSB = HSV (Value = Brightness), and the formula used to convert to RGB is
# as follows:
#
# Hi = int(floor(6 * H)) mod 6
# f = 6 * H - Hi
# p = V(1-S)
# q = V(1-fS)
# t = V(1-(1-f)S)
# if Hi = 0: R G B <-- V t p
# if Hi = 1: R G B <-- q V p
# if Hi = 2: R G B <-- p V t
# if Hi = 3: R G B <-- p q V
# if Hi = 4: R G B <-- t p V
# if Hi = 5: R G B <-- V p q
#
# The messy stack-based implementation is below
# $(call create-gray-eps-file,filename)
define create-gray-eps-file
$(ECHO) -n -e '\
/OLDRGB /setrgbcolor load def\n\
/setrgbcolor {\n\
    .114 mul exch\n\
    .587 mul add exch\n\
    .299 mul add\n\
    dup dup\n\
    OLDRGB\n\
} bind def\n\
/OLDHSB /sethsbcolor load def\n\
/sethsbcolor {\n\
    2 index                     % H V S H\n\
    6 mul floor cvi 6 mod       % Hi V S H\n\
    3 index                     % H Hi V S H\n\
    6 mul                       % 6H Hi V S H\n\
    1 index                     % Hi 6H Hi V S H\n\
    sub                         % f Hi V S H\n\
    2 index 1                   % 1 V f Hi V S H\n\
    4 index                     % S 1 V f Hi V S H\n\
    sub mul                     % p f Hi V S H\n\
    3 index 1                   % 1 V p f Hi V S H\n\
    6 index                     % S 1 V p f Hi V S H\n\
    4 index                     % f S 1 V p f Hi V S H\n\
    mul sub mul                 % q p f Hi V S H\n\
    4 index 1 1                 % 1 1 V q p f Hi V S H\n\
    5 index                     % f 1 1 V q p f Hi V S H\n\
    sub                         % (1-f) 1 V q p f Hi V S H\n\
    8 index                     % S (1-f) 1 V q p f Hi V S H\n\
    mul sub mul                 % t q p f Hi V S H\n\
    4 -1 roll pop               % t q p Hi V S H\n\
    7 -2 roll pop pop           % t q p Hi V\n\
    5 -2 roll                   % Hi V t q p\n\
    dup 0 eq\n\
    {1 index 3 index 6 index}\n\
    {\n\
        dup 1 eq\n\
        {3 index 2 index 6 index}\n\
        {\n\
            dup 2 eq\n\
            {4 index 2 index 4 index}\n\
            {\n\
                dup 3 eq\n\
                {4 index 4 index 3 index}\n\
                {\n\
                    dup 4 eq\n\
                    {2 index 5 index 3 index}\n\
                    {\n\
                        dup 5 eq\n\
                        {1 index 5 index 5 index}\n\
                        {0 0 0}\n\
                        ifelse\n\
                    }\n\
                    ifelse\n\
                }\n\
                ifelse\n\
            }\n\
            ifelse\n\
        }\n\
        ifelse\n\
    }\n\
    ifelse                      % B G R Hi V t q p\n\
    setrgbcolor\n\
    5 {pop} repeat\n\
} bind def\n'\
> $1
endef

# This actually inserts the color-killing code into a postscript file
# $(call kill-ps-color)
define kill-ps-color
$(SED) -e '/%%EndComments/r $(gray_eps_file)'
endef

# Converts graphviz .dot files into .eps files
# Grayscale is not directly supported by dot, so we pipe it through fig2dev in
# that case.
# $(call convert-dot,<dot file>,<eps file>,<log file>,[gray])
define convert-dot
$(DOT) -Tps '$1' 2>'$3' $(if $4,| $(call kill-ps-color)) > $2; \
$(call colorize-dot-errors,$3)
endef

# Convert DVI to Postscript
# $(call make-ps,<dvi file>,<ps file>,<log file>,[<paper size>],[<beamer info>])
make-ps		= \
	$(DVIPS) -z -o '$2' $(if $(strip $4),-t$(strip $4),) '$1' \
		$(if $5,| $(enlarge_beamer)) > $3 2>&1

# Convert Postscript to PDF
# $(call make-pdf,<ps file>,<pdf file>,<log file>,<embed file>)
make-pdf	= \
	$(call ps2pdf,$1,$2,$(filter 1,$(shell $(CAT) '$4'))) > '$3' 2>&1

# Display information about what is being done
# $(call echo-build,<input file>,<output file>,[<run number>])
echo-build	= $(ECHO) "$(C_BUILD)= $1 --> $2$(if $3, ($3),) =$(C_RESET)"
echo-graphic	= $(ECHO) "$(C_GRAPHIC)= $1 --> $2 =$(C_RESET)"
echo-dep	= $(ECHO) "$(C_DEP)= $1 --> $2 =$(C_RESET)"

# Display a list of something
# $(call echo-list,<values>)
echo-list	= for x in $1; do $(ECHO) "$$x"; done

#
# DEFAULT TARGET
#

.PHONY: all
all: $(default_pdf_targets) ;

.PHONY: all-pdf
all-pdf: $(default_pdf_targets) ;

ifeq "$(strip $(BUILD_STRATEGY))" "latex"
.PHONY: all-ps
all-ps: $(default_ps_targets) ;

.PHONY: all-dvi
all-dvi: $(default_dvi_targets) ;
endif

#
# VIEWING TARGET
#
.PHONY: show
show: all
	$(QUIET)for x in $(default_pdf_targets); do \
		[ -e "$$x" ] && $(VIEW_PDF) $$x & \
	done

#
# INCLUDES
#
source_includes	:= $(addsuffix .d,$(source_stems_to_include))
graphic_includes := $(addsuffix .gpi.d,$(graphic_stems_to_include))

# Check the version of the makefile
ifneq "" "$(filter 3.79 3.80,$(MAKE_VERSION))"
$(warning $(C_WARNING)Your version of make is too old.  Please upgrade.$(C_RESET))
endif

# Include only the dependencies used
ifneq "" "$(source_includes)"
include $(source_includes)$(call include-message,$(source_includes))
endif
ifneq "" "$(graphic_includes)"
include $(graphic_includes)$(call include-message,$(graphic_includes))
endif

#
# MAIN TARGETS
#

# Note that we don't just say %: %.pdf here - this can tend to mess up our
# includes, which detect what kind of file we are asking for.  For example,
# asking to build foo.pdf is much different than asking to build foo when
# foo.gpi exists, because we look through all of the goals for *.pdf that
# matches *.gpi, then use that to determine which include files we need to
# build.
#
# Thus, we invoke make recursively with better arugments instead, restarting
# all of the appropriate machinery.
.PHONY: $(default_stems_ss)
$(default_stems_ss): %: %.pdf ;

# This builds and displays the wanted file.
.PHONY: $(addsuffix ._show,$(stems_ssg))
$(addsuffix ._show,$(stems_ssg)): %._show: %.pdf
	$(QUIET)$(VIEW_PDF) $< &

ifeq "$(strip $(BUILD_STRATEGY))" "latex"
.SECONDARY: $(all_pdf_targets)
%.pdf: %.ps %.embed.make
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call make-pdf,$<,$@.temp,$@.log,$*.embed.make); \
	if [ x"$$?" = x"0" ]; then \
	    $(if $(VERBOSE),$(CAT) $@.log,:); \
	    $(RM) -f '$@'; \
	    $(MV) '$@.temp' '$@'; \
	    $(TOUCH) '$@'; \
	    $(call copy-with-logging,$@,$(BINARY_TARGET_DIR)); \
	else \
	    $(CAT) $@.log; \
	    $(call remove-temporary-files,'$@.temp'); \
	    $(sh_false); \
	fi

.SECONDARY: $(all_ps_targets)
%.ps: %.dvi %.paper.make %.beamer.make
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call make-ps,$<,$@.temp,$@.log,\
			$(strip $(shell $(CAT) $*.paper.make)),\
			$(strip $(shell $(CAT) $*.beamer.make))); \
	if [ x"$$?" = x"0" ]; then \
	    $(if $(VERBOSE),$(CAT) $@.log,:); \
	    $(RM) -f '$@'; \
	    $(MV) '$@.temp' '$@'; \
	    $(TOUCH) '$@'; \
	    $(call copy-with-logging,$@,$(BINARY_TARGET_DIR)); \
	else \
	    $(CAT) $@.log; \
	    $(call remove-temporary-files,'$@.temp'); \
	    $(sh_false); \
	fi
endif

# Build the final target (dvi or pdf) file.  This is a very tricky rule because
# of the way that latex runs multiple times, needs graphics after the first run
# (or maybe already has them), and relies on bibliographies or indices that may
# not exist.
#
#	Check the log for fatal errors.  If they exist, colorize and bail.
#
#	Create the .auxtarget.cookie file.  (Needed for next time if not present)
#
#	If any of the following are true, we must rebuild at least one time:
#
#	* the .bbl was recently rebuilt
#
#		check a cookie, then delete it
#
#	* any of several output files was created or changed:
#
#		check $*.run.cookie, then delete it
#
#	* the .aux file changed in a way that necessitates attention
#
#		Note that if the .auxtarget.make file doesn't exist, this means
#		that we are doing a clean build, so it doesn't figure into the
#		test for running again.
#
#		compare against .auxtarget.make
#
#		move if different, remove if not
#
#	* the .log file has errors or warnings requiring at least one more run
#
#	We use a loop over a single item to simplify the process of breaking
#	out when we find one of the conditions to be true.
#
#	If we do NOT need to run latex here, then we move the $@.1st.make file
#	over to $@ because the target file has already been built by the first
#	dependency run and is valid.
#
#	If we do, we delete that cookie file and do the normal multiple-runs
#	routine.
#
ifeq "$(strip $(BUILD_STRATEGY))" "latex"
.SECONDARY: $(all_dvi_targets)
endif
%.$(build_target_extension): %.bbl %.aux %.$(build_target_extension).1st.make
	$(QUIET)\
	fatal=`$(call colorize-latex-errors,$*.log)`; \
	if [ x"$$fatal" != x"" ]; then \
		$(ECHO) "$$fatal"; \
		exit 1; \
	fi; \
	$(call make-auxtarget-file,$*.aux.make,$*.auxtarget.cookie); \
	run=0; \
	for i in 1; do \
		if $(call test-exists,$*.bbl.cookie); then \
			$(call set-run-reason,$*.bbl.cookie is present); \
			run=1; \
			break; \
		fi; \
		if $(call test-exists,$*.run.cookie); then \
			$(call set-run-reason,$*.run.cookie is present); \
			run=1; \
		    	break; \
		fi; \
		if $(call \
		test-exists-and-different,$*.auxtarget.cookie,$*.auxtarget.make);\
		then \
			$(call set-run-reason,$*.auxtarget.cookie differs from $*.auxtarget.make); \
			run=1; \
			break; \
		fi; \
		if $(call test-log-for-need-to-run,$*); then \
			$(call set-run-reason,$*.log indicated that this is necessary); \
			run=1; \
			break; \
		fi; \
		if $(call test-not-exists,$@.1st.make); then \
			$(call set-run-reason,$@.1st.make does not exist); \
			run=1; \
			break; \
		fi; \
	done; \
	$(call remove-temporary-files,$*.bbl.cookie $*.run.cookie); \
	$(MV) $*.auxtarget.cookie $*.auxtarget.make; \
	if [ x"$$run" = x"1" ]; then \
		$(call remove-files,$@.1st.make); \
		for i in 2 3 4 5; do \
			$(if $(findstring 3.79,$(MAKE_VERSION)),\
				$(call echo-build,$*.tex,$@,$(RESTARTS)-$$$$i),\
				$(call echo-build,$*.tex,$@,$(RESTARTS)-$$i)\
			); \
			$(call run-latex,$*); \
			$(CP) '$*.log' '$*.'$(RESTARTS)-$$i'.log'; \
			if $(call test-run-again,$*); then \
				$(call set-run-reason,rerun requested by $*.log); \
			else \
				break; \
			fi; \
		done; \
	else \
		$(MV) '$@.1st.make' '$@'; \
	fi; \
	$(call copy-with-logging,$@,$(BINARY_TARGET_DIR)); \
	$(call latex-color-log,$*)

# Build the .bbl file.  When dependencies are included, this will (or will
# not!) depend on something.bib, which we detect, acting accordingly.  The
# dependency creation also produces the %.auxbbl.make file.  BibTeX is a bit
# finicky about what you call the actual files, but we can rest assured that if
# a .auxbbl.make file exists, then the .aux file does, as well.  The
# .auxbbl.make file is a cookie indicating whether the .bbl needs to be
# rewritten.  It only changes if the .aux file changes in ways relevant to .bbl
# creation.
#
# Note that we do NOT touch the .bbl file if there is no need to
# create/recreate it.  We would like to leave existing files alone if they
# don't need to be changed, thus possibly avoiding a rebuild trigger.
ifeq "$(strip $(BIB_STRATEGY))" "bibtex"
%.bbl: %.auxbbl.make
	$(QUIET)\
	$(if $(filter %.bib,$^),\
		$(call echo-build,$(filter %.bib,$?) $*.aux,$@); \
		$(call set-run-reason,dependencies of $@ changed); \
		$(call run-bibtex,$*); \
		$(TOUCH) $@.cookie; \
	) \
	if $(EGREP) -q 'bibstyle.(apacite|apacann|chcagoa|[^}]*annot)' '$*.aux'; then \
		$(call echo-build,** annotated extra latex **,output ignored,$(RESTARTS)-1); \
		$(call run-latex,$*); \
		$(CP) '$*.log' '$*.$(RESTARTS)-annotated.log'; \
		$(if $(filter %.bib,$^),\
			$(call echo-build,** annotated extra bibtex ** $(filter %.bib,$?) $*.aux,$@); \
			$(call run-bibtex,$*); \
			$(TOUCH) $@.cookie; \
		) \
		$(call echo-build,** annotated extra latex **,output ignored,$(RESTARTS)-2); \
		$(call run-latex,$*); \
	fi
endif
ifeq "$(strip $(BIB_STRATEGY))" "biblatex"
%.bbl: %.bcf
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call run-bibtex,$<,$@,$*.bcf)
endif

# Create the index file - note that we do *not* depend on %.tex here, since
# that unnecessarily restricts the kinds of indices that we can build to those
# with exactly the same stem as the source file.  Things like splitidx create
# idx files with other names.
#
# Therefore, we add the .tex dependency in the sourcestem.d file in the call to
# get index file dependencies from the logs.
%.ind:	%.idx
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call run-makeindex,$<,$@,$*.ilg)

# Create a glossary file from a .ist file
%.gls:	%.glo %.tex %.ist
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call run-makeindex,$<,$@,$*.glg,$*.ist)

# Create a glossary file from a glossary input formatted for xindy
%.gls:	%.glo %.tex %.xdy
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call run-xindy,$<,$@,$*,$*.glg)

# Create the glossary file from a nomenclature file
%.gls:	%.glo %.tex $(call path-norm,$(shell $(KPSEWHICH) nomencl.ist || $(ECHO) nomencl.ist))
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call run-makeindex,$<,$@,$*.glg,nomencl.ist)

# Create the nomenclature file
%.nls:	%.nlo %.tex $(call path-norm,$(shell $(KPSEWHICH) nomencl.ist || $(ECHO) nomencl.ist))
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call run-makeindex,$<,$@,$*.nlg,nomencl.ist)

# Precompile the format file
%.fmt:	%.tex
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)\
	$(call run-latex,$*,-ini "&$(latex_build_program) $*.tex\dump"); \
	fatal=`$(call colorize-latex-errors,$*.log)`; \
	if [ x"$$fatal" != x"" ]; then \
		$(ECHO) "$$fatal"; \
		exit 1; \
	fi;

# SCRIPTED LaTeX TARGETS
#
# Keep the generated .tex files around for debugging if needed.
.SECONDARY: $(all_tex_targets)

%.tex::	%.tex.sh
	$(QUIET)$(call run-script,$(SHELL),$<,$@)

%.tex::	%.tex.py
	$(QUIET)$(call run-script,$(PYTHON),$<,$@)

%.tex::	%.tex.pl
	$(QUIET)$(call run-script,$(PERL),$<,$@)

%.tex::	%.rst $(RST_STYLE_FILE)
	$(QUIET)\
	$(call run-script,$(RST2LATEX)\
		--documentoptions=letterpaper\
		$(if $(RST_STYLE_FILE),--stylesheet=$(RST_STYLE_FILE),),$<,$@)

%.tex::	%.lhs
	$(QUIET)\
	function run_lhs2tex() { $(LHS2TEX) -o "$$2" "$$1"; }; \
	$(call run-script,run_lhs2tex,$<,$@)

#
# GRAPHICS TARGETS
#
.PHONY: all-graphics
all-graphics:	$(all_graphics_targets);

ifeq "$(strip $(BUILD_STRATEGY))" "latex"
.PHONY: all-pstex
all-pstex:	$(all_pstex_targets);
endif

.PHONY: all-dot2tex
all-dot2tex:	$(all_dot2tex_targets);

.PHONY: show-graphics
show-graphics: all-graphics
	$(VIEW_GRAPHICS) $(all_known_graphics)

$(gray_eps_file):
	$(QUIET)$(call echo-build,$^,$@)
	$(QUIET)$(call create-gray-eps-file,$@)

ifeq "$(strip $(BUILD_STRATEGY))" "pdflatex"
%.pdf: %.eps $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-eps-to-pdf,$<,$@,$(GRAY))

ifeq "$(strip $(GPI_OUTPUT_EXTENSION))" "pdf"
%.pdf:	%.gpi %.gpi.d $(gpi_sed) $(gpi_global)
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-gpi,$<,$@,$(GRAY))
endif

%.pdf:	%.fig
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-fig,$<,$@,$(GRAY))

%.pdf:	%.asy
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-asy,$<)

%.pdf:	%.svg
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-svg,$<,$@,$(GRAY))
endif

ifeq "$(strip $(BUILD_STRATEGY))" "xelatex"
%.pdf: %.eps $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-eps-to-pdf,$<,$@,$(GRAY))

ifeq "$(strip $(GPI_OUTPUT_EXTENSION))" "pdf"
%.pdf:	%.gpi %.gpi.d $(gpi_sed) $(gpi_global)
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-gpi,$<,$@,$(GRAY))
endif

%.pdf:	%.fig
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-fig,$<,$@,$(GRAY))

%.pdf:	%.asy
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-asy,$<)

%.pdf:	%.svg
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-svg,$<,$@,$(GRAY))
endif

ifeq "$(strip $(BUILD_STRATEGY))" "lualatex"
%.pdf: %.eps $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-eps-to-pdf,$<,$@,$(GRAY))

ifeq "$(strip $(GPI_OUTPUT_EXTENSION))" "pdf"
%.pdf:	%.gpi %.gpi.d $(gpi_sed) $(gpi_global)
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-gpi,$<,$@,$(GRAY))
endif

%.pdf:	%.fig
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-fig,$<,$@,$(GRAY))

%.pdf:	%.asy
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-asy,$<)

%.pdf:	%.svg
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-svg,$<,$@,$(GRAY))
endif


# TODO: capture mpost output and display errors
# TODO: figure out why pdf generation is erroring out (but working anyway)
%.eps %.mps %.mpx %.log: %.mp
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(MPOST) $*
	$(QUIET)$(call move-if-exists,$*.mps,$*.eps)
	$(QUIET)$(call move-if-exists,$*.log,$*.log.make)
	$(QUIET)$(call move-if-exists,$*.mpx,$*.mpx.make)

%.eps:	%.gpi %.gpi.d $(gpi_sed) $(gpi_global)
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-gpi,$<,$@,$(GRAY))

%.eps: %.fig
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-fig,$<,$@,$(GRAY))

%.eps: %.dot $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-dot,$<,$@,$<.log,$(GRAY))

%.eps: %.xvg $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-xvg,$<,$@,$(GRAY))

ifneq "$(default_graphic_extension)" "pdf"
# We have a perfectly good build rule for svg to pdf, so we eliminate this to
# avoid confusing make (it sometimes chooses to go svg -> eps -> pdf).
%.eps: %.svg $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-svg,$<,$@,$(GRAY))

# Similarly for these, we don't need eps if we have supported extensions
# already.
%.eps: %.jpg $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-jpg,$<,$@,$(GRAY))

%.eps: %.jpeg $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-jpg,$<,$@,$(GRAY))

%.eps: %.png $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-png,$<,$@,$(GRAY))
endif

%.eps.bb: %.eps
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call eps-bb,$<,$@)

%.eps: %.eps.gz $(if $(GRAY),$(gray_eps_file))
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-epsgz,$<,$@,$(GRAY))

%.pstex: %.fig
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-fig-pstex,$<,$@,$(GRAY))

%.pstex_t: %.fig %.pstex
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-fig-pstex-t,$<,$@,$*.pstex,$(GRAY))

%.dot_t: %.dot
	$(QUIET)$(call echo-graphic,$^,$@)
	$(QUIET)$(call convert-dot-tex,$<,$@)

#
# DEPENDENCY-RELATED TARGETS.
#

# Generate all of the information needed to get dependencies
# As a side effect, this creates a .dvi or .pdf file (depending on the build
# strategy).  We need to be sure to remove it if there are errors.  Errors can
# take several forms and all of them are found within the log file:
#	* There was a LaTeX error
#	* A needed file was not found
#	* Cross references need adjustment
#
# Behavior:
#	This rule is responsible for generating the following:
#	%.aux
#	%.d
#	%.aux.make
#	%.(pdf|dvi).1st.make (the .pdf or .dvi output file, moved)
#
#	Steps:
#
#	Run latex
#	Move .pdf or .dvi somewhere else (make no judgements about success)
#	Flatten the .aux file into another file
#	Add source dependencies
#	Add graphic dependencies
#	Add bib dependencies
#
#	Create cookies for various suffixes that may represent files that
#	need to be read by LaTeX in order for it to function properly.
#
#	Note that if some of the dependencies are discovered because they turn
#	up missing in the log file, we really need the .d file to be reloaded.
#	Adding a sleep command helps with this.  Otherwise make is extremely
#	nondeterministic, sometimes working, sometimes not.
#
#	Usually we can force this by simply removing the generated pdf file and
#	not creating a .1st.make file..
#
%.$(build_target_extension).1st.make %.d %.aux %.aux.make %.fls: %.tex
	$(QUIET)$(call echo-build,$<,$*.d $*.$(build_target_extension).1st.make,$(RESTARTS)-1)
	$(QUIET)\
	$(call set-run-reason,need to build .d and .$(build_target_extension).1st.make); \
	$(call run-latex,$*,-recorder) || $(sh_true); \
	$(CP) '$*.log' '$*.$(RESTARTS)-1.log'; \
	$(call die-on-import-sty,$*.log); \
	$(call die-on-dot2tex,$*.log); \
	$(call die-on-no-aux,$*); \
	$(call flatten-aux,$*.aux,$*.aux.make); \
	$(ECHO) "# vim: ft=make" > $*.d; \
	$(ECHO) ".PHONY: $*._graphics" >> $*.d; \
	$(call get-inputs,$*.fls,$(addprefix $*.,aux aux.make d $(build_target_extension))) >> $*.d; \
	$(call get-format,$<,$(addprefix $*.,fls aux aux.make d $(build_target_extension) $(build_target_extension).1st.make)) >> $*.d; \
	$(call get-missing-inputs,$*.log,$(addprefix $*.,aux aux.make d $(build_target_extension))) >> $*.d; \
	$(ECHO) ".SECONDEXPANSION:" >> $*.d; \
	$(call get-graphics,$*) >> $*.d; \
	$(call get-log-index,$*,$(addprefix $*.,aux aux.make)) >> $*.d; \
	$(call get-bibs,$*.aux.make,$(addprefix $*.,bbl aux aux.make)) >> $*.d; \
	$(EGREP) -q "# MISSING stem" $*.d && $(SLEEP) 1 && $(RM) $*.pdf; \
	$(EGREP) -q "# MISSING format" $*.d && $(RM) $*.pdf; \
	$(call move-if-exists,$*.$(build_target_extension),$*.$(build_target_extension).1st.make); \
	for s in toc out lot lof lol nav; do \
		if [ -e "$*.$$s" ]; then \
			if ! $(DIFF) -q $*.$$s $*.$$s.make >/dev/null 2>&1; then \
				$(TOUCH) $*.run.cookie; \
			fi; \
			$(CP) $*.$$s $*.$$s.make; \
		fi; \
	done

# This is a cookie that is updated if the flattened aux file has changed in a
# way that affects the bibliography generation.
.SECONDARY: $(addsuffix .auxbbl.make,$(stems_ssg))
%.auxbbl.make: %.aux.make
	$(QUIET)\
	$(call make-auxbbl-file,$<,$@.temp); \
	$(call replace-if-different-and-remove,$@.temp,$@)

# Build a dependency file for .gpi files.  These often plot data files that
# also reside in the directory, so if a data file changes, it's nice to know
# about it.  This also handles loaded .gpi files, whose filename should have
# _include_. in it.
%.gpi.d: %.gpi
	$(QUIET)$(call echo-build,$<,$@)
	$(QUIET)$(call make-gpi-d,$<,$@)

# Get source specials, e.g., paper size and special %% comments.
%.specials.make: %.tex
	$(QUIET)$(call get-source-specials,$<,$@)

# Get info about whether to enlarge beamer postscript files (for use with
# dvips, and requires a special comment in the source file).
.SECONDARY: $(addsuffix .specials.make,$(all_stems_ss))
%.beamer.make: %.specials.make
	$(QUIET)$(SED) -e 's/^BEAMER.*/BEAMER/p' -e 'd' '$<' > '$@'

# Store the paper size for this document -- note that if beamer is used we set
# it to the special BEAMER paper size.  We only do this, however, if the
# special comment exists, in which case we enlarge the output with psnup.
#
#	The paper size is extracted from a documentclass attribute.
%.paper.make: %.specials.make
	$(QUIET)$(SED) -e 's/^PAPERSIZE=//p' -e 'd' '$<' > '$@'

# Store embedding instructions for this document using a special comment
%.embed.make: %.specials.make
	$(QUIET)$(EGREP) '^NOEMBED$$' $< \
		&& $(ECHO) '' > $@ \
		|| $(ECHO) '1' > $@;

#
# HELPFUL PHONY TARGETS
#

.PHONY: _all_programs
_all_programs:
	$(QUIET)$(ECHO) "== All External Programs Used =="
	$(QUIET)$(call output-all-programs)

.PHONY: _check_programs
_check_programs:
	$(QUIET)$(ECHO) "== Checking Makefile Dependencies =="; $(ECHO)
	$(QUIET) \
	allprogs=`\
	 ($(call output-all-programs)) | \
	 $(SED) \
	 -e 's/^[[:space:]]*//' \
	 -e '/^#/d' \
	 -e 's/[[:space:]]*#.*//' \
	 -e '/^=/s/[[:space:]]/_/g' \
	 -e '/^[[:space:]]*$$/d' \
	 -e 's/^[^=].*=[[:space:]]*\([^[:space:]]\{1,\}\).*$$/\\1/' \
	 `; \
	spaces='                             '; \
	for p in $${allprogs}; do \
	case $$p in \
		=*) $(ECHO); $(ECHO) "$$p";; \
		*) \
			$(ECHO) -n "$$p:$$spaces" | $(SED) -e 's/^\(.\{0,20\}\).*$$/\1/'; \
			loc=`$(WHICH) $$p`; \
			if [ x"$$?" = x"0" ]; then \
				$(ECHO) "$(C_SUCCESS)Found:$(C_RESET) $$loc"; \
			else \
				$(ECHO) "$(C_FAILURE)Not Found$(C_RESET)"; \
			fi; \
			;; \
	esac; \
	done

.PHONY: _check_gpi_files
_check_gpi_files:
	$(QUIET)$(ECHO) "== Checking all .gpi files for common errors =="; \
	$(ECHO); \
	for f in $(files.gpi); do \
	result=`$(EGREP) '^([^#]*set terminal |set output )' $$f`; \
	$(ECHO) -n "$$f: "; \
	if [ x"$$result" = x"" ]; then \
		$(ECHO) "$(C_SUCCESS)Okay$(C_RESET)"; \
	else \
		$(ECHO) "$(C_FAILURE)Warning: Problematic commands:$(C_RESET)";\
		$(ECHO) "$(C_ERROR)$$result$(C_RESET)"; \
	fi; \
	done; \
	$(ECHO)

.PHONY: _all_stems
_all_stems:
	$(QUIET)$(ECHO) "== All Stems =="
	$(QUIET)$(call echo-list,$(sort $(default_stems_ss)))

.PHONY: _includes
_includes:
	$(QUIET)$(ECHO) "== Include Stems =="
	$(QUIET)$(ECHO) "=== Sources ==="
	$(QUIET)$(call echo-list,$(sort $(source_includes)))
	$(QUIET)$(ECHO) "=== Graphics ==="
	$(QUIET)$(call echo-list,$(sort $(graphic_includes)))

.PHONY: _all_sources
_all_sources:
	$(QUIET)$(ECHO) "== All Sources =="
	$(QUIET)$(call echo-list,$(sort $(all_files.tex)))

.PHONY: _dependency_graph
_dependency_graph:
	$(QUIET)$(ECHO) "/* LaTeX Dependency Graph */"
	$(QUIET)$(call output-dependency-graph)

.PHONY: _show_dependency_graph
_show_dependency_graph:
	$(QUIET)$(call output-dependency-graph,$(graph_stem).dot)
	$(QUIET)$(DOT) -Tps -o $(graph_stem).eps $(graph_stem).dot
	$(QUIET)$(VIEW_POSTSCRIPT) $(graph_stem).eps
	$(QUIET)$(call remove-temporary-files,$(graph_stem).*)

.PHONY: _sources
_sources:
	$(QUIET)$(ECHO) "== Sources =="
	$(QUIET)$(call echo-list,$(sort $(files.tex)))

.PHONY: _source_gens
_source_gens:
	$(QUIET)$(ECHO) "== Generated Sources =="
	$(QUIET)$(call echo-list,$(sort $(files_source_gen)))

.PHONY: _scripts
_scripts:
	$(QUIET)$(ECHO) "== Scripts =="
	$(QUIET)$(call echo-list,$(sort $(files_scripts)))

.PHONY: _graphic_outputs
_graphic_outputs:
	$(QUIET)$(ECHO) "== Graphic Outputs =="
	$(QUIET)$(call echo-list,$(sort $(all_graphics_targets)))

.PHONY: _env
_env:
ifdef .VARIABLES
	$(QUIET)$(ECHO) "== MAKE VARIABLES =="
	$(QUIET)$(call echo-list,$(foreach var,$(sort $(.VARIABLES)),'$(var)'))
endif
	$(QUIET)$(ECHO) "== ENVIRONMENT =="
	$(QUIET)$(ENV)

#
# CLEAN TARGETS
#
# clean-generated is somewhat unique - it relies on the .fls file being
# properly built so that it can determine which of the files was generated, and
# which was not.  Expect it to silently fail if the .fls file is missing.
#
# This is used to, e.g., clean up index files that are generated by the LaTeX.
.PHONY: clean-generated
clean-generated:
	$(QUIET)$(call clean-files,$(foreach e,$(addsuffix .fls,$(all_stems_source)),\
						$(shell $(call get-generated-names,$e))))

.PHONY: clean-deps
clean-deps:
	$(QUIET)$(call clean-files,$(all_d_targets) *.make *.make.temp *.cookie)

.PHONY: clean-tex
clean-tex: clean-deps
	$(QUIET)$(call clean-files,$(rm_tex))

.PHONY: clean-graphics
# TODO: This *always* deletes pstex files, even if they were not generated by
# anything....  In other words, if you create a pstex and pstex_t pair by hand
# an drop them in here without the generating fig file, they will be deleted
# and you won't get them back.  It's a hack put in here because I'm not sure we
# even want to keep pstex functionality, so my motivation is not terribly high
# for doing it right.
clean-graphics:
	$(QUIET)$(call clean-files,$(all_graphics_targets) *.gpi.d *.pstex *.pstex_t *.dot_t)

.PHONY: clean-backups
clean-backups:
	$(QUIET)$(call clean-files,$(backup_patterns) *.temp)

.PHONY: clean-auxiliary
clean-auxiliary:
	$(QUIET)$(call clean-files,$(graph_stem).*)

.PHONY: clean-nographics
clean-nographics: clean-tex clean-deps clean-backups clean-auxiliary ;

.PHONY: clean
clean: clean-generated clean-tex clean-graphics clean-deps clean-backups clean-auxiliary ;

#
# HELP TARGETS
#

.PHONY: help
help:
	$(help_text)

.PHONY: version
version:
	$(QUIET)\
	$(ECHO) "$(fileinfo) Version $(version)"; \
	$(ECHO) "by $(author)"; \

#
# HELP TEXT
#

define help_text
# $(fileinfo) Version $(version)
#
# by $(author)
#
# Generates a number of possible output files from a LaTeX document and its
# various dependencies.  Handles .bib files, \include and \input, and .eps
# graphics.  All dependencies are handled automatically by running LaTeX over
# the source.
#
# USAGE:
#
#    make [GRAY=1] [VERBOSE=1] [SHELL_DEBUG=1] <target(s)>
#
# STANDARD OPTIONS:
#    GRAY:
#        Setting this variable forces all recompiled graphics to be grayscale.
#        It is useful when creating a document for printing.  The default is
#        to allow colors.  Note that it only changes graphics that need to be
#        rebuilt!  It is usually a good idea to do a 'make clean' first.
#
#    VERBOSE:
#        This turns off all @ prefixes for commands invoked by make.  Thus,
#        you get to see all of the gory details of what is going on.
#
#    SHELL_DEBUG:
#        This enables the -x option for sh, meaning that everything it does is
#        echoed to stderr.  This is particularly useful for debugging
#        what is going on in $$(shell ...) invocations.  One of my favorite
#        debugging tricks is to do this:
#
#        make -d SHELL_DEBUG=1 VERBOSE=1 2>&1 | less
#
#    KEEP_TEMP:
#        When set, this allows .make and other temporary files to stick around
#        long enough to do some debugging.  This can be useful when trying to
#        figure out why gnuplot is not doing the right things, for example
#        (e.g., look for *head.make).
#
# STANDARD AUXILIARY FILES:
#
#      Variables.ini (formerly Makefile.ini, which still works)
#
#          This file can contain variable declarations that override various
#          aspects of the makefile.  For example, one might specify
#
#          neverclean := *.pdf *.ps
#          onlysources.tex := main.tex
#          LATEX_COLOR_WARNING := 'bold red uline'
#
#          And this would override the neverclean setting to ensure that pdf
#          and ps files always remain behind, set the makefile to treat all
#          .tex files that are not "main.tex" as includes (and therefore not
#          default targets).  It also changes the LaTeX warning output to be
#          red, bold, and underlined.
#
#          There are numerous variables in this file that can be overridden in
#          this way.  Search for '?=' to find them all.
#
#          The Variables.ini is imported before *anything else* is done, so go
#          wild with your ideas for changes to this makefile in there.  It
#          makes it easy to test them before submitting patches.
#
#          If you're adding rules or targets, however, see Targets.ini below.
#
#      Targets.ini
#
#          This is included much later in the makefile, after all variables and
#          targets are defined.  This is where you would put new make rules,
#          e.g.,
#
#          generated.tex: generating_script.weird_lang depA depB
#             ./generating_script.weird_lang > $$@
#
#          In this file, you have access to all of the variables that the
#          makefile creates, like $$(onlysources.tex).  While accessing those can
#          be somewhat brittle (they are implementation details and may change),
#          it is a great way to test your ideas when submitting feature requests.
#
# STANDARD ENVIRONMENT VARIABLES:
#
#      LATEX_COLOR_WARNING        '$(LATEX_COLOR_WARNING)'
#      LATEX_COLOR_ERROR          '$(LATEX_COLOR_ERROR)'
#      LATEX_COLOR_UNDERFULL      '$(LATEX_COLOR_UNDERFULL)'
#      LATEX_COLOR_OVERFULL       '$(LATEX_COLOR_OVERFULL)'
#      LATEX_COLOR_PAGES          '$(LATEX_COLOR_PAGES)'
#      LATEX_COLOR_BUILD          '$(LATEX_COLOR_BUILD)'
#      LATEX_COLOR_GRAPHIC        '$(LATEX_COLOR_GRAPHIC)'
#      LATEX_COLOR_DEP            '$(LATEX_COLOR_DEP)'
#      LATEX_COLOR_SUCCESS        '$(LATEX_COLOR_SUCCESS)'
#      LATEX_COLOR_FAILURE        '$(LATEX_COLOR_FAILURE)'
#
#   These may be redefined in your environment to be any of the following:
#
#      black
#      red
#      green
#      yellow
#      blue
#      magenta
#      cyan
#      white
#
#   Bold or underline may be used, as well, either alone or in combination
#   with colors:
#
#      bold
#      uline
#
#   Order is not important.  You may want, for example, to specify:
#
#   export LATEX_COLOR_SUCCESS='bold blue uline'
#
#   in your .bashrc file.  I don't know why, but you may want to.
#
# STANDARD TARGETS:
#
#    all:
#        Make all possible documents in this directory.  The documents are
#        determined by scanning for .tex and .tex.sh (described in more detail
#        later) and omitting any file that ends in ._include_.tex or
#        ._nobuild_.tex.  The output is a set of .pdf files.
#
#        If you wish to omit files without naming them with the special
#        underscore names, set the following near the top of the Makefile,
#        or (this is recommended) within a Makefile.ini in the same directory:
#
#         includes.tex := file1.tex file2.tex
#
#        This will cause the files listed to be considered as include files.
#
#        If you have only few source files, you can set
#
#         onlysources.tex := main.tex
#
#        This will cause only the source files listed to be considered in
#        dependency detection.  All other .tex files will be considered as
#        include files.  Note that these options work for *any* source type,
#        so you could do something similar with includes.gpi, for example.
#        Note that this works for *any valid source* target.  All of the
#        onlysources.* variables are commented out in the shipping version of
#        this file, so it does the right thing when they simply don't exist.
#        The comments are purely documentation.  If you know, for example, that
#        file.mycoolformat is supported by this Makefile, but don't see the
#        "onlysources.mycoolformat" declared in the comments, that doesn't mean
#        you can't use it.  Go ahead and set "onlysources.mycoolformat" and it
#        should do the right thing.
#
#    show:
#        Builds and displays all documents in this directory.  It uses the
#        environment-overridable value of VIEW_PDF (currently $(VIEW_PDF)) to
#        do its work.
#
#    all-graphics:
#        Make all of the graphics in this directory.
#
#    all-pstex (only for BUILD_STRATEGY=latex):
#        Build all fig files into pstex and pstex_t files.  Gray DOES NOT WORK.
#
#    all-gray-pstex (only for BUILD_STRATEGY=latex):
#          Build all fig files into grayscale pstex and pstex_t files.
#
#    all-dot2tex:
#          Build all dot files into tex files.
#
#    show-graphics:
#        Builds and displays all graphics in this directory.  Uses the
#        environment-overridable value of VIEW_GRAPHICS (currently
#        $(VIEW_GRAPHICS)) to do its work.
#
#    clean:
#        Remove ALL generated files, leaving only source intact.
#        This will *always* skip files mentioned in the "neverclean" variable,
#        either in this file or specified in Makefile.ini:
#
#         neverclean := *.pdf *.ps
#
#       The neverclean variable works on all "clean" targets below, as well.
#
#    clean-graphics:
#        Remove all generated graphics files.
#
#    clean-backups:
#        Remove all backup files: $(backup_patterns)
#        (XFig and other editors have a nasty habit of leaving them around)
#        Also removes Makefile-generated .temp files
#
#    clean-tex:
#        Remove all files generated from LaTeX invocations except dependency
#        information.  Leaves graphics alone.
#
#    clean-deps:
#        Removes all auto-generated dependency information.
#
#    clean-auxiliary:
#        Removes extra files created by various targets (like the dependency
#        graph output).
#
#    clean-nographics:
#        Cleans everything *except* the graphics files.
#
#    help:
#        This help text.
#
#    version:
#        Version information about this LaTeX makefile.
#
# DEBUG TARGETS:
#
#    _all_programs:
#        A list of the programs used by this makefile.
#
#    _check_programs:
#        Checks your system for the needed software and reports what it finds.
#
#    _check_gpi_files:
#        Checks the .gpi files in the current directory for common errors, such
#        as specification of the terminal or output file inside of the gpi file
#        itself.
#
#    _dependency_graph:
#        Outputs a .dot file to stdout that represents a graph of LaTeX
#        dependencies.  To see it, use the _show_dependency_graph target or
#        direct the output to a file, run dot on it, and view the output, e.g.:
#
#        make _dependency_graph > graph.dot
#        dot -T ps -o graph.eps graph.dot
#        gv graph.eps
#
#    _show_dependency_graph:
#        Makes viewing the graph simple: extracts, builds and displays the
#        dependency graph given in the _dependency_graph target using the value
#        of the environment-overridable VIEW_POSTSCRIPT variable (currently set
#        to $(VIEW_POSTSCRIPT)).  The postscript viewer is used because it
#        makes it easier to zoom in on the graph, a critical ability for
#        something so dense and mysterious.
#
#    _all_sources:
#        List all .tex files in this directory.
#
#    _sources:
#        Print out a list of all compilable sources in this directory.  This is
#        useful for determining what make thinks it will be using as the
#        primary source for 'make all'.
#
#    _scripts:
#        Print out a list of scripts that make knows can be used to generate
#        .tex files (described later).
#
#    _all_stems:
#        Print a list of stems.  These represent bare targets that can be
#        executed.  Listing <stem> as a bare target will produce <stem>.pdf.
#
#    _includes:
#        A list of .d files that would be included in this run if _includes
#        weren't specified.  This target may be used alone or in conjunction
#        with other targets.
#
#    _graphic_outputs:
#        A list of all generated .eps files
#
#    _env:
#        A list of environment variables and their values.  If supported by
#        your version of make, also a list of variables known to make.
#
# FILE TARGETS:
#
#    %, %.pdf:
#        Build a PDF file from the corresponding %.tex file.
#
#        If BUILD_STRATEGY=pdflatex, then this builds the pdf directly.
#        Otherwise, it uses this old-school but effective approach:
#
#            latex -> dvips -> ps2pdf
#
#        The BUILD_STRATEGY can be overridden in Makefile.ini in the same
#        directory.  The default is pdflatex.
#
#        Reasons for using latex -> dvips include the "psfrag" package, and the
#        generation of postscript instead of PDF.  Arguments for using pdflatex
#        include "new and shiny" and "better supported."  I can't argue with
#        either of those, and supporting them both didn't turn out to be that
#        difficult, so there you have it.  Choices.
#
#    %._show:
#        A phony target that builds the pdf file and then displays it using the
#        environment-overridable value of VIEW_PDF ($(VIEW_PDF)).
#
#    %._graphics:
#        A phony target that generates all graphics on which %.pdf (or %.dvi)
#        depends.
#
#    %.ps (only for BUILD_STRATEGY=latex):
#        Build a Postscript file from the corresponding %.tex file.
#        This is done using dvips.  Paper size is automatically
#        extracted from the declaration
#
#        \documentclass[<something>paper]
#
#        or it is the system default.
#
#        If using beamer (an excellent presentation class), the paper
#        size is ignored.  More on this later.
#
#    %.dvi (only for BUILD_STRATEGY=latex):
#        Build the DVI file from the corresponding %.tex file.
#
#    %.ind:
#        Build the index for this %.tex file.
#
#    %.gls:
#        Build the nomenclature glossary for this %.tex file.
#
#    %.nls:
#        Build the (newer) nomenclature file for this %.tex file.
#
#    %.eps:
#        Build an eps file from one of the following file types:
#
#       .dot    : graphviz
#       .gpi    : gnuplot
#       .fig    : xfig
#       .xvg    : xmgrace
#       .svg    : scalable vector graphics (goes through inkscape)
#       .png    : png (goes through NetPBM)
#       .jpg      : jpeg (goes through ImageMagick)
#       .eps.gz : gzipped eps
#
#       The behavior of this makefile with each type is described in
#       its own section below.
#
#    %.pstex{,_t} (only for BUILD_STRATEGY=latex):
#       Build a .pstex_t file from a .fig file.
#
# FEATURES:
#
#    Optional Binary Directory:
#        If you create the _out_ directory in the same place as the makefile,
#        it will automatically be used as a dumping ground for .pdf (or .dvi,
#        .ps, and .pdf) output files.
#
#        Alternatively, you can set the BINARY_TARGET_DIR variable, either as a
#        make argument or in Makefile.ini, to point to your directory of
#        choice.  Note that no pathname wildcard expansion is done in the
#        makefile, so make sure that the path is complete before going in
#        there.  E.g., if you want to specify something in your home directory,
#        use $$HOME/ instead of ~/ so that the shell expands it before it gets
#        to the makefile.
#
#    External Program Dependencies:
#        Every external program used by the makefile is represented by an
#        ALLCAPS variable at the top of this file.  This should allow you to
#        make judgments about whether your system supports the use of this
#        makefile.  The list is available in the ALL_PROGRAMS variable and,
#        provided that you are using GNU make 3.80 or later (or you haven't
#        renamed this file to something weird like "mylatexmakefile" and like
#        invoking it with make -f) can be viewed using
#
#        make _all_programs
#
#        Additionally, the availability of these programs can be checked
#        automatically for you by running
#
#        make _check_programs
#
#        The programs are categorized according to how important they are and
#        what function they perform to help you decide which ones you really
#        need.
#
#    Colorized Output:
#        The output of commands is colorized to highlight things that are often
#        important to developers.  This includes {underfull,overfull}
#        {h,v}boxes, general LaTeX Errors, each stage of document building, and
#        the number of pages in the final document.  The colors are obtained
#        using 'tput', so colorization should work pretty well on any terminal.
#
#        The colors can be customized very simply by setting any of the
#        LATEX_COLOR_<CONTEXT> variables in your environment (see above).
#
#    Predecessors to TeX Files:
#        Given a target <target>, if no <target>.tex file exists but a
#        corresponding script or predecessor file exists, then appropriate
#        action will be taken to generate the tex file.
#
#        Currently supported script or predecessor languages are:
#
#        sh:     %.tex.sh
#        perl:   %.tex.pl
#        python: %.tex.py
#
#           Calls the script using the appropriate interpreter, assuming that
#           its output is a .tex file.
#
#           The script is called thus:
#
#              <interpreter> <script file name> <target tex file>
#
#           and therefore sees exactly one parameter: the name of the .tex
#           file that it is to create.
#
#           Why does this feature exist?  I ran into this while working on
#           my paper dissertation.  I wrote a huge bash script that used a
#           lot of sed to bring together existing papers in LaTeX.  It
#           would have been nice had I had something like this to make my
#           life easier, since as it stands I have to run the script and
#           then build the document with make.  This feature provides hooks
#           for complicated stuff that you may want to do, but that I have
#           not considered.  It should work fine with included dependencies,
#           too.
#
#           Scripts are run every time make is invoked.  Some trickery is
#           employed to make sure that multiple restarts of make don't cause
#           them to be run again.
#
#        reST: %.rst
#
#           Runs the reST to LaTeX converter to generate a .tex file
#           If it finds a file names _rststyle_._include_.tex, uses it as
#           the "stylesheet" option to rst2latex.
#
#           Note that this does not track sub-dependencies in rst files.  It
#           assumes that the top-level rst file will change if you want a
#           rebuild.
#
#       literate Haskell: %.lhs
#
#           Runs the lhs2tex program to generate a .tex file.
#
#    Dependencies:
#
#        In general, dependencies are extracted directly from LaTeX output on
#        your document.  This includes
#
#        *    Bibliography information
#        *    \include or \input files (honoring \includeonly, too)
#        *    Graphics files inserted by the graphicx package
#
#        Where possible, all of these are built correctly and automatically.
#        In the case of graphics files, these are generated from the following
#        file types:
#
#        GraphViz:      .dot
#        GNUPlot:       .gpi
#        XFig:          .fig
#        XMgrace:       .xvg
#        SVG:           .svg
#        PNG:           .png
#        JPEG:          .jpg
#        GZipped EPS:   .eps.gz
#
#        If the file exists as a .eps already, it is merely used (and will not
#        be deleted by 'clean'!).
#
#        LaTeX and BibTeX are invoked correctly and the "Rerun to get
#        cross-references right" warning is heeded a reasonable number of
#        times.  In my experience this is enough for even the most troublesome
#        documents, but it can be easily changed (if LaTeX has to be run after
#        BibTeX more than three times, it is likely that something is moving
#        back and forth between pages, and no amount of LaTeXing will fix
#        that).
#
#        \includeonly is honored by this system, so files that are not
#        specified there will not trigger a rebuild when changed.
#
#    Beamer:
#        A special TeX source comment is recognized by this makefile (only when
#        BUILD_STRATEGY=latex, since this invokes psnup):
#
#        %%[[:space:]]*BEAMER[[:space:]]*LARGE
#
#        The presence of this comment forces the output of dvips through psnup
#        to enlarge beamer slides to take up an entire letter-sized page.  This
#        is particularly useful when printing transparencies or paper versions
#        of the slides.  For some reason landscape orientation doesn't appear
#        to work, though.
#
#        If you want to put multiple slides on a page, use this option and then
#        print using mpage, a2ps, or psnup to consolidate slides.  My personal
#        favorite is a2ps, but your mileage may vary.
#
#        When beamer is the document class, dvips does NOT receive a paper size
#        command line attribute, since beamer does special things with sizes.
#
#    GNUPlot Graphics:
#        When creating a .gpi file, DO NOT INCLUDE the "set terminal" or "set
#        output" commands!  The makefile will include terminal information for
#        you.  Besides being unnecessary and potentially harmful, including the
#        terminal definition in the .gpi file makes it harder for you, the one
#        writing the document, to preview your graphics, e.g., with
#
#           gnuplot -persist myfile.gpi
#
#        so don't do specify a terminal or an output file in your .gpi files.
#
#        When building a gpi file into an eps file, there are several features
#        available to the document designer:
#
#        Global Header:
#            The makefile searches for the files in the variable GNUPLOT_GLOBAL
#            in order:
#
#            ($(GNUPLOT_GLOBAL))
#
#            Only the first found is used.  All .gpi files in the directory are
#            treated as though the contents of GNUPLOT_GLOBAL were directly
#            included at the top of the file.
#
#            NOTE: This includes special comments! (see below)
#
#        Font Size:
#            A special comment in a .gpi file (or a globally included file) of
#            the form
#
#            ## FONTSIZE=<number>
#
#            will change the font size of the GPI output.  If font size is
#            specified in both the global file and the GPI file, the
#            specification in the individual GPI file is used.
#
#        Grayscale Output:
#            GNUplot files also support a special comment to force them to be
#            output in grayscale *no matter what*:
#
#            ## GRAY
#
#            This is not generally advisable, since you can always create a
#            grayscale document using the forms mentioned above.  But, if your
#            plot simply must be grayscale even in a document that allows
#            colors, this is how you do it.
#
#    XFig Graphics:
#            No special handling is done with XFig, except when a global
#            grayscale method is used, e.g.
#
#                make GRAY=1 document
#
#            In these cases the .eps files is created using the -N switch to
#            fig2dev to turn off color output.  (Only works with eps, not pstex
#            output)
#
#    GraphVis Graphics:
#            Color settings are simply ignored here.  The 'dot' program is used
#            to transform a .dot file into a .eps file.
#
#            If you want, you can use the dot2tex program to convert dot files
#            to tex graphics.  The default is to just call dot2tex with no
#            arguments, but you can change the DOT2TEX definition to include
#            options as needed (in your Makefile.ini).
#
#            Note that, as with pstex, the makefile cannot use latex's own
#            output to discover all missing dot_t (output) files, since anytime
#            TeX includes TeX, it has to bail when it can't find the include
#            file.  It can therefore only stop on the first missing file it
#            discovers, and we can't get a large list of them out easily.
#
#            So, the makefile errors out if it's missing an included dot_t
#            file, then prompts the user to run this command manually:
#
#                make all-dot2tex
#
#    GZipped EPS Graphics:
#
#        A .eps.gz file is sometimes a nice thing to have.  EPS files can get
#        very large, especially when created from bitmaps (don't do this if you
#        don't have to).  This makefile will unzip them (not in place) to
#        create the appropriate EPS file.
#
#
endef

#
# DEPENDENCY CHART:
#
# digraph "g" {
#     rankdir=TB
#     size="9,9"
#     edge [fontsize=12 weight=10]
#     node [shape=box fontsize=14 style=rounded]
#
#     eps [
#         shape=Mrecord
#         label="{{<gpi> GNUplot|<epsgz> GZip|<dot> Dot|<fig> XFig}|<eps> eps}"
#         ]
#     pstex [label="%.pstex"]
#     pstex_t [label="%.pstex_t"]
#     tex_outputs [shape=point]
#     extra_tex_files [shape=point]
#     gpi_data [label="<data>"]
#     gpi_includes [label="_include_.gpi"]
#     aux [label="%.aux"]
#     fls [label="%.fls"]
#     idx [label="%.idx"]
#     glo [label="%.glo"]
#     ind [label="%.ind"]
#     log [label="%.log"]
#     tex_sh [label="%.tex.sh"]
#     rst [label="%.rst"]
#     tex [
#         shape=record
#         label="<tex> %.tex|<include> _include_.tex"
#         ]
#     include_aux [label="_include_.aux"]
#     file_bib [label=".bib"]
#     bbl [label="%.bbl"]
#     dvi [label="%.dvi"]
#     ps [label="%.ps"]
#     pdf [label="%.pdf"]
#     fig [label=".fig"]
#     dot [label=".dot"]
#     gpi [label=".gpi"]
#     eps_gz [label=".eps.gz"]
#
#     gpi_files [shape=point]
#
#     rst -> tex:tex [label="reST"]
#     tex_sh -> tex:tex [label="sh"]
#     tex_pl -> tex:tex [label="perl"]
#     tex_py -> tex:tex [label="python"]
#     tex -> tex_outputs [label="latex"]
#     tex_outputs -> dvi
#     tex_outputs -> aux
#     tex_outputs -> log
#     tex_outputs -> fls
#     tex_outputs -> idx
#     tex_outputs -> include_aux
#     aux -> bbl [label="bibtex"]
#     file_bib -> bbl [label="bibtex"]
#     idx -> ind [label="makeindex"]
#     glo -> gls [label="makeindex"]
#     nlo -> nls [label="makeindex"]
#     gls -> extra_tex_files
#     nls -> extra_tex_files
#     ind -> extra_tex_files
#     bbl -> extra_tex_files
#     eps -> extra_tex_files
#     extra_tex_files -> dvi [label="latex"]
#     gpi_files -> eps:gpi [label="gnuplot"]
#     gpi -> gpi_files
#     gpi_data -> gpi_files
#     gpi_includes -> gpi_files
#     eps_gz -> eps:epsgz [label="gunzip"]
#     fig -> eps:fig [label="fig2dev"]
#     fig -> pstex [label="fig2dev"]
#     fig -> pstex_t [label="fig2dev"]
#     pstex -> pstex_t [label="fig2dev"]
#     dot -> eps:dot [label="dot"]
#     dvi -> ps [label="dvips"]
#     include_aux -> bbl [label="bibtex"]
#     ps -> pdf [label="ps2pdf"]
#
#     edge [ color=blue label="" style=dotted weight=1 fontcolor=blue]
#     fls -> tex:include [label="INPUT: *.tex"]
#     fls -> file_bib [label="INPUT: *.aux"]
#     aux -> file_bib [label="\\bibdata{...}"]
#     include_aux -> file_bib [label="\\bibdata{...}"]
#     log -> gpi [label="Graphic file"]
#     log -> fig [label="Graphic file"]
#     log -> eps_gz [label="Graphic file"]
#     log -> dot [label="Graphic file"]
#     log -> idx [label="No file *.ind"]
#     log -> glo [label="No file *.gls"]
#     log -> nlo [label="No file *.nls"]
#     gpi -> gpi_data [label="plot '...'"]
#     gpi -> gpi_includes [label="load '...'"]
#     tex:tex -> ps [label="paper"]
#     tex:tex -> pdf [label="embedding"]
# }
#

#
# DEPENDENCY CHART SCRIPT
#
# $(call output_dependency_graph,[<output file>])
define output-dependency-graph
	if [ -f '$(this_file)' ]; then \
	$(SED) \
		-e '/^[[:space:]]*#[[:space:]]*DEPENDENCY CHART:/,/^$$/!d' \
		-e '/DEPENDENCY CHART/d' \
		-e '/^$$/d' \
		-e 's/^[[:space:]]*#//' \
		$(this_file) $(if $1,> '$1',); \
	else \
		$(ECHO) "Cannot determine the name of this makefile."; \
	fi
endef
#
.PHONY: Targets.ini $(HOME)/.latex-makefile/Targets.ini
-include Targets.ini
-include $(HOME)/.latex-makefile/Targets.ini
#
# vim: noet sts=0 sw=8 ts=8

.PHONY: hooks
hooks:
	./hooks/install.sh

