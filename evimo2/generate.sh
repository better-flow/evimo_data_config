#!/bin/bash

PYDVS_DIR=~/pydvs


echo "Folder: $1"

declare -a CameraArray=("flea3_7" "samsung_mono" "left_camera" "right_camera")
for cam in ${CameraArray[@]}; do
    echo $cam
    roslaunch evimo event_imo_offline.launch show:=-1 folder:=$1 camera_name:=$cam \
                                             generate:=true \
                                             save_3d:=false \
                                             fps:=40 \
                                            t_offset:=0 \
                                             t_len:=-1

    python3 $PYDVS_DIR/samples/evimo-gen.py --base_dir $1/$cam/ground_truth

    VIS_FOLDER=$1/$cam/ground_truth/vis
    VIDEO_DST=$1/${cam}.mp4
    ffmpeg -r 40 -i $VIS_FOLDER/frame_%10d.png -c:v libx264 -vf \
        "pad=ceil(iw/2)*2:ceil(ih/2)*2" -pix_fmt yuv420p \
        $VIDEO_DST
done
