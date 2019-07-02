" Vim compiler file

if exists("current_compiler")
  finish
endif
let current_compiler = "maven"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mvn\ -B\ $*

CompilerSet errorformat=%E[ERROR]\ %f:[%l\\,%c]\ %m,%Z
CompilerSet errorformat+=\[%tARNING]\ %f:[%l\\,%c]\ %m,%Z
