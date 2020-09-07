/// @description Draw the enemies
/*
for (var _i = 0; _i < _inst; _i++;) {
	_this_inst = instance_find(ParentEnemy, _i);
		
	with (_this_inst) {
		
		if (spr_index == spr_death && image_index >= spr_death_frame_count-1) {
			// Draw the shadow under the essence
			var _c = make_color_rgb(102, 127, 153);
			draw_line_color(x +1-3- _bkg_draw_offset_x, y - 6+1, x - _bkg_draw_offset_x + 4-4, y -6+1, _c, _c);
			draw_line_color(x -3- _bkg_draw_offset_x, y - 5+1, x - _bkg_draw_offset_x + 4-4+1, y -5+1, _c, _c);
			draw_line_color(x +1-3- _bkg_draw_offset_x, y - 4+1, x - _bkg_draw_offset_x + 4-4, y -4+1, _c, _c);
		}
		draw_sprite_ext(spr_index, image_index, x - _bkg_draw_offset_x + img_xoff, y + img_yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
}
*/

draw_sprite_ext(spr_index, image_index, x - BattleController.bkg_draw_offset_x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff + z_pos, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
