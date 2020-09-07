/// @description Initialize variables
move_speed = 3;
hsp = 0;
vsp = 0;

enum CamModes {
	REGULAR,
	WIDE,
	MAX
};

camera_mode = CamModes.REGULAR;

target = self;

zoom = 1;
zoom_max = 1;
zoom_min = 2;

shake = 0;
iw = Game.win_width / zoom;//display_get_width()/zoom;
ih = Game.win_height / zoom;//display_get_height()/zoom;

/*iw = 1280
ih = 720*/
surface_resize(application_surface, iw, ih);
display_set_gui_size(iw, ih);

window_set_size(iw, ih);
//window_set_rectangle(display_get_width()/2,display_get_height()/2,iw, ih);

cam = camera_create();

camera_set_view_size(cam, iw, ih);
camera_set_view_pos(cam, x-(iw/2), y-(ih/2));

view_enabled = true;
view_visible[0] = true;

view_set_camera(0, cam);