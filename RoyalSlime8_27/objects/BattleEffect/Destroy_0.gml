/// @description Reset the parent fighter's melee_attacked flag
if (parent_id != noone) {
	if (parent_id.object_index != ParentPlayer &&
		parent_id.object_index != ParentEnemy) {
		with (parent_id) {
			melee_attacked = false;
		}
	}
}