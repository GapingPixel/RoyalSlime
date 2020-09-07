/// @description Draw self
//draw_sprite_ext(spr_index, image_index, x - BattleController.bkg_draw_offset_x + img_xoff, y + img_yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (effect_type == BATTLE_EFFECTS.TEXT) {
	// Show any text on the battle field
	
	/*
	draw_text_man(x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff, text);
	draw_rectangle(x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff,
				x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff,
				false);
	*/
	//show_debug_message(x)
	draw_set_font(font);
	draw_set_halign(fa_left);
	
	var _alpha = 1;
	if (time_max > time_alive)
		_alpha = clamp(time_alive / time_max, 0, 1);
	var _c = font_color;
	draw_text_man_color(img_xoff + BattleController.attack_cam_offset_x, y + img_yoff, text, _c, _c, _c, _c, _alpha);
	draw_set_color(c_white);
	if (text_y_speed != 0) {
		img_yoff += text_y_speed;
	}
} else {
	draw_sprite_ext(sprite_index, image_index, x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
// - BattleController.bkg_draw_offset_x

//var _c = c_black;
//draw_rectangle_color(Camera.x,Camera.y,Camera.x +Game.win_width,Camera.y+Game.win_height,_c,_c,_c,_c,false);