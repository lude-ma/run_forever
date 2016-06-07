#!/bin/bash

roslaunch baxter_data_acquisition exp_goal.launch \
	gazebo:=true rec_joint:=true rec_camera:=true rec_depth:=true \
  number:=100
