function mon_class_to_color() {
	var _class = argument[0];

	switch(_class) {
		default:
		case MON_CLASSES.MAX:
		case MON_CLASSES.FIX_ME:
			return c_white;
		case MON_CLASSES.FIGHTER:
			return color_fix($e77487);
		case MON_CLASSES.DEFENDER:
			return color_fix($d69e98);
		case MON_CLASSES.CLERIC:
			return color_fix($8fc3db);
		case MON_CLASSES.MAGE:
			return color_fix($c8a3d5);
		case MON_CLASSES.RANGER:
			return color_fix($a6cfaa);
	}


}
