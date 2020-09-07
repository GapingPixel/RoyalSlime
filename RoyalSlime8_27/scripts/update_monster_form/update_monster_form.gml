/// @function update_monster_form(monster_enum_form_id)
/// @description This is where all the monster data gets defined. Task is broken up into smaller scripts, too
/// @param {real} monster_enum_form_id The [enum MONSTERS] ID of the monster we're transforming into (e.g. MONSTERS.SNAILESS).
function update_monster_form() {
	// Please remember that the second half of the MONSTERS enum are for the enemy monsters, and the first half's for player monsters

	var _form_id = argument[0];

	// Temporary enum to easier-read which sprite animation we're handling
	var enum SPR_INDICES {
		IDLE,
		ATTACK,
		DEATH,
		HURT,
		MAX
	};

	// Before we replace any of the asssets, figure out which animation is currently playing and remember it for later in this script
	var _new_spr_index = SPR_INDICES.IDLE;

	switch(spr_index) {
		case spr_idle:
			_new_spr_index = SPR_INDICES.IDLE;
		case spr_atk:
			_new_spr_index = SPR_INDICES.ATTACK;
		case spr_death:
			_new_spr_index = SPR_INDICES.DEATH;
		case spr_hurt:
			_new_spr_index = SPR_INDICES.HURT;
	}

	spr_idle = BattleController.mon_sprite_idle[_form_id];
	spr_atk = BattleController.mon_sprite_attack[_form_id];
	spr_death = BattleController.mon_sprite_death[_form_id];
	spr_hurt = BattleController.mon_sprite_hurt[_form_id];
	spr_victory = BattleController.mon_sprite_victory[_form_id];
	
	stat_base[MON_STATS.STR] = BattleController.mon_stat_base_str[_form_id];
	stat_base[MON_STATS.DEF] = BattleController.mon_stat_base_def[_form_id];
	stat_base[MON_STATS.MAG] = BattleController.mon_stat_base_mag[_form_id];
	stat_base[MON_STATS.MDEF] = BattleController.mon_stat_base_mdef[_form_id];
	stat_base_mp = BattleController.mon_stat_base_hp[_form_id];
	stat_base[MON_STATS.AGI] = BattleController.mon_stat_base_agi[_form_id];
	stat_base[MON_STATS.EVA] = BattleController.mon_stat_base_eva[_form_id];
	stat_base[MON_STATS.DEX] = BattleController.mon_stat_base_dex[_form_id];

	stat_class = BattleController.mon_class[_form_id];
	stat_type = BattleController.mon_type[_form_id];

	stat_level = BattleController.mon_level[_form_id];

	monster_form = _form_id;

	multi_hit = BattleController.mon_multi_hit[_form_id];
	melee_hurt_frame = BattleController.mon_melee_hurt_frame[_form_id];
	melee_hurt_effect_sprite = BattleController.mon_melee_hurt_effect_sprite[_form_id];
	melee_hurt_effect_ani_speed = BattleController.mon_melee_hurt_effect_ani_speed[_form_id];
	melee_hurt_effect_height = BattleController.mon_melee_hurt_effect_height[_form_id];
	anim_speed_idle = BattleController.mon_anim_speed_idle[_form_id];
	anim_speed_hurt = BattleController.mon_anim_speed_hurt[_form_id];
	anim_speed_attacking = BattleController.mon_anim_speed_attacking[_form_id];

	spr_death_frame_count = sprite_get_number(spr_death);
	spr_hurt_frame_count = sprite_get_number(spr_hurt);

	// Set and reset the current animation+anim speed
	var _spr_indices = [spr_idle, spr_atk, spr_death, spr_hurt];
	var _spr_ani_speeds = [anim_speed_idle, anim_speed_hurt, anim_speed_attacking, anim_speed_idle];

	var _set_spr_index = _spr_indices[_new_spr_index];
	spr_index = _set_spr_index;
	image_index = 0;
	image_speed = _spr_ani_speeds[_new_spr_index];


}
