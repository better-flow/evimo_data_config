#!/bin/bash

DATA_ROOT=/home/ncos/ooo/EVIMO2/evimo_data_config/evimo2/

#./generate.sh $DATA_ROOT/checkerboard_flat_lr
#./generate.sh $DATA_ROOT/simple_depth_var_lr
#./generate.sh $DATA_ROOT/simple_ego_0
#./generate.sh $DATA_ROOT/simple_ego_1
#./generate.sh $DATA_ROOT/sliding_00
#./generate.sh $DATA_ROOT/sliding_01
#./generate.sh $DATA_ROOT/sliding_03
#./generate.sh $DATA_ROOT/sliding_2_00
#./generate.sh $DATA_ROOT/tabletop_flat_rot_z
#./generate.sh $DATA_ROOT/sliding_car_00
#./generate.sh $DATA_ROOT/static_objects_00
#./generate.sh $DATA_ROOT/static_objects_01
#./generate.sh $DATA_ROOT/static_objects_02
#./generate.sh $DATA_ROOT/static_objects_03
#./generate.sh $DATA_ROOT/falling_objects_00
#./generate.sh $DATA_ROOT/dynamic_00

folders=(
checkerboard/checkerboard_d_flat_fb
checkerboard/checkerboard_flat_lr
simple_depth_var_lr
tabletop_flat_rot_z
dynamic_00
falling_objects_00
falling_objects_01
scene_03_00
scene_03_01
scene_03_02
scene_03_03
scene_03_04
scene_04_00
scene_04_01
scene_04_02
scene_04_03
scene_04_04
scene_05_00
scene_05_01
scene_05_02
scene_05_03
scene_05_04
scene10_dyn_train_00
scene10_dyn_train_01
scene10_dyn_train_02
scene10_dyn_train_03
scene10_dyn_train_04
scene11_dyn_train_00
scene11_dyn_train_01
scene11_dyn_train_02
scene11_dyn_train_03
scene11_dyn_train_04
scene12_dyn_test_00
scene12_dyn_test_01
scene13_dyn_test_00
scene13_dyn_test_01
scene13_dyn_test_02
scene13_dyn_test_03
scene13_dyn_test_04
scene13_dyn_test_05
scene14_dyn_test_00
scene14_dyn_test_01
scene14_dyn_test_02
scene14_dyn_test_03
scene14_dyn_test_04
scene14_dyn_test_05
scene16_d_dyn_test_00
scene16_d_dyn_test_01
scene16_d_dyn_test_02
scene16_d_dyn_test_03
scene16_d_dyn_test_04
scene17_d_00
scene17_d_01
scene17_d_02
scene17_d_03
scene17_d_04
scene6_dyn_train_00
scene6_dyn_train_01
scene6_dyn_train_02
scene6_dyn_train_03
scene7_00
scene7_01
scene7_02
scene7_03
scene7_04
scene8_01
scene8_02
scene8_03
scene8_04
scene9_dyn_train_00
scene9_dyn_train_01
scene9_dyn_train_02
scene9_dyn_train_03
scene9_dyn_train_04
scene9_dyn_train_05
scene9_dyn_train_06
seq_1_0
seq_1_1
seq_1_2
seq_1_3
seq_1_4
seq_1_5
seq_2_1
seq_2_2
seq_2_3
seq_2_4
seq_2_5
simple_ego_0
simple_ego_1
sliding_00
sliding_01
sliding_02
sliding_03
sliding_04
sliding_2_00
sliding_2_01
sliding_2_02
sliding_2_03
sliding_2_04
sliding_2_05
sliding_2_06
sliding_2_07
sliding_2_08
sliding_car_00
sliding_car_01
sliding_car_02
static_objects_00
static_objects_01
static_objects_02
static_objects_03
static_objects_dark_00
static_objects_dark_01
static_objects_dark_02
)


for folder in "${folders[@]}"
do
    dataset_folder=$DATA_ROOT/$folder
    echo $dataset_folder

    bash ./generate.sh $dataset_folder
done
