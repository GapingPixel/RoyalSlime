/// @description Insert description here
/*
var _mrx = device_mouse_x_to_gui(0);
var _mry = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
	var _origin_id = id;
	var _this_clicked_draggable_slime = noone;//collision_point(_mrx, _mry, self, false, false);
	var _any_clicked_draggable_slime = noone;

	with (ParentDraggableSlime) {
		var _inst = instance_place(_mrx, _mry, ParentDraggableSlime);//collision_point(_mrx, _mry, ParentDraggableSlime, false, false);//
		if (_inst != noone) {
			if (_inst == _origin_id)
				_this_clicked_draggable_slime = _origin_id;
			else
				_any_clicked_draggable_slime = _inst;
		}
	}
	
	if(_this_clicked_draggable_slime != noone || _any_clicked_draggable_slime != noone)
		show_debug_message("Any: " + string(_any_clicked_draggable_slime) +", "+"This: " +string(_this_clicked_draggable_slime))
	//if (_this_clicked_draggable_slime != noone) {
	//	if (HUD.slime_window_state == SLIME_WINDOW_STATES.PARTY_VIEWER) {
	//		if (!_this_clicked_draggable_slime.dragging) {
	//			if (HUD.dragging_slime) {
	//				if (HUD.dragging_slime_id != noone) {
	//					var _dragged_slime = HUD.dragging_slime_id;
	//					_dragged_slime.dragging = false;
	//					HUD.dragging_slime_id = noone;
	//				}
	//			}
	//			dragging = !dragging;
	//			HUD.dragging_slime_id = id;
	//			HUD.dragging_slime = true;
	//		} else if (_any_clicked_draggable_slime != noone) {
	//			if (_any_clicked_draggable_slime.dragging) {
	//				dragging = false;
	//				HUD.dragging_slime_id = _any_clicked_draggable_slime.id;
	//				HUD.dragging_slime = true;
	//			}
	//		} else {
	//			dragging = false;
	//			HUD.dragging_slime_id = noone;
	//		}
	//		HUD.selected_party_slime_slot = my_slime_id;
	//	}
	//}
} else if (keyboard_check_pressed(vk_escape)) {
	// We clicked while dragging a slime already. Reset everything.
	dragging = false;
	HUD.dragging_slime_id = noone;
}