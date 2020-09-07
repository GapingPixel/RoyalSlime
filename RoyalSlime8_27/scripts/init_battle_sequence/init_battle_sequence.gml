/// @function init_battle_sequence()
/// @description This script resets the battlefield whenever the players stop at a battle hotspot
function init_battle_sequence() {

	// Forget about everyone who was involved in the last battle. Reset any potential lingering properties they might have, too
	ds_list_clear(fighter_list);


	// Look at all of the players in our party
	var _num_players = array_length_1d(player_party);
	for (var _i = 0; _i < _num_players; _i++) {
	
		var _this_player = player_box[| player_party[_i]]; // Grab this player party member from the global box of players
		fighter_list[| _i] = _this_player;					// Add the player we just found to the fighter list
	
		// Reset any potential lingering properties that this player might have.
		with (_this_player) {
			/*
			if (action_gauge_curr >= action_gauge_max) {
				action_gauge_curr = floor(action_gauge_max * 0.99); // Set the action bar to 99% for everyone besides this player
			}
			*/
			melee_attacked = false;
			end_battle_early_flag = true; // Allow the player to end the battle early again
			started_turn = false;
		}
	}

	// Add the newly-spawned enemies to the fighter list, too. Reset their properties here in case anything happened when they spawned versus when the battle begins
	var _num_enemies = instance_number(ParentEnemy);
	var _num_active_enemies = 0;
	for (var _j = 0; _j < _num_enemies; _j++) {
		var _this_enemy = instance_find(ParentEnemy, _j);
		_this_enemy.started_turn = false;
		_this_enemy.melee_attacked = false;
		if (_this_enemy.curr_hp > 0) {
			fighter_list[| _i + _num_active_enemies] = _this_enemy;
			_num_active_enemies++;
		}
	}

	total_fighters = _num_players + _num_active_enemies;

	with (ParentPlayer)
		init_battle = true;

	current_turn_taker = noone;
	abort_battle = false;
	state = TREK_STATES.BATTLING;


}
