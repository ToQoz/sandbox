cproc: cproc.c
	gcc -o cproc cproc.c
check: cproc
	./cproc &
	sleep 1
	pgrep cproc | xargs pstree
