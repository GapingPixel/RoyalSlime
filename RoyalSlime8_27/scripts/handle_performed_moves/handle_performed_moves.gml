/// @function handle_performed_moves()
/// @description The script that runs whenever a fighter (doesn't matter if it's a player or enemy, the script accounts for that) performs a move in battle
function handle_performed_moves() {

	var _attacker_is_player = true;

	// Determine if the fighter is a player or enemy
	if (object_index == ParentPlayer) {
		// Assume all enemies in battle are dead, until we find out that they aren't
		var _all_enemies_dead = true;
	
		// Check each enemies' FSM state to see if they're an Essence. If *any* of them are not already an essence, they must be alive, and we should mark the flag above to reflect that
		var _num_ene = instance_number(ParentEnemy);
		for (var _i = 0; _i < _num_ene; _i++) {
			var _this_ene = instance_find(ParentEnemy, _i);
		
			if (_this_ene.state != MON_STATES.ESSENCE)
				_all_enemies_dead = false;
		}
	
		if (_all_enemies_dead || BattleController.state != TREK_STATES.BATTLING) { // If all enemies are dead, or we're not in battling state,
		
			if (end_battle_early_flag && turns_left > 0) { // Abort any multi-hit passives and prepare for the next battle
				end_battle_early_flag = false;
			
			
				// Look at the first person in the battle turn order queue
				var _turn_order = BattleController.turn_order;
				var _head = ds_queue_head(_turn_order);

				// Look at every single Player. If they're at the front of the turn order queue, reset their action gauge back to 0.
				// However, if the front-of-queue Player's action gauge is filled, set their action gauge to 99% instead
				var _num_players = instance_number(ParentPlayer);
				for (var _i = 0; _i < _num_players; _i++) {
					var _this_player = instance_find(ParentPlayer, _i);
					
					with (_this_player) {
						if (id == _head)
							action_gauge_curr = 0;
						else if (action_gauge_curr >= action_gauge_max) {
							action_gauge_curr = floor(action_gauge_max * 0.99); // Set the action bar to 99% for everyone besides this player
						}
					}
				}
			
				// Clear the turn order queue
				ds_queue_clear(_turn_order);
			
				// Reset all the properties of this slime, who shouldn't be battling right now
				action_queued = false;
				passive_looping = -1;
				turns_left = 0;
				performing_move = MON_PASSIVES.NOT_ATTACKING;
				img_xoff = 0;
				img_yoff = 0;
				x_off_to = BattleController.player_battle_position_x[fighter_slot];
				y_off_to = BattleController.player_battle_position_y[fighter_slot];
				spr_index = spr_idle;
				image_speed = anim_speed_idle;
				image_index = 0;
				target_fighter = noone;
				melee_state = MELEE_STATES.NO_MELEE;
				exit; // All enemies are dead. Don't let this slime perform a move at all.
			}
		}
	} else {
		_attacker_is_player = false;
	}

	// This slime's turn hasn't happened yet, or they're dead. Don't let them perform any moves, and abort the script
	if (!started_turn || curr_hp <= 0)
		exit;

	// If we've made it this far, then the slime is allowed to perform its move.

	var _effect_type = noone;

	// Figure out which move to perform, and then perform it
	switch(performing_move) {
		default:
			break;
		case MON_PASSIVES.DRAGO_RANGED:
			if (spr_index == spr_atk) {
				if (image_index > sprite_get_number(spr_atk)) {
					spr_index = spr_idle;
					image_speed = anim_speed_idle;
					image_index = 0;
				}
			}
		
			if (shot_fireball)
				break;
		
			if (spr_index != spr_atk) {
				BattleController.attack_cam_offset_x_to = attack_cam_offset_x_max; // Pan the battle camera left toward the players

				spr_index = spr_atk;
				image_index = 0;
				image_speed = anim_speed_attacking;
			} else if (image_index >= 3) {
				// Figure out who this fighter is attacking
				var _target_fighter = attacking_determine_target(object_index, id);

				if (_target_fighter != noone) {
					// We found someone to attack. Now, lerp toward their relative position in the battle scene. Lerping happens within the ParentPlayer/ParentEnemy step events
					var _x_off_to = _target_fighter.x + 18;// + _dist;
					var _y_off_to = _target_fighter.y - 9;// - _target_fighter.melee_hurt_effect_height;

					// This is where the fireball should spawn
					var _spawn_x = x - BattleController.bkg_draw_offset_x + img_xoff + BattleController.attack_cam_offset_x - 7;
					var _spawn_y = y - melee_hurt_effect_height + 4;
				
					// Spawn the fireball, and set its properties
					my_fireball = instance_create_depth(-999, -999, depth, BattleEffect);
					my_fireball.x = _spawn_x;
					my_fireball.y = _spawn_y;
					my_fireball.target_fighter = _target_fighter;
					_effect_type = BATTLE_EFFECTS.DRAGO_FIREBALL;
					my_fireball.effect_type = _effect_type;
			
					my_fireball.x_to = _x_off_to;
					my_fireball.y_to = _y_off_to;
					my_fireball.lerp_speed = 30;//12;
				
					my_fireball.parent_id = id;
					my_fireball.layer_behind_parent_timer = round(my_fireball.lerp_speed / 3);
					my_fireball.layer_behind_parent = true;
					my_fireball.dmg_amount = calculate_damage(id, _target_fighter, ATTACK_TYPES.RANGED);
			
					my_fireball.sprite_index = Effect_Fireball_1;//melee_hurt_effect_sprite;
					my_fireball.mask_index = Effect_Fireball_1;//melee_hurt_effect_sprite;
					my_fireball.effect_frames_max = sprite_get_number(Effect_Fireball_1);
					my_fireball.image_index = 0;
					my_fireball.image_speed = 1.2;//melee_hurt_effect_ani_speed;

					// Make this fighter 100% opaque (because earlier, all the fighters are set to a lower opacity so that this one can light up now)
					_target_fighter.img_alpha_to = 1;
				
					// Let the fighter know that they shot a fireball already, so that they don't try to do it again
					shot_fireball = true;
				} else {
					// Nobody was found. Abort the battle.
					show_debug_message("Failed to find a target to attack! Aborting battle...");
					BattleController.abort_battle = true;
				}
			}
		
			//turns_left--;
			break;
		case MON_PASSIVES.HASTY:
		case MON_PASSIVES.HIBERNATE:
		case MON_PASSIVES.PIG_MELEE:
			perform_melee(BATTLE_EFFECTS.BITE_1, Effect_Bite_1);
			break;
		case MON_PASSIVES.PENKING_MELEE:
			perform_melee(BATTLE_EFFECTS.PECK, Effect_Peck);
			break;
		case MON_PASSIVES.SLIME_MELEE:
			perform_melee(BATTLE_EFFECTS.BITE_1, Effect_Bite_1);
			break;
	}


}
