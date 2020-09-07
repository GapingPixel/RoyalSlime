/// @function step_battle_sequence()
/// @description The step event for the entire battle system. Run from BattleController Step Event
function step_battle_sequence() {

	// Abort if we shouldn't be battling
	if (BattleController.state != TREK_STATES.BATTLING)
		exit;

	// Figure out how many members exist in the list of fighting Players+Enemies
	var _flist_size = ds_list_size(fighter_list);


	// Assume that all monsters are dead, until we find out that any of them still has health remaining
	var _all_mons_dead = true;
	var _num_monsters = instance_number(ParentEnemy);

	for (var _i = 0; _i < _num_monsters; _i++) {
		var _this_monster = instance_find(ParentEnemy, _i);
		if (_this_monster.curr_hp > 0)
			_all_mons_dead = false;
	}

	// Abort the battle if this flag is set. Clear the queue, delete all enemies, and continue progressing the adventure
	if (abort_battle) {
		show_debug_message("An error has occured. Aborting the battle and deleting all enemies.");
	
		if (instance_exists(ParentEnemy))
			instance_destroy(ParentEnemy);

		ds_queue_clear(turn_order);
		state = TREK_STATES.MOVING;
		current_turn_taker = noone;
		_all_mons_dead = true;
	}

	// Figure out how many entries in the turn order queue there are
	var _queue_size = ds_queue_size(turn_order);

	// Abort if the abort flag is set, or if nobody is registered in the fighter list
	if (ds_list_empty(fighter_list) || abort_battle)
		exit;

	// Look at every single fighter on the battlefield
	for (var _i = 0; _i < total_fighters; _i++) {
		var _this_fighter = fighter_list[| _i];
	
		// Check if anyone on the screen is lunging.
		var _someone_is_attacking = false;
		for (var _j = 0; _j < total_fighters; _j++) {
			var _lunger = fighter_list[| _j];
		
			if (instance_exists(_lunger)) {
				if (_lunger.melee_state == MELEE_STATES.ATTACKING && _lunger.z_pos >= 0
					&& round(_lunger.x) == _lunger.x_off_to
					&& round(_lunger.y) == _lunger.y_off_to)
					_someone_is_attacking = true; // If they're lunging, they must be attacking. Set the flag.
			}
		}
	
		// Increment the action bar only if someone is NOT lunging, someone has a move in the queue, or all monsters are NOT dead
		if (!_all_mons_dead && !_someone_is_attacking) {
			if (_this_fighter.curr_hp > 0 && _this_fighter.action_gauge_curr < _this_fighter.action_gauge_max) {
				_this_fighter.action_gauge_curr += (action_gauge_base_inc_rate + ((_this_fighter.stat_base[MON_STATS.AGI] + floor(_this_fighter.stat_class_bonus[MON_STATS.AGI]) + floor(_this_fighter.stat_rarity_bonus[MON_STATS.AGI])) * 0.60)); // action_gauge_base_inc_rate
			
				// Action gauge has filled; queue turn and reset the gauge
				if (_this_fighter.action_gauge_curr >= _this_fighter.action_gauge_max && !_this_fighter.action_queued) {
					_this_fighter.action_queued = true;
				
					// If we haven't already figured out whose turn it is, let this fighter fill that position
					if (current_turn_taker == noone)
						current_turn_taker = _this_fighter;
		
					// This fighter may attack [multi_hit] times in a single turn order queue slot.
					_this_fighter.turns_left = _this_fighter.multi_hit;
				
					// Figure out how many passives that this fighter has equipped. Let them know how many they have, in case this list had been updated at some point (this is probably redundant, but a safety check. ideally, the value should be updated whenever their internal passive list is updated)
					var _passives_size = array_length_1d(_this_fighter.passives_list);
					_this_fighter.passive_looping = _passives_size - 1;
				
					// Add this fighter to the turn order queue, then update the size of the queue
					ds_queue_enqueue(turn_order, _this_fighter);
					_queue_size = ds_queue_size(turn_order);
				}
			}
		} else if (_all_mons_dead) {
			// All monsters are dead; Loop through every entry in the list and remove all the fighters that no longer exist
			// (Don't destroy the whole list or the game will forget whose action bars are full already
			var _ds = fighter_list;
			var _size = ds_list_size(_ds);
			var _fighter_id = noone;
		
			var _head = ds_queue_head(turn_order);
		
			var _ended_early = false;

			// Remove anyone from the fighter list who does not exist
			for (var _i = 0; _i < _size; _i++) {
				_fighter_id = ds_list_find_value(_ds, _i);
				if (!is_undefined(_fighter_id)) {
					if (!instance_exists(_fighter_id))
						ds_list_delete(_ds, _i);
					else if (_fighter_id.object_index == ParentPlayer) {
						if (_fighter_id.end_battle_early_flag) {
							_ended_early = true;
							show_debug_message("Ended battle early");
						}
					}
				}
			}

			// Re-center the battle camera
			BattleController.attack_cam_offset_x_to = 0;
		
			// Completely clear the turn order list
			if (!_ended_early) {
				ds_queue_clear(turn_order);
				_queue_size = 0;
			} else {
				state = TREK_STATES.MOVING;
			}

			current_turn_taker = noone;
			break;
		}
	}

	if (_queue_size > 0) {
		var _turn_taker = ds_queue_head(turn_order);
	
		// Don't perform any moves if
		// - The fighter with a queued move is not the one attacking RIGHT NOW
		// - We're waiting for someone to finish their current turn
		// - The fighter's current HP is <= 0

		if (current_turn_taker != _turn_taker)// || turn_waiting_on != noone)
			return;
	
		var _can_move = true;
	
		while (_turn_taker.curr_hp <= 0 && _queue_size > 0) {
			// If we reached this code, the current turntaker must be dead. Remove them from the queue.
			with (_turn_taker) {
				if (curr_hp > 0) {
					spr_index = spr_idle;
					image_speed = anim_speed_idle;
					image_index = 0;
				} else if (spr_index != spr_death) {
					spr_index = spr_death;
					image_speed = anim_speed_hurt;
					image_index = 0;
				}
			
				target_fighter = noone;
				z_pos = 0;
				zsp = 0;
				melee_state = MELEE_STATES.NO_MELEE;
				performing_move = MON_PASSIVES.NOT_ATTACKING;
				melee_attacked = false;
				turns_left = 0;
				started_turn = false;
			}
		
			// Now, queue the next person's turn (or abort if the list is empty)
			_turn_taker = ds_queue_head(turn_order);
			current_turn_taker = _turn_taker;
		
			// Double-check that the new turn-taker's HP is not <= 0; Remove them and keep searching if it is
			if (_turn_taker.curr_hp <= 0)
				ds_queue_dequeue(turn_order);
		
			// Update the queue size, just in case we removed someone from the turn order list
			_queue_size = ds_queue_size(turn_order);
		}
	
		if (_queue_size <= 0) {
			current_turn_taker = noone;
			exit;
		}
	
		// Make sure that nobody else is taking their turn right now
		for (var _i = 0; _i < _flist_size; _i++) {
			var _this_fighter = fighter_list[| _i];
			if (instance_exists(_this_fighter)) {
				if (_this_fighter.started_turn && _this_fighter != _turn_taker) {
					_can_move = false;
				}
			}
		}
		
		if (_can_move && instance_exists(_turn_taker)) { // If this fighter is allowed to move AND this fighter we're checking exists,
			if (_turn_taker.turns_left > 0) { // Additionally, if that turntaker still has turns left,
				current_turn_taker = _turn_taker;	// That fighter may take its turn now.
			
				if (_turn_taker.performing_move == MON_PASSIVES.NOT_ATTACKING) { // If they're not already attacking, let them attack now.
					_turn_taker.started_turn = true;
					if (_turn_taker.passive_looping > -1) { // There are still passives to run for this [multi-hit iteration] within a turn. (Unless the player's multi-hit is >1, it will just go through all the passives once and their turn will end)
					
						// Figure out which passive we need to perform, then perform it. The [passive_looping] index will decrement every time a passive finishes, at the end of this code block
						var _this_passive = _turn_taker.passives_list[_turn_taker.passive_looping];
					
						while((_this_passive == MON_PASSIVES.MULTI_HIT || _this_passive == MON_PASSIVES.HASTY)
							&& _turn_taker.passive_looping > -1) {
							_turn_taker.passive_looping--;
						
							if (_turn_taker.passive_looping < 0)
								break;

							_this_passive = _turn_taker.passives_list[_turn_taker.passive_looping];
						}
					
						if (_turn_taker.passive_looping <= -1) {
							var _passives_size = array_length_1d(_turn_taker.passives_list);
							_turn_taker.passive_looping = _passives_size - 1;
							_turn_taker.turns_left--;
							exit;
						}
						//_list_of_passives += "\n - " + get_monster_passive_name(_this_passive);
						
						
						//var _str = "Object ID: " + string(_turn_taker.id) + ", Move: " + get_monster_passive_name(_this_passive);
						//show_debug_message(_str);
					
						// Depending on the passive behing performed, let the fighter know which move they're performing
						with (_turn_taker) {
							switch(_this_passive) {
								case MON_PASSIVES.NOT_ATTACKING:
									break;
								case MON_PASSIVES.DRAGO_RANGED:
									performing_move = _this_passive;
									break;
								default:
								case MON_PASSIVES.SLIME_MELEE:
								case MON_PASSIVES.PENKING_MELEE:
								case MON_PASSIVES.PIG_MELEE:
									performing_move = _this_passive;
									break;
							}
						}
					
						// The passive has been set. Look at the next passive on the list once this passive has finished performing
						_turn_taker.passive_looping--;
					} else {
						// We've successfully iterated through every single passive for this iteration. Reset the count, and decrement turns left.
						// If this fighter has [multi-hit] passives, it will go through their passive list [remaining multi-hit] times before [turns_left] is <= 0.
						var _passives_size = array_length_1d(_turn_taker.passives_list);
						_turn_taker.passive_looping = _passives_size - 1;
						_turn_taker.turns_left--;
					}
				}
			} else if (round(_turn_taker.x) == _turn_taker.x_off_to && round(_turn_taker.y) == _turn_taker.y_off_to) { // Check to make sure that the fighter has finished lerping to its target positioning (in this case, it's likely jumping back to its party position after a melee attack)
				// This fighter's turn has ended. (Wait for them to get back to their original spot) Set everyone's opacities back to 1.
				for (var _i = 0; _i < _flist_size; _i++) {
					var _this_fighter = fighter_list[| _i];
					if (!instance_exists(_this_fighter))
						ds_list_delete(fighter_list, _i);
					else {
						_this_fighter.img_alpha_to = 1;
					}
				}
			
				ds_queue_dequeue(turn_order);
			
				// Because this fighter's turn has ended, reset their attacking properties to wait for their next turn/battle/etc
				with(_turn_taker) {
					started_turn = false;
					action_gauge_curr = 0;
					action_queued = false;
					passive_looping = -1;
					performing_move = MON_PASSIVES.NOT_ATTACKING;
					melee_state = MELEE_STATES.NO_MELEE;
					melee_attacked = false;
					spr_index = spr_idle;
					mask_index = spr_index;
					image_index = 0;
					image_speed = anim_speed_idle;
				}

				// Look at who's at the front of the turn order queue. If they exist, it's now their turn.
				// Otherwise, reset and forget whose turn it is, because nobody should be fighting anymore (battle ended, or someone needs to re-fill their action gauge)
				var _head = ds_queue_head(turn_order);
				if (_head == undefined)
					current_turn_taker = noone;
				else {
					current_turn_taker = _head;
				}
			
				// Update the camera draw offset so it's back to 0
				BattleController.attack_cam_offset_x_to = 0;
			}
		} else {
			// It's nobody's turn right now. Clear the queue, just in case, and then forget whose turn it was previously.
			ds_queue_dequeue(turn_order);
			current_turn_taker = noone;
		}
	}



}
