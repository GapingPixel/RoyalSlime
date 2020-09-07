/// @function lunge_at_target(target_fighter, fighter_is_enemy)
/// @description Called from the attacking fighter, this script causes the attacker to jump toward the target fighter
/// @param {real} target_fighter The object id of the fighter being attacked
/// @param {boolean} fighter_is_enemy false = Player, true = Enemy
function lunge_at_target() {

	// Determine if the provided attacker is a player or enemy 
	var _target_fighter = argument[0];
	var _opposing_player_party = argument[1];

	// The target fighter doesn't exist; Abort this script
	if (!instance_exists(_target_fighter) || _target_fighter == noone)
	    exit;

	var _obj_index = _target_fighter.object_index;

	if (_opposing_player_party)
	{
	    // First, make the attacking fighter jump
	    zsp = -jump_speed;
    
	    // Lunge toward the target fighter we're attacking
	    var _target_player = _target_fighter.fighter_slot;
    
	    var _lvl_pos = BattleController.level_hotspots[((BattleController.hotspots_travelled - 1) * 3)];
    
	    x_off_to = _lvl_pos + BattleController.player_battle_position_x[_target_player] + attacking_distance_x;
	    y_off_to = BattleController.player_battle_position_y[_target_player];
		BattleController.attack_cam_offset_x_to = attack_cam_offset_x_max;
	}
	else
	{
	    // First, make the attacking fighter jump
	    zsp = -jump_speed;
    
	    // Lunge toward the target fighter we're attacking
	    var _target_enemy = _target_fighter.fighter_slot;
    
	    var _lvl_pos = BattleController.level_hotspots[((BattleController.hotspots_travelled - 1) * 3)];
    
	    x_off_to = BattleController.enemy_battle_position_x[_target_enemy] - attacking_distance_x;
	    y_off_to = BattleController.enemy_battle_position_y[_target_enemy];
	
		BattleController.attack_cam_offset_x_to = -attack_cam_offset_x_max;
	}



}
