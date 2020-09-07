/// @function set_monster_stats(id, object)
/// @description Set the stats/image indices/other properties of a given monster
/// @param {real} monster_id The unique instance ID value of the instance to check.
/// @param {real} target_object ((OPTIONAL ARGUMENT)) The object index to be checked against. Reward this fighter a different amount of EXP depending on if it's a Player or Enemy
function set_monster_stats() {

	var _mon_id = argument[0];
	var _obj = self;

	if (argument_count > 1)
		_obj = argument[1];

	var _is_enemy = false;
	if (_obj.object_index == ParentEnemy) {
		_is_enemy = true;
	}

	with (_obj) {
		spr_idle = BattleController.mon_sprite_idle[_mon_id];
		spr_atk = BattleController.mon_sprite_attack[_mon_id];
		spr_death = BattleController.mon_sprite_death[_mon_id];
		spr_hurt = BattleController.mon_sprite_hurt[_mon_id];
		spr_death_frame_count = sprite_get_number(spr_death);
		spr_hurt_frame_count = sprite_get_number(spr_hurt);

		anim_speed_idle = BattleController.mon_anim_speed_idle[_mon_id];
		anim_speed_hurt = BattleController.mon_anim_speed_hurt[_mon_id];
		anim_speed_attacking = BattleController.mon_anim_speed_attacking[_mon_id];
	
		// All monster shadows are set to medium by default unless otherwise specified
		shadow_size = BattleController.mon_shadow_size[_mon_id];
	
		stat_base[MON_STATS.STR] = BattleController.mon_stat_base_str[_mon_id];
		stat_base[MON_STATS.DEF] = BattleController.mon_stat_base_def[_mon_id];
		stat_base[MON_STATS.MAG] = BattleController.mon_stat_base_mag[_mon_id];
		stat_base[MON_STATS.MDEF] = BattleController.mon_stat_base_mdef[_mon_id];
		stat_base[MON_STATS.HP] = BattleController.mon_stat_base_hp[_mon_id];
		stat_base[MON_STATS.AGI] = BattleController.mon_stat_base_agi[_mon_id];
		stat_base[MON_STATS.EVA] = BattleController.mon_stat_base_eva[_mon_id];
		stat_base[MON_STATS.DEX] = BattleController.mon_stat_base_dex[_mon_id];
	
		stat_class_bonus[MON_STATS.STR] = 0;
		stat_class_bonus[MON_STATS.DEF] = 0;
		stat_class_bonus[MON_STATS.MAG] = 0;
		stat_class_bonus[MON_STATS.MDEF] = 0;
		stat_class_bonus[MON_STATS.HP] = 0;
		stat_class_bonus[MON_STATS.AGI] = 0;
		stat_class_bonus[MON_STATS.EVA] = 0;
		stat_class_bonus[MON_STATS.DEX] = 0;
	
		stat_rarity_bonus[MON_STATS.STR] = 0;
		stat_rarity_bonus[MON_STATS.DEF] = 0;
		stat_rarity_bonus[MON_STATS.MAG] = 0;
		stat_rarity_bonus[MON_STATS.MDEF] = 0;
		stat_rarity_bonus[MON_STATS.HP] = 0;
		stat_rarity_bonus[MON_STATS.AGI] = 0;
		stat_rarity_bonus[MON_STATS.EVA] = 0;
		stat_rarity_bonus[MON_STATS.DEX] = 0;
	
		max_hp = stat_base[MON_STATS.HP] + stat_class_bonus[MON_STATS.HP] + stat_rarity_bonus[MON_STATS.HP];
		curr_hp = max_hp;
		curr_exp = 0;

		stat_class = BattleController.mon_class[_mon_id];
		stat_level = BattleController.mon_level[_mon_id];
	
		//evolution_chain = BattleController.evolution_chain[_mon_id];
		//evolution_position = BattleController.evolution_position[_mon_id];

		rarity_type = MON_RARITIES.COMMON;
	

		// How much exp to reward the player party members upon death (if this is an enemy)
		if (_is_enemy)
			reward_exp_amount = stat_level * 20;
		else
			exp_requirement = stat_level * 100;

		if (object_index == ParentEnemy) {
			passives_list = BattleController.mon_passives_list[_mon_id]; // Define this monster's moveset
		}
	
		melee_hurt_frame = BattleController.mon_melee_hurt_frame[_mon_id];
		melee_hurt_effect_sprite = BattleController.mon_melee_hurt_effect_sprite[_mon_id];
		melee_hurt_effect_ani_speed = BattleController.mon_melee_hurt_effect_ani_speed[_mon_id];
		melee_hurt_effect_height = BattleController.mon_melee_hurt_effect_height[_mon_id];

		max_hp = stat_base[MON_STATS.HP] + stat_class_bonus[MON_STATS.HP] + stat_rarity_bonus[MON_STATS.HP];
		curr_hp = stat_base[MON_STATS.HP] + stat_class_bonus[MON_STATS.HP] + stat_rarity_bonus[MON_STATS.HP];
	
		multi_hit = BattleController.mon_multi_hit[_mon_id];
	
		action_gauge_curr = 0;
		action_gauge_max = 10000;
		monster_id = _mon_id;
		spr_index = spr_idle;
		mask_index = spr_index;
		image_speed = anim_speed_idle;
	}


}
