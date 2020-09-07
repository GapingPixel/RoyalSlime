/// @description Handle battle effect logic
if (sprite_index == sprBlank && effect_type != BATTLE_EFFECTS.TEXT) {
	exit;
}

switch(effect_type) {
	case BATTLE_EFFECTS.PECK:
	case BATTLE_EFFECTS.BITE_1:
	
		if (image_index >= hurt_frame && !displayed_damage) {
			hurt_target_fighter(target_fighter, dmg_amount);
			displayed_damage = true;
		}

		if (image_index > effect_frames_max - 1)
			instance_destroy();
		break;
	case BATTLE_EFFECTS.DRAGO_FIREBALL:
		x = lerp(x, x_to, lerp_speed / room_speed);
		y = lerp(y, y_to, lerp_speed / room_speed);
		
		if (round(x) == round(x_to) && round(y) == round(y_to)) {
			// The fireball should impact here. Create the explosion now.
			var _explosion = instance_create_depth(x - 17, y + 11, depth, BattleEffect);
			_explosion.target_fighter = target_fighter;
			_explosion.effect_type = BATTLE_EFFECTS.DRAGO_FIREBALL_EXPLOSION;
			_explosion.sprite_index = Effect_Explosion_1;
			_explosion.mask_index = Effect_Explosion_1;
			_explosion.effect_frames_max = sprite_get_number(Effect_Explosion_1);
			_explosion.image_index = 0;
			_explosion.image_speed = 1.8;
			_explosion.parent_id = parent_id; // Remember who shot the fireball.
			
			// Hurt the target fighter now, too.
			hurt_target_fighter(target_fighter, dmg_amount);

			// Re-center the battle camera
			BattleController.attack_cam_offset_x_to = 0;
		
			// Destroy the fireball itself, now that the explosion is created.
			instance_destroy();
		}
		
		//Effect_Explosion_1
		//turns_left--;
		break;
	case BATTLE_EFFECTS.DRAGO_FIREBALL_EXPLOSION:
		break;
	case BATTLE_EFFECTS.TEXT:
		break;
}

if (layer_behind_parent_timer > 0) {
	layer_behind_parent_timer--;
	layer_behind_parent = true;
} else if (layer_behind_parent_timer == 0)
	layer_behind_parent = false;

if (time_alive > 0)
	time_alive--;