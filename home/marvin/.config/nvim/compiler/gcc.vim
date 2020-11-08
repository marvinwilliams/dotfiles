" Vim compiler file

if exists("current_compiler")
  finish
endif
let current_compiler = "gcc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif
if empty($BUILD_DIR)
  CompilerSet makeprg=make\ -C\ build\ $*
else
  CompilerSet makeprg=make\ -C\ $BUILD_DIR\ $*
endif
