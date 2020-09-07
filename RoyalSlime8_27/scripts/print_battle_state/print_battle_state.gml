/// @function print_battle_state(trek_state)
/// @description Debug script to tell us (as a string) which state the Trek States FSM is currently set to
/// @param {real} trek_state The trek state enum input value
function print_battle_state() {


	var _state = argument[0];

	switch (_state) {
		case TREK_STATES.START:
			return "Start";
		case TREK_STATES.MOVING:
			return "Moving";
		case TREK_STATES.BATTLE_INIT:
			return "Init Battle";
		case TREK_STATES.BATTLING:
			return "Battling";
		case TREK_STATES.EVENT:
			return "Event";
		default:
			return "Unknown";
	}


}
