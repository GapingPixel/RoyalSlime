/// @description Only draw this sprite when the time is right
if (buffer_time <= 0)
	draw_sprite_ext(sprite_index, image_index, x  - BattleController.bkg_draw_offset_x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff + z_pos, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
