/// @function get_monster_passive_name(passive_index)
/// @description For debugging purposes, this script returns the name of the input passive. (maybe useful later on in development? imo store these strings in a node w/other properties instead)
/// @param {real} passive_index The passive index to read
function get_monster_passive_name() {

	var _passive = argument[0];

	switch (_passive) {
		case MON_PASSIVES.SLIME_MELEE:
			return "Melee Attack (Slime)";
		case MON_PASSIVES.PENKING_MELEE:
			return "Melee Attack (Penking)";
		case MON_PASSIVES.PIG_MELEE:
			return "Melee Attack (Pig)";
		case MON_PASSIVES.DRAGO_RANGED:
			return "Ranged Attack (Drago)";
		case MON_PASSIVES.HIBERNATE:
			return "Hibernate";
		case MON_PASSIVES.HASTY:
			return "Hasty";
		case MON_PASSIVES.MULTI_HIT:
			return "Multi-Hit";
		default:
			return "Unknown";
	}


}
