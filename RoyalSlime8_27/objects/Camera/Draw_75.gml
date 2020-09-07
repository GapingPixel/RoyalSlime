/// @description Draw the initial overlay
if (Game.debug) {

	with(BattleController) {

		var _tv = BattleController.hotspots_travelled;
		var _hs = BattleController.level_hotspots;
		var _hotspots_count = array_length_1d(_hs) / 3;
		var _str = "";
		for (var _i = (_tv - 1) * 3; _i < _hotspots_count; _i++) {
			if (_i < 0) break;
			_str += "\nHspt."
			_str += string(_hs[_i * 3]);
			_str += ": "
			_str += print_hotspot_type(_hs[(_i * 3) + 1]);
			_str += ", "
			_str += string(_hs[(_i * 3) + 2]);
		}

		draw_set_color(c_red);
		draw_set_font(global.font);
		draw_set_halign(fa_left);

		var _str_in = "B. State: " + "\nProgress: " + string(slime_dungeon_progression) + "/" + string(level_length) + _str;
		//draw_text_man(4, 8, _str_in);
		draw_set_color(c_white);
		draw_set_font(global.damage_font);
	}

} else {
	//draw_sprite(Mockup_Example, 0, 0, 0);
	/*
	for (var i=0; i<4; i++)
		draw_sprite(Icon_Build, 0, 298, 37 + (i*26));
		*/
}

// Draw the mouse itself
//var _mrx = (mouse_x - camera_get_view_x(cam));
//var _mry = (mouse_y - camera_get_view_y(cam));
//draw_sprite(sprMouseCursor, 0, _mrx / zoom, _mry / zoom);
