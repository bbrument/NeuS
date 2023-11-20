#!/bin/bash
SCENES="drums ficus"

PYTHON_PATH="/home/lilian/anaconda3/envs/neus/bin"

for SCENE in $SCENES;
do

        eval "$PYTHON_PATH/python exp_runner.py \
            --mode train \
            --conf confs/wmask_nerfsyn.conf \
            --case $SCENE"

done

for SCENE in $SCENES;
do

        eval "$PYTHON_PATH/python exp_runner.py \
            --mode train \
            --conf confs/womask_nerfsyn.conf \
            --case $SCENE"

done

for SCENE in $SCENES;
do

        eval "$PYTHON_PATH/python exp_runner.py \
            --mode validate_mesh \
            --conf confs/wmask_nerfsyn.conf \
            --case $SCENE \
            --is_continue"

        eval "$PYTHON_PATH/python exp_runner.py \
            --mode validate_mesh \
            --conf confs/womask_nerfsyn.conf \
            --case $SCENE \
            --is_continue"

done

