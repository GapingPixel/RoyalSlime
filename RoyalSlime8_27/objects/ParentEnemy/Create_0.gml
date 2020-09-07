/// @description Initialize variables
spr_idle = sprBlank;
spr_atk = sprBlank;
spr_death = sprBlank;
spr_hurt = sprBlank;

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

stat_class = 1;

reward_exp_amount = 0; // How much exp to reward the player on death

max_hp = 99;
curr_hp = 99;
spr_index = sprBlank;
spr_death_frame_count = 99;
spr_hurt_frame_count = 99;

anim_speed_idle = 0.17;
anim_speed_hurt = 0.17;
anim_speed_attacking = 0.21;

enum MON_STATES {
	INIT,
	ALIVE,
	DYING,
	ESSENCE,
	MAX
};

passives_list = [MON_PASSIVES.NOT_ATTACKING];
multi_hit = 1; // How many times to attack in a single turn
turns_left = 0; // Is set to [multi_hit] whenever an attack is queued.
action_queued = false;
performing_move = MON_PASSIVES.NOT_ATTACKING;
passive_looping = -1;
my_level_position = 0; // How far into the (variable-length) dungeon this enemy is
spawned_material = false; // Flag to determine whether or not a material was spawned during death animation in death state

monster_id = MONSTERS.MAX;
state = MON_STATES.INIT;
img_xoff = 0;
img_yoff = 0;
death_time = 0;
image_speed = anim_speed_idle;

z_pos = 0;
zsp = 0;
jump_speed = 4;

img_alpha_to = 1; // Smooth fade whenever it's this fighter's turn

fighter_slot = noone;
x_off_to = 0;
y_off_to = 0;

melee_state = MELEE_STATES.NO_MELEE;
target_fighter = noone;
started_turn = false;

melee_hurt_effect_sprite = sprBlank;
melee_hurt_frame = 5;
melee_attacked = false;

shot_fireball = false;

battle_over = false;
