function mon_type_to_string() {
	var _type = argument[0];

	switch(_type) {
		case MON_TYPES.MAX:
		default:
			return "Undefined";
		case MON_TYPES.TYPELESS:
			return "Typeless";
		case MON_TYPES.FIRE:
			return "Fire";
		case MON_TYPES.WATER:
			return "Water";
		case MON_TYPES.NATURE:
			return "Nature";
		case MON_TYPES.LIGHT:
			return "Light";
		case MON_TYPES.DARK:
			return "Dark";
		case MON_TYPES.UNKNOWN:
			return "Unknown";
	}


}
