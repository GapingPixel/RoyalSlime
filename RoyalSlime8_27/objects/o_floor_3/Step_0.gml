/// @description Insert description here
// You can write your code in this editor
event_inherited();

if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
	sprite_index = s_floor_3_selected;
	
	o_floor_2.y_ = 16+25;
	o_floor_3.y_ = 16+50;
	o_floor_4.y_ = 16+100;
	o_floor_5.y_ = 16+125;
	o_floor_6.y_ = 16+150;
	o_floor_7.y_ = 16+175;
	o_floor_8.y_ = 16+200;
	o_floor_9.y_ = 16+225;
	
	o_floor_1.sprite_index = s_floor_1;
	o_floor_2.sprite_index = s_floor_2;
	
	o_floor_4.sprite_index = s_floor_4;
	o_floor_5.sprite_index = s_floor_5;
	o_floor_6.sprite_index = s_floor_6;
	o_floor_7.sprite_index = s_floor_7;
	o_floor_8.sprite_index = s_floor_8;
	o_floor_9.sprite_index = s_floor_9;
	global.selected_floor = 3;

}

if !instance_exists(o_scroll) then exit;
y = y_ + ((global.areaHeight/100 * o_scroll.percentage) - global.areaHeight);