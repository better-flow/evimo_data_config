#!/bin/bash

DATA_ROOT=/home/ncos/evimo_data_config/evimo2


./generate.sh $DATA_ROOT/checkerboard_flat_lr
./generate.sh $DATA_ROOT/simple_depth_var_lr
./generate.sh $DATA_ROOT/simple_ego_0
./generate.sh $DATA_ROOT/simple_ego_1
./generate.sh $DATA_ROOT/sliding_00
./generate.sh $DATA_ROOT/sliding_01
./generate.sh $DATA_ROOT/sliding_03
./generate.sh $DATA_ROOT/sliding_2_00
./generate.sh $DATA_ROOT/tabletop_flat_rot_z
./generate.sh $DATA_ROOT/sliding_car_00
./generate.sh $DATA_ROOT/static_objects_00
./generate.sh $DATA_ROOT/static_objects_01
./generate.sh $DATA_ROOT/static_objects_02
./generate.sh $DATA_ROOT/static_objects_03
./generate.sh $DATA_ROOT/falling_objects_00
./generate.sh $DATA_ROOT/dynamic_00
