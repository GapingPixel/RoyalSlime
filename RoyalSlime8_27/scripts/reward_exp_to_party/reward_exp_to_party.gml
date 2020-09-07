/// @function reward_exp_to_party(reward_exp_amount)
/// @description Gives the party [input] amount of experience points
/// @param {real} reward_exp_amount The amount of EXP we're giving the party
function reward_exp_to_party() {

	var _reward_amt = argument[0];

	var _party_size = array_length_1d(BattleController.player_party);

	for (var _i = 0; _i < _party_size; _i++) {
		var _curr_party_slot = BattleController.player_party[_i];
		var _this_party_slime = BattleController.player_box[| _curr_party_slot];
	
	
		reward_exp(_this_party_slime, _reward_amt);
	}




}
