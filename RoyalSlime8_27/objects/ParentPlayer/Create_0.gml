/// @description Initialize variables

spr_index = sprBlank;

anim_speed_moving = 0.4;
spr_hurt_frame_count = 99;
set_monster_stats(MONSTERS.SLIME_BASE);
monster_id = MONSTERS.SLIME_BASE;
update_monster_form(monster_id);
alarm_set(0,2)
spr_index = spr_idle;
mask_index = spr_index;
walk_sprite = Slime_Basic_Walk;

var _img_num = sprite_get_number(spr_index);
image_index = irandom_range(0, _img_num);
image_speed = anim_speed_idle;
image_xscale = 1;
img_xoff = 0;
img_yoff = 0;
init_battle = false;
passives_list = [MON_PASSIVES.SLIME_MELEE];
multi_hit = 1; // How many times to attack in a single turn
turns_left = 0; // Is set to [multi_hit] whenever an attack is queued.
action_queued = false;
performing_move = MON_PASSIVES.NOT_ATTACKING;
passive_looping = -1;
instance_deactivate_object(self);

z_pos = 0;
zsp = 0;
jump_speed = 4;

img_alpha_to = 1; // Smooth fade whenever it's this fighter's turn

fighter_slot = noone;
x_off_to = 0;
y_off_to = 0;

end_battle_early_flag = true; // Make sure that multi-hit passives stop completely exactly when all enemies are dead

my_name = "Slime";
melee_state = MELEE_STATES.NO_MELEE;
target_fighter = noone;
started_turn = false;

melee_hurt_effect_sprite = sprBlank;
melee_hurt_frame = 5;
melee_attacked = false;

shot_fireball = false;