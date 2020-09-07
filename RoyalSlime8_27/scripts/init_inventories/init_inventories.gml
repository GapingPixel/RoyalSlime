/// @function init_inventories()
/// @description Initializes the various inventories the player will use in the game
function init_inventories() {
	inventory_essence_matter = ds_grid_create(3, 0); // Type, Quantity, Item_ID
	ds_grid_clear(inventory_essence_matter, -1);

	inventory_materials = ds_grid_create(3, 0); // Type, Quantity, Item_ID
	ds_grid_clear(inventory_materials, -1);

	inventory_resources = ds_grid_create(3, 0); // Type, Quantity, Item_ID
	ds_grid_clear(inventory_resources, -1);


}
