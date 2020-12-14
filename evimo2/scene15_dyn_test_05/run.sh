#!/bin/bash

# pick a camera:
CAMERA=right_camera
# CAMERA=left_camera
# CAMERA=samsung_mono
# CAMERA=flea3_7

# skip this many seconds from the beginning of the sequence:
OFFSET=0.0

# stop after this many seconds have been processed (-1 for infinite):
SEQ_LEN=-1

# either '-2' for continuous visualization, or 'some integer number' to display multiple frames at a time
DISPLAY_MODE=-2 
#DISPLAY_MODE=10

# generate at this fps (for event-based only, do not specify more than vicon framerate)
FPS=40

roslaunch evimo event_imo_offline.launch folder:=$(pwd) \
                                         camera_name:=$CAMERA \
                                         fps:=$FPS \
                                         show:=$DISPLAY_MODE \
                                         t_offset:=$OFFSET \
                                         t_len:=$SEQ_LEN
