/// @description Insert description here
// You can write your code in this editor
if audio_group_is_loaded(Music) {
	audio_group_set_gain(Music,global.musicVolume,0);
	
}


if audio_group_is_loaded(SFX) {
	audio_group_set_gain(SFX,global.sfxVolume,0);
}