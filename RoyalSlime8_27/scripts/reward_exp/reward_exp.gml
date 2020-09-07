/// @function reward_exp(reward_exp_amount)
/// @description Rewards an individual fighter [input] experience points. Check for and handle any levelups too, including their rarity bonuses
/// @param {real} reward_exp_amount The amount of EXP we're giving this fighter
function reward_exp() {

	var _this_slime = argument[0];
	var _reward_amt = argument[1];
	
	with (_this_slime) {
		curr_exp += _reward_amt;
	
		// Perform a levelup if we hit our goal; Set a new goal
		if (curr_exp >= exp_requirement) {
			show_debug_message("LEVELUP: " + string(_this_slime));
		
		
			// Apply bonus stats (from the calculations from base levelups)
			var _my_class = _this_slime.stat_class;
			var _clbon_table = BattleController.class_bonuses_table;
		
			for (var _i = 0; _i < MON_STATS.MAX; _i++) {
				_this_slime.stat_class_bonus[_i] += _clbon_table[# _my_class, _i];
			}
		
			// Apply bonus stats (from the Rarity system)
			var _my_rarity = _this_slime.rarity_type;
			var _rarbon_table = BattleController.rarity_bonuses_table;
			for (var _i = 0; _i < MON_STATS.MAX; _i++) {
				_this_slime.stat_rarity_bonus[_i] += _rarbon_table[# _my_rarity, _i];
			}
		
			// Set a new level up requirement goal
			exp_requirement = stat_level * 100;
		}
	
		//show_debug_message(string(_this_slime) + ": " + string(curr_exp));
	}


}
