/// @function calculate_damage(attacker_id, opponent_id, attack_type)
/// @description Calculate and return the amount of damage dealt to a given player or party
/// @param {real} attacker_id The object id of the attacking fighter
/// @param {real} opponent_id The object id of the target fighter we're attacking
/// @param {real} attack_type The kind of attack this is (Strength, Magic)
function calculate_damage() {

	var _atker = argument[0];
	var _targ = argument[1];
	var _attack_type = argument[2];

	var _output_damage = 0;

	// Branch output damage calculation based on what the attack type is
	switch(_attack_type) {
		default:
		case ATTACK_TYPES.STRENGTH:
			_output_damage = (floor(_atker.stat_base[MON_STATS.STR] + _atker.stat_class_bonus[MON_STATS.STR] + _atker.stat_rarity_bonus[MON_STATS.STR]) * 0.5) - (floor(_targ.stat_base[MON_STATS.DEF] + _targ.stat_class_bonus[MON_STATS.DEF] + _targ.stat_rarity_bonus[MON_STATS.DEF]) * 0.1);
			break;
		case ATTACK_TYPES.MAGIC:
			_output_damage = (floor(_atker.stat_base[MON_STATS.MAG] + _atker.stat_class_bonus[MON_STATS.MAG] + _atker.stat_rarity_bonus[MON_STATS.MAG]) * 0.5) - (floor(_targ.stat_base[MON_STATS.MDEF] + _targ.stat_class_bonus[MON_STATS.MDEF] + _targ.stat_rarity_bonus[MON_STATS.MDEF]) * 0.1);
			break;
		case ATTACK_TYPES.RANGED:
			_output_damage = (floor(_atker.stat_base[MON_STATS.DEX] + _atker.stat_class_bonus[MON_STATS.DEX] + _atker.stat_rarity_bonus[MON_STATS.DEX]) * 0.5) - (floor(_targ.stat_base[MON_STATS.DEF] + _targ.stat_class_bonus[MON_STATS.DEF] + _targ.stat_rarity_bonus[MON_STATS.DEF]) * 0.1);
			break;
	}


	// Calculate the percentage probability that a monster's attack will occasionally miss its target (can be an ally, can be an enemy. depends on the context this script ran)

	var _dodge_chance = (floor(_targ.stat_base[MON_STATS.EVA] +
						_targ.stat_class_bonus[MON_STATS.EVA] +
						_targ.stat_rarity_bonus[MON_STATS.EVA])
					
						-
					
						floor(round(_atker.stat_base[MON_STATS.DEX] * 0.1) +
						round(_atker.stat_class_bonus[MON_STATS.DEX] * 0.1) +
						round(_atker.stat_rarity_bonus[MON_STATS.DEX] * 0.1))
					
						);

	// Roll a dice [pick a rand num from 1-100]
	var _dodge_dice_roll = irandom(100);
	var _dodged_attack = false; // Initialize a flag to determine if we dodged or not

	if (_dodge_dice_roll <= _dodge_chance) { // Is the dice roll <= the dodge probability value?
		_dodged_attack = true; // If so, then the dodge was successful
	}

	if (_dodged_attack) {
		// Deal 0 damage if we successfully dodged the attack
		_output_damage = 0;
	} else {
		// We didn't dodge the attack. Calculate actual damage here
	
		// Consider the class types of the attacker and its target; Multiply based on the class damage table's output (refer to Dan's GDocs sheet for a better visual of how this table is structured)
		var _type_multiplier = BattleController.types_multiplication_table[# _atker.stat_class, _targ.stat_class];
		_output_damage *= _type_multiplier;
	
		// Always round damage values up to the nearest whole number
		_output_damage = ceil(_output_damage);
		
		// Make sure we're not accidentally healing the fighter; Always hurt 1 HP minimum
		if (_output_damage <= 0) {
			_output_damage = 1;
		}
	}

	// Output the negative damage as a positive (absolute) value
	return abs(_output_damage);


}
