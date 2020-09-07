/// @description Camera logic
hsp = 0;
vsp = 0;

// Only update Village Mode movement if there are no HUD popup windows open
if (HUD.state == HUDStates.NEUTRAL) {
	hsp = Game.move_x * move_speed;
	vsp = Game.move_y * move_speed;
}

if (x + hsp <= 0) {
	hsp = 0;
	x = 0;
} else if (x + hsp + Game.win_width >= room_width) {
	hsp = 0;
	x = room_width - Game.win_width;
}
if (y + vsp <= 0) {
	vsp = 0;
	y = 0;
} else if (y + vsp + Game.win_height >= room_height) {
	vsp = 0;
	y = room_height - Game.win_height;
}

x += hsp;
y += vsp;

// Get view size
var _view_w = camera_get_view_width(cam);
var _view_h = camera_get_view_height(cam);

// Get view pos
var _view_x = camera_get_view_x(cam);
var _view_y = camera_get_view_y(cam);

// zoom
if (HUD.state == HUDStates.NEUTRAL) zoom = clamp(zoom + (mouse_wheel_down() - mouse_wheel_up()) * 0.1, zoom_max, zoom_min);

var _view_w = lerp(_view_w, iw * zoom, 0.2);
var _view_h = lerp(_view_h, ih * zoom, 0.2);

camera_set_view_size(cam, _view_w, _view_h);
surface_resize(application_surface, iw, ih);

// Set view pos
//   camera_set_view_pos(cam, x-(iw/2), y-(ih/2));
var _mox = WorldController.map_draw_offset_x;
var _moy = WorldController.map_draw_offset_y;

camera_set_view_pos(cam, target.x, target.y);

// clamp view to room
camera_set_view_pos(cam, clamp(camera_get_view_x(cam), 0, room_width - _view_w), clamp(camera_get_view_y(cam), 0, room_height - _view_h));

if (keyboard_check_pressed(ord("Q"))) {
	if (camera_mode == CamModes.REGULAR) camera_mode = CamModes.WIDE;
	else if (camera_mode == CamModes.WIDE) camera_mode = CamModes.REGULAR;
}

//camera_set_view_pos(view_camera[0], x, y);
//camera_set_view_pos(cam, x-(iw/2),y-(ih/2));
