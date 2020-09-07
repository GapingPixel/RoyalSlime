function delete_clickable_materials() {
	if (instance_exists(FusionHouse_ClickableIngredient)) {
		instance_destroy(FusionHouse_ClickableIngredient);
	}


}
