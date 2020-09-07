/// @description Initialize variables
sprite_index = sprBlank;
effect_frames_max = 1;

image_speed = 0;

target_fighter = noone;
dmg_amount = -1;
image_index = 0;

parent_id = noone;
hurt_frame = 3;
img_xoff = 50;
img_yoff = 85;
shadow_size = MON_SHADOWS.NONE;
displayed_damage = false;
effect_type = noone;

x_to = x;
y_to = y;
lerp_speed = 1;

layer_behind_parent = false;
layer_behind_parent_timer = -1;

// For showing any text on the battle field
text = "";
font_color = c_white;
text_y_speed = 0;
font = global.font;
time_max = 0;
time_alive = time_max;