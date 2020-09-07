/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(s_effect_darken,0,0,0,1,1,0,image_blend,.7);
draw_self();


switch Game.win_size {
	case 4:
	draw_sprite(s_window_scale_value,0,x+12,y-22);
	break;
	
	case 8:
	draw_sprite(s_window_scale_value,1,x+12,y-22);
	break;
}

//draw_sprite(s_window_volume,global.volume*10,x+6,y-1);
draw_sprite(s_window_volume,global.masterVolume*5,x+9,y-18);
draw_sprite(s_window_volume,global.musicVolume*5,x+9,y+2);
draw_sprite(s_window_volume,global.sfxVolume*5,x+9,y+22);