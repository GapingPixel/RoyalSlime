/// @function print_hotspot_type(hotspot_type)
/// @description Debug script to tell us (as a string) what kind of hotspot this is
/// @param {real} hotspot_type The HOTSPOT_TYPE enum we want to print
function print_hotspot_type() {

	switch(argument[0]) {
		case HOTSPOT_TYPES.HORDE:
			return "Horde";
		case HOTSPOT_TYPES.ITEM:
			return "Item";
		case HOTSPOT_TYPES.CUTSCENE:
			return "Cutscene";
		default:
			return "Undefined";
	}


}
