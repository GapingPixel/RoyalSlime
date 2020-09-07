function color_fix(argument0) {
	// Allows inputting of HTML color format; Returns GMS2's color format

	/// color_fix(color)
	return ((argument0 & $FF) << 16) | (argument0 & $FF00) | ((argument0 >> 16) & $FF);


}
