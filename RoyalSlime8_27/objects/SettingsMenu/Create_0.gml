/// @description Insert description here
// You can write your code in this editor

//instance_create_depth(x,y,depth,Fullscreen_tickbox);

var _tickbox_x = 184;
instance_create_depth(_tickbox_x,30,depth-1,Fullscreen_tickbox);

var _leftarrow_x = 177;
var _rightarrow_x = 196;
instance_create_depth(_leftarrow_x,50,depth-1,Scale_Arrow_left);
	
instance_create_depth(_rightarrow_x,50,depth-1,Scale_Arrow_right);

instance_create_depth(_tickbox_x,64,depth-1,Vsync_tickbox);


var _leftarrow_x = 170;
var _rightarrow_x = 202;
	
instance_create_depth(_leftarrow_x,86,depth-1,MasterSound_Arrow_left);
	
instance_create_depth(_rightarrow_x,86,depth-1,MasterSound_Arrow_right);
	
instance_create_depth(_leftarrow_x,106,depth-1,MusicSound_Arrow_left);
	
instance_create_depth(_rightarrow_x,106,depth-1,MusicSound_Arrow_right);
	
instance_create_depth(_leftarrow_x,126,depth-1,SFXSound_Arrow_left);
	
instance_create_depth(_rightarrow_x,126,depth-1,SFXSound_Arrow_right);
	