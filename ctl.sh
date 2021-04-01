#i!/bin/bash
export PATH=/usr/local/erlang/bin:${PATH} #开机启动需要设置 erl 命令目录到环境变量


DIR_ROOT="$(dirname $(readlink -f $0))/"
export HOME=${DIR_ROOT} #开机启动需要设置 HOME 环境变量

SCREEN_NAME='erlproxy'


fun_start()
{
	cd ${DIR_ROOT}
	fileStart="${DIR_ROOT}start.sh"
    cmdStart="erl -pa deps/*/ebin ebin -config app +K true -s make_proxy start_server"

    cat > ${fileStart} <<EOF
#!/bin/bash
${cmdStart}
EOF
	chmod +x ${fileStart}
	screen -dmSL ${SCREEN_NAME} -t erlproxy.log -s ${fileStart}
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
