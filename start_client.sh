#!/bin/bash

werl -pa deps/*/ebin ebin +K true -config app -s make_proxy start_client
#erl -pa deps/*/ebin ebin +K true -config app -s make_proxy start_client -detached
