/// @description Draw the players

/*
var _p_party = BattleController.player_party;
var _p_box = BattleController.player_box;

var _inst = array_length_1d(_p_party); //instance_number(ParentPlayer);
for (var _i = 0; _i < _inst; _i++;) {
	var _this_inst = _p_box[| _p_party[_i]];//instance_find(ParentPlayer, _i);
		
		
	with (_this_inst)
		draw_sprite_ext(spr_index, image_index, x + img_xoff, y + img_yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
*/

draw_sprite_ext(spr_index, image_index, x + img_xoff + BattleController.attack_cam_offset_x, y + img_yoff + z_pos, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
