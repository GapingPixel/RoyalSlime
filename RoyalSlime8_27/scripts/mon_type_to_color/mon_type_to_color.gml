function mon_type_to_color() {
	var _type = argument[0];

	switch(_type) {
		case MON_TYPES.MAX:
		default:
			return c_white;
		case MON_TYPES.TYPELESS:
			return color_fix($a6cfaa);
		case MON_TYPES.FIRE:
			return color_fix($a6cfaa);
		case MON_TYPES.WATER:
			return color_fix($a6cfaa);
		case MON_TYPES.NATURE:
			return color_fix($a6cfaa);
		case MON_TYPES.LIGHT:
			return color_fix($a6cfaa);
		case MON_TYPES.DARK:
			return color_fix($a6cfaa);
		case MON_TYPES.UNKNOWN:
			return color_fix($a6cfaa);
	}


}
