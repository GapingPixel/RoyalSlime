function mon_class_to_string() {
	var _classes = argument[0];

	switch(_classes) {
		case MON_CLASSES.FIX_ME:
		case MON_CLASSES.MAX:
		default:
			return "Undefined";
		case MON_CLASSES.CLERIC:
			return "Cleric";
		case MON_CLASSES.DEFENDER:
			return "Defender";
		case MON_CLASSES.FIGHTER:
			return "Fighter";
		case MON_CLASSES.MAGE:
			return "Mage";
		case MON_CLASSES.RANGER:
			return "Ranger";
	}


}
