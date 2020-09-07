/// @description Insert description here
// You can write your code in this editor
if Game.state == GameStates.INIT {
	instance_destroy();
}

//window_mouse_set(clamp(window_mouse_get_x(), 0, window_get_width()), clamp(window_mouse_get_y(), 0, window_get_height()));

switch global.fullscreen {
	
	case false:
	/*window_mouse_set(window_view_mouse_get_x(0),window_view_mouse_get_y(0));
	x = window_mouse_get_x();
	y = window_mouse_get_y();*/
	
	x = mouse_x;
	y = mouse_y;
	
	break;
	
	case true:
	x = mouse_x;
	y = mouse_y;
	
	break;

	
}



