#!/bin/sh

source /users/outil/soc/env_soclib.sh
soclib-cc -p tp3_top.desc -o simulator.x
cd soft && make && cd ..
