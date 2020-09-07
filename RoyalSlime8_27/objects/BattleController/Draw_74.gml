
//var _vx = 73;//camera_get_view_x(view_camera[0]);
//var _vy = 0;//camera_get_view_y(view_camera[0]);
var _vx = 32;//camera_get_view_x(view_camera[0]);
var _vy = 12;//camera_get_view_y(view_camera[0]);

if (surface_exists(surf) && Camera.camera_mode == CamModes.REGULAR) 
	//draw_surface_part(surf, 0, 0, 256, 155, _vx, _vy);
	draw_surface_part(surf, 0, 0, 640, 360, 0, 0);
