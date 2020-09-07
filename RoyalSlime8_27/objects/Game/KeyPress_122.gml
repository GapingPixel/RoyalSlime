/// @description Insert description here
// You can write your code in this editor
global.fullscreen = !global.fullscreen;
if instance_exists(Fullscreen_tickbox) {
	Fullscreen_tickbox.image_index = global.fullscreen;
}
window_set_fullscreen(global.fullscreen);