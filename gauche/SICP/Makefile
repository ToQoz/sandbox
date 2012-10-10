# code from https://github.com/VoQn/Gauche-Color/blob/master/Makefile
test-dir   = test
test-temp  = ${test-dir}/temp
bootstrap  = ${test-dir}/bootstrap.scm
record     = ${test-temp}/test.record
log        = ${test-temp}/test.log

test = @gosh -I. -l ${bootstrap} ${test-dir}

check:
	@echo "Cleaning log file ..."
	@rm -rf ${test-temp}
	@mkdir ${test-temp}
	@echo "----------------------------------"
	${test}/sec1/sec1-1-5-test.scm >> ${log}
	${test}/sec1/sec1-2-2-test.scm >> ${log}
	@echo "----------------------------------"
	@cat ${record}
