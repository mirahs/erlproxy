#!/bin/bash
SCREEN_NAME='make_proxy'


fun_start()
{
	fileStart="./start.sh"
    cmdStart="erl -pa deps/*/ebin ebin -config app +K true -s make_proxy start_server"

    cat > ${fileStart} <<EOF
#!/bin/bash
${cmdStart}
EOF
	chmod +x ${fileStart}
	screen -dmSL ${SCREEN_NAME} -t make_proxy.log -s ${fileStart}
	sleep 3
	rm -f ${fileStart}
}

fun_shell()
{
	screen -r ${SCREEN_NAME}
}


fun_help()
{
    echo "./$0 start    启动服务器"
    echo "./$0 shell    连接服务器终端"
    exit 1
}



if [ $# -eq 0 ]
then
	fun_help
else
	fun_$1 $*
fi
exit 0
