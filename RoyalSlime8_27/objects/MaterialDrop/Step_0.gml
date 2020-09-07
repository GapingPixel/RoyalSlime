/// @description Material drop logic
if (zsp < grav_cap)
	zsp += 0.29;
else
	zsp = grav_cap;

if (z_pos + zsp >= 0) {
	zsp = 0;
	z_pos = 0;
	vsp = 0;
	hsp = 0;
} else {
	z_pos += zsp;

	hsp = (hsp + h_accel) * h_fric;
}
x += hsp;
y += vsp;


// Destroy this material drop if the slimes have progressed "_trigger_percentage" into the screen this material drop spawned on
var _rel_room_percentage = (BattleController.slime_dungeon_progression / BattleController.bkg_room_width) % 1;
var _trigger_percentage = 0.45;
if (_rel_room_percentage > _trigger_percentage) {

	// Spawn the drop material text to display
	var _text = instance_create_depth(x, y, 5000, BattleEffect);
	_text.img_xoff = (_rel_room_percentage * BattleController.bkg_room_width) - 68;
	_text.effect_type = BATTLE_EFFECTS.TEXT;
	_text.text_y_speed = -0.12;
	_text.font_color = color_fix($8fc3db);
	
	var _plural = "";
	if (reward_quantity > 1)
		_plural = "s";
	_text.text = "+" + string(reward_quantity) + " " + reward_name + _plural;
	_text.time_max = 40;
	_text.time_alive = _text.time_max * 2 + (_text.time_max * (1/3));
	_text.alarm[0] = _text.time_alive;
	_text.image_index = 0;
	_text.image_speed = 0;
	
	// Now, actually add the item to the HUD's inventory (if it exists)
	
	if (reward_type >= 0) { // The reward is greater than -1
		var _ds = noone;
		
		// First, figure out what type of item we're dealing with, and make sure we refer to the correct index table
		var _is_matter = false;
		var _is_essence = false;
		
		
		switch(reward_type) {
			case ITEM_TYPES.MATTER:
				var _item_index = LIST_ESSENCES.MAX + reward;
				_is_matter = true;
			case ITEM_TYPES.ESSENCES:
				if (!_is_matter) {
					_is_essence = true;
					show_debug_message("is essence")
					_item_index = reward;
				}
				
				_ds = HUD.inventory_essence_matter;
				
				// First, check if the item already exists in the inventory.
				var _size = ds_grid_height(_ds);
				var _inventory_slot = -1;
				var _item_exists = false;
				for (var _i = 0; _i < _size; _i++) {
					_inventory_slot = _i;
					
					if (_ds[# 2, _i] == _item_index) {
						_item_exists = true;
						break;
					}
				}
				
				if (_item_exists) { // The item had already been previously defined. Add to the number here.
					_ds[# 0, _inventory_slot] = reward_type;
					_ds[# 1, _inventory_slot] = _ds[# 1, _inventory_slot] + reward_quantity;
					_ds[# 2, _inventory_slot] = _item_index;
				} else {
					// The item was never defined in the inventory. Add it as a new entry, at the very bottom
					var _grid_width = ds_grid_width(_ds);
					var _grid_height = ds_grid_height(_ds);
					ds_grid_resize(_ds, _grid_width, _grid_height + 1);
					_ds[# 0, _grid_height] = reward_type;
					_ds[# 1, _grid_height] = reward_quantity;
					_ds[# 2, _grid_height] = _item_index;
				}
				
				// Let the console window say how many of [item_type] was added to the inventory
				if (_is_matter) {
					show_debug_message("Matter added to inventory: " + reward_name + " x" + string(reward_quantity));
				} else {
					show_debug_message("Essence added to inventory: " + reward_name + " x" + string(reward_quantity));
				}
				break;
			case ITEM_TYPES.MATERIALS:
				_ds = HUD.inventory_materials;
				var _item_index = reward;
				// First, check if the item already exists in the inventory.
				var _size = ds_grid_height(_ds);
				var _inventory_slot = -1;
				var _item_exists = false;
				for (var _i = 0; _i < _size; _i++) {
					_inventory_slot = _i;
					
					if (_ds[# 2, _i] == _item_index) {
						_item_exists = true;
						break;
					}
				}
				
				if (_item_exists) { // The item had already been previously defined. Add to the number here.
					_ds[# 0, _inventory_slot] = reward_type;
					_ds[# 1, _inventory_slot] = _ds[# 1, _inventory_slot] + reward_quantity;
					_ds[# 2, _inventory_slot] = _item_index;
				} else {
					// The item was never defined in the inventory. Add it as a new entry, at the very bottom
					var _grid_width = ds_grid_width(_ds);
					var _grid_height = ds_grid_height(_ds);
					ds_grid_resize(_ds, _grid_width, _grid_height + 1);
					_ds[# 0, _grid_height] = reward_type;
					_ds[# 1, _grid_height] = reward_quantity;
					_ds[# 2, _grid_height] = _item_index;
				}
				show_debug_message("Material added to inventory: " + reward_name + " x" + string(reward_quantity));
				break;
			case ITEM_TYPES.RESOURCES:
				_ds = HUD.inventory_resources;
				var _item_index = reward;
				// First, check if the item already exists in the inventory.
				var _size = ds_grid_height(_ds);
				var _inventory_slot = -1;
				var _item_exists = false;
				for (var _i = 0; _i < _size; _i++) {
					_inventory_slot = _i;
					
					if (_ds[# 2, _i] == _item_index) {
						_item_exists = true;
						break;
					}
				}
				
				if (_item_exists) { // The item had already been previously defined. Add to the number here.
					_ds[# 0, _inventory_slot] = reward_type;
					_ds[# 1, _inventory_slot] = _ds[# 1, _inventory_slot] + reward_quantity;
					_ds[# 2, _inventory_slot] = _item_index;
				} else {
					// The item was never defined in the inventory. Add it as a new entry, at the very bottom
					var _grid_width = ds_grid_width(_ds);
					var _grid_height = ds_grid_height(_ds);
					ds_grid_resize(_ds, _grid_width, _grid_height + 1);
					_ds[# 0, _grid_height] = reward_type;
					_ds[# 1, _grid_height] = reward_quantity;
					_ds[# 2, _grid_height] = _item_index;
				}
				show_debug_message("Resource added to inventory: " + reward_name + " x" + string(reward_quantity));
				break;
		}
	}
	instance_destroy();
}