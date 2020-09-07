/// @function define_monster_data()
/// @description This is where all the monster data gets defined. Task is broken up into smaller scripts, too
function define_monster_data() {

	// Define the order of the monster IDs in the game. Order is very important to match up with the graphics sets. Second half is a mirror of the first half, except their first values:
	// 1) MONSTERS.SLIME_BASE, which is 100% always a player ID
	// 2) MONSTERS.FORM_COUNT, which not only marks the mid-way point of the enum and the start of the enemy monster enums, but also tells us how many unique monster forms there are in the game

	enum MONSTERS {
		SLIME_BASE,
		SNAILESS,
		CARAPOD,
		ROBUSTROPOD,
		GROWDENT,
		SHROOMBY,
		SYCOPLANT,
		ORBETTE,
		DECWEAVER,
		SAGPON,
		DRAKAENA,
		KOMOBY,
		KOMOBRA,
		CLAYLING,
		RUNITE,
		HONEYBY,
		BUZZTINEL,
		PLACEHOLDER_THIRD_EVO_BEE,
		PLACEHOLDER,
		PLACEHOLDER2,
		PLACEHOLDER3,
		PLACEHOLDER4,
		PLACEHOLDER5,
		PLACEHOLDER6,
		PLACEHOLDER7,
		SOOTSWINE,
		HOGNITE,
		PLACEHOLDER_WHALEBBY,
		MAGMORKA,
		VO_ZA,
		ZAA_ZA,
		TEMPOLE,
		EMBULL,
		DRACO,
		DRAGODON,
		MARBLING,
		BASITE,
		MINIREL,
		OBSIDIARD,
		BLAZEBORNE,
		PLACEHOLDER8,
		PENGLOO,
		PENKING,
		MAKOMUNCH,
		RAZORMAW,
		SKUTTLEBIT,
		CRAWNAUGHT,
		PLACEHOLDER_CLOUD_BIRB,
		PLACEHOLDER_CLOUD_BIRB_EVO,
		PLACEHOLDER_BEETLE,
		PLACEHOLDER_CENTI,
		PLACEHOLDER_MINI_SHARK,
		PLACEHOLDER_SHARK_EVO,
		PLACEHOLDER_GOBLIN_BBY,
		PLACEHOLDER_GOBLIN_EVO,
		PLACEHOLDER_GOLDFISH_BBY,
		PLACEHOLDER_GOLDFISH_EVO,
		PLACEHOLDER_HEDGEHOG_BBY,
		PLACEHOLDER_HEDGEHOG_EVO,
		PLACEHOLDER9,
		PLACEHOLDER10,
		PLACEHOLDER11,
		PLACEHOLDER12,
		PLACEHOLDER13,
		PLACEHOLDER14,
		PLACEHOLDER_GREY_WOLF,
		PLACEHOLDER_BROWN_WOLF,
		PLACEHOLDER_WOLF_EVO,
		PLACEHOLDER_WISP,
		PLACEHOLDER_MIMIC_CHEST,
		PLACEHOLDER_BAT_BBY,
		PLACEHOLDER_BAT_EVO,
		PLACEHOLDER_STUMBBY,
		PLACEHOLDER_STUMEVO,
		PLACEHOLDER15,
		PLACEHOLDER_SLUDGE_HOMIE,
		PLACEHOLDER_HANDSY_HOMIE,
		PLACEHOLDER16,
		PLACEHOLDER17,
		PLACEHOLDER18,
		PLACEHOLDER19,
		WHALE,

		FORM_COUNT, // This helps us know how many unique forms there are (since there is no enemy slime)

		E_SNAILESS,
		E_CARAPOD,
		E_ROBUSTROPOD,
		E_GROWDENT,
		E_SHROOMBY,
		E_SYCOPLANT,
		E_ORBETTE,
		E_DECWEAVER,
		E_SAGPON,
		E_DRAKAENA,
		E_KOMOBY,
		E_KOMOBRA,
		E_CLAYLING,
		E_RUNITE,
		E_HONEYBY,
		E_BUZZTINEL,
		E_PLACEHOLDER_THIRD_EVO_BEE,
		E_PLACEHOLDER,
		E_PLACEHOLDER1,
		E_PLACEHOLDER2,
		E_PLACEHOLDER3,
		E_PLACEHOLDER4,
		E_PLACEHOLDER5,
		E_PLACEHOLDER6,
		E_SOOTSWINE,
		E_HOGNITE,
		E_PLACEHOLDER_WHALEBBY,
		E_MAGMORKA,
		E_VO_ZA,
		E_ZAA_ZA,
		E_TEMPOLE,
		E_EMBULL,
		E_DRACO,
		E_DRAGODON,
		E_MARBLING,
		E_BASITE,
		E_MINIREL,
		E_OBSIDIARD,
		E_BLAZEBORNE,
		E_PLACEHOLDER7,
		E_PENGLOO,
		E_PENKING,
		E_MAKOMUNCH,
		E_RAZORMAW,
		E_SKUTTLEBIT,
		E_CRAWNAUGHT,
		E_PLACEHOLDER_CLOUD_BIRB,
		E_PLACEHOLDER_CLOUD_BIRB_EVO,
		E_PLACEHOLDER_BEETLE,
		E_PLACEHOLDER_CENTI,
		E_PLACEHOLDER_MINI_SHARK,
		E_PLACEHOLDER_SHARK_EVO,
		E_PLACEHOLDER_GOBLIN_BBY,
		E_PLACEHOLDER_GOBLIN_EVO,
		E_PLACEHOLDER_GOLDFISH_BBY,
		E_PLACEHOLDER_GOLDFISH_EVO,
		E_PLACEHOLDER_HEDGEHOG_BBY,
		E_PLACEHOLDER_HEDGEHOG_EVO,
		E_PLACEHOLDER8,
		E_PLACEHOLDER9,
		E_PLACEHOLDER10,
		E_PLACEHOLDER11,
		E_PLACEHOLDER12,
		E_PLACEHOLDER13,
		E_PLACEHOLDER_GREY_WOLF,
		E_PLACEHOLDER_BROWN_WOLF,
		E_PLACEHOLDER_WOLF_EVO,
		E_PLACEHOLDER_WISP,
		E_PLACEHOLDER_MIMIC_CHEST,
		E_PLACEHOLDER_BAT_BBY,
		E_PLACEHOLDER_BAT_EVO,
		E_PLACEHOLDER_STUMBBY,
		E_PLACEHOLDER_STUMEVO,
		E_PLACEHOLDER14,
		E_PLACEHOLDER_SLUDGE_HOMIE,
		E_PLACEHOLDER_HANDSY_HOMIE,
		E_PLACEHOLDER15,
		E_PLACEHOLDER16,
		E_PLACEHOLDER17,
		E_PLACEHOLDER18,
		MAX
	};

	// Monster types
	enum MON_TYPES {
		TYPELESS,
		FIRE,
		WATER,
		NATURE,
		LIGHT,
		DARK,
		UNKNOWN,
		MAX
	};

	// Monster classes
	enum MON_CLASSES {
		FIX_ME,
		FIGHTER,
		DEFENDER,
		CLERIC,
		MAGE,
		RANGER,
		MAX
	};

	// Monster Passives
	enum MON_PASSIVES {
		NOT_ATTACKING,
		SLIME_MELEE,
		PENKING_MELEE,
		PIG_MELEE,
		DRAGO_RANGED,
		HIBERNATE,
		HASTY,
		MULTI_HIT,
		MAX
	};

	// The available monster rarity properties
	enum MON_RARITIES {
		COMMON,
		UNCOMMON,
		RARE,
		LEGENDARY,
		MAX
	};

	// Stats
	enum MON_STATS {
		STR,
		DEF,
		MAG,
		MDEF,
		HP,
		AGI,
		EVA,
		DEX,
		MAX
	};

	// Categories that items can be grouped into (Undefined is unused for now; Added just in case it might be relevant)
	enum ITEM_TYPES {
		UNDEFINED,
		MATERIALS,
		RESOURCES,
		ESSENCES,
		MATTER,
		MAX
	};

	// Each monster form has their own node in a large tree defining each monster.
	// (TODO: Move the properties at the bottom of this script to the actual monster nodes defined in the define_evolution_nodes() script; Update the battle system to account for this change, too)

	enum FORM_NODES {
		FORM_ID,
		NAME,
		IS_FIRST_EVO,
		EVO_LIST,
		INGR_REQS,
		MAX
	};

	define_ingredients();

	// Define all the different reward drops that monsters in the game can provide
	define_reward_drops();

	// Define all the different evolutions that exist in the game, and their individual Material Requirements, too
	define_evolution_nodes();

	// Bonus stat points per level, based on Rarity

	rarity_bonuses_table = ds_grid_create(MON_RARITIES.MAX, MON_STATS.MAX);
	ds_grid_clear(rarity_bonuses_table, 3);

	rarity_bonuses_table[# MON_RARITIES.COMMON, MON_STATS.HP] = 5;
	rarity_bonuses_table[# MON_RARITIES.COMMON, MON_STATS.AGI] = 1;
	rarity_bonuses_table[# MON_RARITIES.COMMON, MON_STATS.EVA] = 1;

	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.STR] = 4;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.DEF] = 4;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.MAG] = 4;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.MDEF] = 4;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.HP] = 7;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.AGI] = 2;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.EVA] = 2;
	rarity_bonuses_table[# MON_RARITIES.UNCOMMON, MON_STATS.DEX] = 4;

	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.STR] = 5;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.DEF] = 5;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.MAG] = 5;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.MDEF] = 5;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.HP] = 9;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.AGI] = 2;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.EVA] = 2;
	rarity_bonuses_table[# MON_RARITIES.RARE, MON_STATS.DEX] = 5;

	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.STR] = 7;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.DEF] = 7;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.MAG] = 7;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.MDEF] = 7;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.HP] = 12;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.AGI] = 3;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.EVA] = 3;
	rarity_bonuses_table[# MON_RARITIES.LEGENDARY, MON_STATS.DEX] = 7;

	// Bonus stat points per level, based on Class

	class_bonuses_table = ds_grid_create(MON_CLASSES.MAX, MON_STATS.MAX);
	ds_grid_clear(class_bonuses_table, 0);
	class_bonuses_table[# MON_CLASSES.FIGHTER, MON_STATS.STR] = 2;
	class_bonuses_table[# MON_CLASSES.FIGHTER, MON_STATS.DEF] = 1;
	class_bonuses_table[# MON_CLASSES.DEFENDER, MON_STATS.DEF] = 3;
	class_bonuses_table[# MON_CLASSES.MAGE, MON_STATS.MAG] = 3;
	class_bonuses_table[# MON_CLASSES.CLERIC, MON_STATS.MAG] = 2;
	class_bonuses_table[# MON_CLASSES.DEFENDER, MON_STATS.MDEF] = 2;
	class_bonuses_table[# MON_CLASSES.MAGE, MON_STATS.MDEF] = 1;
	class_bonuses_table[# MON_CLASSES.CLERIC, MON_STATS.MDEF] = 2;
	class_bonuses_table[# MON_CLASSES.FIGHTER, MON_STATS.HP] = 3;
	class_bonuses_table[# MON_CLASSES.DEFENDER, MON_STATS.HP] = 6;
	class_bonuses_table[# MON_CLASSES.RANGER, MON_STATS.HP] = 2;
	class_bonuses_table[# MON_CLASSES.MAGE, MON_STATS.HP] = 3;
	class_bonuses_table[# MON_CLASSES.CLERIC, MON_STATS.HP] = 4;
	class_bonuses_table[# MON_CLASSES.FIGHTER, MON_STATS.AGI] = 2;
	class_bonuses_table[# MON_CLASSES.RANGER, MON_STATS.AGI] = 1;
	class_bonuses_table[# MON_CLASSES.FIGHTER, MON_STATS.EVA] = 1;
	class_bonuses_table[# MON_CLASSES.DEFENDER, MON_STATS.EVA] = 1;
	class_bonuses_table[# MON_CLASSES.RANGER, MON_STATS.EVA] = 2;
	class_bonuses_table[# MON_CLASSES.MAGE, MON_STATS.EVA] = 1;
	class_bonuses_table[# MON_CLASSES.RANGER, MON_STATS.DEX] = 2;


	// The monsters' FSM states for melee attacks

	enum MELEE_STATES {
		NO_MELEE,
		INITIAL_LUNGE,
		ATTACKING,
		RETREAT_LUNGE,
		MAX
	};

	// The shadow size to draw for each monster
	enum MON_SHADOWS {
		NONE,
		SMALL,
		MEDIUM,
		BIG,
		MAX
	};

	// Identifier for obj BattleEffects so BattleEffects know which effect to display on the screen
	enum BATTLE_EFFECTS {
		NOTHING,
		BITE_1,
		DRAGO_FIREBALL,
		DRAGO_FIREBALL_EXPLOSION,
		PECK,
		SLASH,
		EXPLOSION_1,
		TEXT,
		MAX
	};

	// Identifier for the kind of attack which a monster had performed
	enum ATTACK_TYPES {
		STRENGTH,
		MAGIC,
		RANGED,
		MAX
	};

	define_skill_lists();

	// All monster shadows are set to medium by default unless otherwise specified
	var _mon_count = MONSTERS.MAX;
	for (var _i = _mon_count; _i >= 0; _i--) {
		mon_shadow_size[_i] = MON_SHADOWS.MEDIUM;
	}

	// Define the types multiplication table for damage calculations. Refer to Dan's doc for more info about how this is structured
	var _grid_size = MON_TYPES.MAX;
	types_multiplication_table = ds_grid_create(_grid_size, _grid_size);
	var _tmult = types_multiplication_table;

	for (var _y = 0; _y < _grid_size; _y++) {
		for (var _x = 0; _x < _grid_size; _x++) {
			_tmult[# _x, _y] = 1;
		}
	}
	_tmult[# MON_TYPES.LIGHT, MON_TYPES.TYPELESS] = 0.5;
	_tmult[# MON_TYPES.DARK, MON_TYPES.TYPELESS] = 0.5;
	_tmult[# MON_TYPES.UNKNOWN, MON_TYPES.TYPELESS] = 4;
	_tmult[# MON_TYPES.WATER, MON_TYPES.FIRE] = 0.5;
	_tmult[# MON_TYPES.NATURE, MON_TYPES.FIRE] = 2;
	_tmult[# MON_TYPES.UNKNOWN, MON_TYPES.FIRE] = 2;
	_tmult[# MON_TYPES.FIRE, MON_TYPES.WATER] = 2;
	_tmult[# MON_TYPES.NATURE, MON_TYPES.WATER] = 0.5;
	_tmult[# MON_TYPES.UNKNOWN, MON_TYPES.WATER] = 2;
	_tmult[# MON_TYPES.FIRE, MON_TYPES.NATURE] = 0.5;
	_tmult[# MON_TYPES.WATER, MON_TYPES.NATURE] = 2;
	_tmult[# MON_TYPES.UNKNOWN, MON_TYPES.NATURE] = 2;
	_tmult[# MON_TYPES.TYPELESS, MON_TYPES.LIGHT] = 2;
	_tmult[# MON_TYPES.DARK, MON_TYPES.LIGHT] = 2;
	_tmult[# MON_TYPES.UNKNOWN, MON_TYPES.LIGHT] = 0.5;
	_tmult[# MON_TYPES.TYPELESS, MON_TYPES.DARK] = 2;
	_tmult[# MON_TYPES.LIGHT, MON_TYPES.DARK] = 2;
	_tmult[# MON_TYPES.UNKNOWN, MON_TYPES.DARK] = 0.5;
	_tmult[# MON_TYPES.TYPELESS, MON_TYPES.UNKNOWN] = 0;
	_tmult[# MON_TYPES.FIRE, MON_TYPES.UNKNOWN] = 2;
	_tmult[# MON_TYPES.WATER, MON_TYPES.UNKNOWN] = 2;
	_tmult[# MON_TYPES.NATURE, MON_TYPES.UNKNOWN] = 2;
	_tmult[# MON_TYPES.LIGHT, MON_TYPES.UNKNOWN] = 0.5;
	_tmult[# MON_TYPES.DARK, MON_TYPES.UNKNOWN] = 0.5;

	// Properties for each monster (TODO: Move these properties to the actual monster nodes defined in the define_evolution_nodes() script; Update the battle system to account for this change, too)
	mon_sprite_idle[MONSTERS.SLIME_BASE] = Slime_Basic;
	mon_sprite_attack[MONSTERS.SLIME_BASE] = Slime_Basic_Attack;
	mon_sprite_death[MONSTERS.SLIME_BASE] = Slime_Basic_death;
	mon_sprite_hurt[MONSTERS.SLIME_BASE] = Slime_Basic_Hurt;
	mon_sprite_victory[MONSTERS.SLIME_BASE] = Slime_Basic;
	mon_stat_base_str[MONSTERS.SLIME_BASE] = 5;
	mon_stat_base_def[MONSTERS.SLIME_BASE] = 5;
	mon_stat_base_mag[MONSTERS.SLIME_BASE] = 3;
	mon_stat_base_mdef[MONSTERS.SLIME_BASE] = 3;
	mon_stat_base_hp[MONSTERS.SLIME_BASE] = 10;
	mon_stat_base_agi[MONSTERS.SLIME_BASE] = 5;
	mon_stat_base_eva[MONSTERS.SLIME_BASE] = 5;
	mon_stat_base_dex[MONSTERS.SLIME_BASE] = 5;
	mon_type[MONSTERS.SLIME_BASE] = MON_TYPES.TYPELESS;
	mon_class[MONSTERS.SLIME_BASE] = MON_CLASSES.FIX_ME;
	mon_multi_hit[MONSTERS.SLIME_BASE] = 1;
	mon_melee_hurt_frame[MONSTERS.SLIME_BASE] = 5;
	mon_melee_hurt_effect_sprite[MONSTERS.SLIME_BASE] = Effect_Bite_1;
	mon_melee_hurt_effect_ani_speed[MONSTERS.SLIME_BASE] = 2;
	mon_melee_hurt_effect_height[MONSTERS.SLIME_BASE] = 8;
	mon_anim_speed_idle[MONSTERS.SLIME_BASE] = 0.092;
	mon_anim_speed_hurt[MONSTERS.SLIME_BASE] = 0.17;
	mon_anim_speed_attacking[MONSTERS.SLIME_BASE] = 0.21;
	mon_level[MONSTERS.SLIME_BASE] = 1;
	
	
	mon_sprite_idle[MONSTERS.WHALE] = s_whale //Slime_Basic;
	mon_sprite_attack[MONSTERS.WHALE] = s_whale;
	mon_sprite_death[MONSTERS.WHALE] = s_whale;
	mon_sprite_hurt[MONSTERS.WHALE] = s_whale;
	mon_stat_base_str[MONSTERS.WHALE] = 5;
	mon_stat_base_def[MONSTERS.WHALE] = 5;
	mon_stat_base_mag[MONSTERS.WHALE] = 3;
	mon_stat_base_mdef[MONSTERS.WHALE] = 3;
	mon_stat_base_hp[MONSTERS.WHALE] = 10;
	mon_stat_base_agi[MONSTERS.WHALE] = 5;
	mon_stat_base_eva[MONSTERS.WHALE] = 5;
	mon_stat_base_dex[MONSTERS.WHALE] = 5;
	mon_type[MONSTERS.WHALE] = MON_TYPES.TYPELESS;
	mon_class[MONSTERS.WHALE] = MON_CLASSES.FIX_ME;
	mon_multi_hit[MONSTERS.WHALE] = 1;
	mon_melee_hurt_frame[MONSTERS.WHALE] = 5;
	mon_melee_hurt_effect_sprite[MONSTERS.WHALE] = Effect_Bite_1;
	mon_melee_hurt_effect_ani_speed[MONSTERS.WHALE] = 2;
	mon_melee_hurt_effect_height[MONSTERS.WHALE] = 8;
	mon_anim_speed_idle[MONSTERS.WHALE] = 0.092;
	mon_anim_speed_hurt[MONSTERS.WHALE] = 0.17;
	mon_anim_speed_attacking[MONSTERS.WHALE] = 0.21;
	mon_level[MONSTERS.WHALE] = 1;
	
	mon_sprite_idle[MONSTERS.DRACO] = Slime_Draco_Idle;
	mon_sprite_attack[MONSTERS.DRACO] = Slime_Draco_Fireball;
	mon_sprite_death[MONSTERS.DRACO] = Slime_Draco_Death;
	mon_sprite_hurt[MONSTERS.DRACO] = Slime_Draco_HurtIdle;
	mon_sprite_victory[MONSTERS.DRACO] = Slime_Draco_Victory;
	mon_stat_base_str[MONSTERS.DRACO] = 5;
	mon_stat_base_def[MONSTERS.DRACO] = 5;
	mon_stat_base_mag[MONSTERS.DRACO] = 3;
	mon_stat_base_mdef[MONSTERS.DRACO] = 3;
	mon_stat_base_hp[MONSTERS.DRACO] = 10;
	mon_stat_base_agi[MONSTERS.DRACO] = 5;
	mon_stat_base_eva[MONSTERS.DRACO] = 5;
	mon_stat_base_dex[MONSTERS.DRACO] = 5;
	mon_type[MONSTERS.DRACO] = MON_TYPES.TYPELESS;
	mon_class[MONSTERS.DRACO] = MON_CLASSES.FIX_ME;
	mon_multi_hit[MONSTERS.DRACO] = 1;
	mon_melee_hurt_frame[MONSTERS.DRACO] = 5;
	mon_melee_hurt_effect_sprite[MONSTERS.DRACO] = Effect_Bite_1;
	mon_melee_hurt_effect_ani_speed[MONSTERS.DRACO] = 2;
	mon_melee_hurt_effect_height[MONSTERS.DRACO] = 8;
	mon_anim_speed_idle[MONSTERS.DRACO] = 0.092;
	mon_anim_speed_hurt[MONSTERS.DRACO] = 0.17;
	mon_anim_speed_attacking[MONSTERS.DRACO] = 0.21;
	mon_level[MONSTERS.DRACO] = 1;
	mon_shadow_size[MONSTERS.DRACO] = MON_SHADOWS.MAX;
	
	mon_sprite_idle[MONSTERS.DRAGODON] = Slime_Drago2_Idle;
	mon_sprite_attack[MONSTERS.DRAGODON] = Slime_Basic_Attack;
	mon_sprite_death[MONSTERS.DRAGODON] = Slime_Basic_death;
	mon_sprite_hurt[MONSTERS.DRAGODON] = Slime_Basic_Hurt;
	mon_stat_base_str[MONSTERS.DRAGODON] = 5;
	mon_stat_base_def[MONSTERS.DRAGODON] = 5;
	mon_stat_base_mag[MONSTERS.DRAGODON] = 3;
	mon_stat_base_mdef[MONSTERS.DRAGODON] = 3;
	mon_stat_base_hp[MONSTERS.DRAGODON] = 10;
	mon_stat_base_agi[MONSTERS.DRAGODON] = 5;
	mon_stat_base_eva[MONSTERS.DRAGODON] = 5;
	mon_stat_base_dex[MONSTERS.DRAGODON] = 5;
	mon_type[MONSTERS.DRAGODON] = MON_TYPES.TYPELESS;
	mon_class[MONSTERS.DRAGODON] = MON_CLASSES.FIX_ME;
	mon_multi_hit[MONSTERS.DRAGODON] = 1;
	mon_melee_hurt_frame[MONSTERS.DRAGODON] = 5;
	mon_melee_hurt_effect_sprite[MONSTERS.DRAGODON] = Effect_Bite_1;
	mon_melee_hurt_effect_ani_speed[MONSTERS.DRAGODON] = 2;
	mon_melee_hurt_effect_height[MONSTERS.DRAGODON] = 8;
	mon_anim_speed_idle[MONSTERS.DRAGODON] = 0.092;
	mon_anim_speed_hurt[MONSTERS.DRAGODON] = 0.17;
	mon_anim_speed_attacking[MONSTERS.DRAGODON] = 0.21;
	mon_level[MONSTERS.DRAGODON] = 1;

	mon_sprite_idle[MONSTERS.E_SOOTSWINE] = Enemy_Pig;
	mon_sprite_attack[MONSTERS.E_SOOTSWINE] = Enemy_Pig_attack;
	mon_sprite_death[MONSTERS.E_SOOTSWINE] = Enemy_Pig_death;
	mon_sprite_hurt[MONSTERS.E_SOOTSWINE] = Enemy_Pig_hurt;
	mon_stat_base_str[MONSTERS.E_SOOTSWINE] = 6;
	mon_stat_base_def[MONSTERS.E_SOOTSWINE] = 3;
	mon_stat_base_mag[MONSTERS.E_SOOTSWINE] = 2;
	mon_stat_base_mdef[MONSTERS.E_SOOTSWINE] = 4;
	mon_stat_base_hp[MONSTERS.E_SOOTSWINE] = 8;
	mon_stat_base_agi[MONSTERS.E_SOOTSWINE] = 4;
	mon_stat_base_eva[MONSTERS.E_SOOTSWINE] = 4;
	mon_stat_base_dex[MONSTERS.E_SOOTSWINE] = 4;
	mon_type[MONSTERS.E_SOOTSWINE] = MON_TYPES.FIRE;
	mon_class[MONSTERS.E_SOOTSWINE] = MON_CLASSES.FIX_ME;
	mon_passives_list[MONSTERS.E_SOOTSWINE] = [MON_PASSIVES.PIG_MELEE];
	mon_multi_hit[MONSTERS.E_SOOTSWINE] = 1;
	mon_melee_hurt_frame[MONSTERS.E_SOOTSWINE] = 2;
	mon_melee_hurt_effect_sprite[MONSTERS.E_SOOTSWINE] = Effect_Bite_1;
	mon_melee_hurt_effect_ani_speed[MONSTERS.E_SOOTSWINE] = 2;
	mon_melee_hurt_effect_height[MONSTERS.E_SOOTSWINE] = 8;
	mon_anim_speed_idle[MONSTERS.E_SOOTSWINE] = 0.17;
	mon_anim_speed_hurt[MONSTERS.E_SOOTSWINE] = 0.17;
	mon_anim_speed_attacking[MONSTERS.E_SOOTSWINE] = 0.17;
	mon_level[MONSTERS.E_SOOTSWINE] = 1;

	mon_sprite_idle[MONSTERS.E_PENKING] = Enemy_Penking;
	mon_sprite_attack[MONSTERS.E_PENKING] = Enemy_Penking_attack;
	mon_sprite_death[MONSTERS.E_PENKING] = Enemy_Penking_death;
	mon_sprite_hurt[MONSTERS.E_PENKING] = Enemy_Penking_hurt;
	mon_stat_base_str[MONSTERS.E_PENKING] = 3;
	mon_stat_base_def[MONSTERS.E_PENKING] = 5;
	mon_stat_base_mag[MONSTERS.E_PENKING] = 6;
	mon_stat_base_mdef[MONSTERS.E_PENKING] = 5;
	mon_stat_base_hp[MONSTERS.E_PENKING] = 12;
	mon_stat_base_agi[MONSTERS.E_PENKING] = 5;
	mon_stat_base_eva[MONSTERS.E_PENKING] = 4;
	mon_stat_base_dex[MONSTERS.E_PENKING] = 4;
	mon_type[MONSTERS.E_PENKING] = MON_TYPES.WATER;
	mon_class[MONSTERS.E_PENKING] = MON_CLASSES.FIX_ME;
	mon_passives_list[MONSTERS.E_PENKING] = [MON_PASSIVES.PENKING_MELEE];
	mon_multi_hit[MONSTERS.E_PENKING] = 1;
	mon_melee_hurt_frame[MONSTERS.E_PENKING] = 2;
	mon_melee_hurt_effect_sprite[MONSTERS.E_PENKING] = Effect_Peck;
	mon_melee_hurt_effect_ani_speed[MONSTERS.E_PENKING] = 2;
	mon_melee_hurt_effect_height[MONSTERS.E_PENKING] = 11;
	mon_anim_speed_idle[MONSTERS.E_PENKING] = 0.17;
	mon_anim_speed_hurt[MONSTERS.E_PENKING] = 0.17;
	mon_anim_speed_attacking[MONSTERS.E_PENKING] = 0.17;
	mon_level[MONSTERS.E_PENKING] = 1;

	mon_sprite_idle[MONSTERS.E_DRACO] = Enemy_Drago;
	mon_sprite_attack[MONSTERS.E_DRACO] = Enemy_Drago_attack;
	mon_sprite_death[MONSTERS.E_DRACO] = Enemy_Drago_death;
	mon_sprite_hurt[MONSTERS.E_DRACO] = Enemy_Drago_hurt;
	mon_stat_base_str[MONSTERS.E_DRACO] = 5;
	mon_stat_base_def[MONSTERS.E_DRACO] = 8;
	mon_stat_base_mag[MONSTERS.E_DRACO] = 15;
	mon_stat_base_mdef[MONSTERS.E_DRACO] = 10;
	mon_stat_base_hp[MONSTERS.E_DRACO] = 25;
	mon_stat_base_agi[MONSTERS.E_DRACO] = 8;
	mon_stat_base_eva[MONSTERS.E_DRACO] = 5;
	mon_stat_base_dex[MONSTERS.E_DRACO] = 5;
	mon_type[MONSTERS.E_DRACO] = MON_TYPES.FIRE;
	mon_class[MONSTERS.E_DRACO] = MON_CLASSES.FIX_ME;
	mon_passives_list[MONSTERS.E_DRACO] = [MON_PASSIVES.DRAGO_RANGED];
	mon_multi_hit[MONSTERS.E_DRACO] = 1;
	mon_melee_hurt_frame[MONSTERS.E_DRACO] = 4;
	mon_melee_hurt_effect_sprite[MONSTERS.E_DRACO] = Effect_Fireball_1;
	mon_melee_hurt_effect_ani_speed[MONSTERS.E_DRACO] = 2;
	mon_melee_hurt_effect_height[MONSTERS.E_DRACO] = 17;
	mon_anim_speed_idle[MONSTERS.E_DRACO] = 0.17;
	mon_anim_speed_hurt[MONSTERS.E_DRACO] = 0.17;
	mon_anim_speed_attacking[MONSTERS.E_DRACO] = 0.17;
	mon_level[MONSTERS.E_DRACO] = 1;


}
