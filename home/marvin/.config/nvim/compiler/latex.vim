" Vim compiler file

if exists("current_compiler")
  finish
endif
let current_compiler = "latex"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif
if empty($LATEX_MAIN)
  CompilerSet makeprg=make $*
else
  CompilerSet makeprg=latexmk\ \\-pdf\ $LATEX_MAIN\ $*
endif
