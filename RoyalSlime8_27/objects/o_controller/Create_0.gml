/// @description Insert description here
// You can write your code in this editor

hover_sprite = noone;

var areaHeight = 0;

var maxWidth = 0;
var maxHeight = 9;
var xx = 128;
var yy = 16;

for (var i = 0; i < maxHeight; i++)
{
	/*/for (var j = 0; j < maxHeight; j++)
	{
		instance_create_layer(xx, yy, "Instances", o_floor);
		
		if (j == maxHeight - 1)
		{
			yy += 150;
		}
		else {
			yy += 225;
		}
	}*/
	
	
	
	switch i {
		case 0:
		instance_create_depth(xx, yy, depth, o_floor_1);
		break;
		case 1:
		instance_create_depth(xx, yy, depth, o_floor_2);
		break;
		case 2:
		instance_create_depth(xx, yy, depth, o_floor_3);
		break;
		case 3:
		instance_create_depth(xx, yy, depth, o_floor_4);
		break;
		case 4:
		instance_create_depth(xx, yy, depth, o_floor_5);
		break;
		case 5:
		instance_create_depth(xx, yy, depth, o_floor_6);
		break;
		case 6:
		instance_create_depth(xx, yy, depth, o_floor_7);
		break;
		case 7:
		instance_create_depth(xx, yy, depth, o_floor_8);
		break;
		case 8:
		instance_create_depth(xx, yy, depth, o_floor_9);
		break;
	}
	if i==0 {
		yy += 50;
	} else {
		yy += 25;
	}
	areaHeight = yy;
	/*switch i {
		case 0:
		_fl.sprite_index = s_floor_1;
		break;
		case 1:
		_fl.sprite_index = s_floor_2;
		break;
		case 2:
		_fl.sprite_index = s_floor_3;
		break;
		case 3:
		_fl.sprite_index = s_floor_4;
		break;
		case 4:
		_fl.sprite_index = s_floor_5;
		break;
	}*/
	
	
	//xx += 150;
}

global.areaHeight = areaHeight// - 170;