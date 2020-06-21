#!/bin/bash

werl -pa deps/*/ebin ebin +K true -config app -s make_proxy start_server
#erl -pa deps/*/ebin ebin +K true -config app -s make_proxy start_server -detached
