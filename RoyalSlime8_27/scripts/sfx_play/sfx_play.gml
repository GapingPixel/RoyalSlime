/// @function sfx_play(sfx_id, priority, loops)
/// @description This is an alternate SFX script that will ensure that this SFX only plays once at a time.
function sfx_play() {
	// This script is also here in case anything needs to be done to the SFX globally.

	var _sfx = argument[0];
	var _priority, _loops;

	if (argument_count > 1) {
		_priority = argument[1];
		_loops = argument[2];
	} else {
		_priority = 0;
		_loops = false;
	}

	audio_stop_sound(_sfx);
	audio_play_sound(_sfx, _priority, _loops);


}
