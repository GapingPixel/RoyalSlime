///@function set_reward_drop(the_drop_entity, the_reward)
///@arg the_drop_entity
///@arg the_reward
function set_reward_drop() {

	var _the_drop_obj = argument[0];
	var _the_reward = argument[1];

	with (_the_drop_obj) {
		reward = BattleController.rewards_index[| _the_reward];
		reward_type = BattleController.rewards_type[| _the_reward];
		reward_quantity = BattleController.rewards_quantity[| _the_reward];
	
		switch (reward_type) {
			case ITEM_TYPES.ESSENCES:
				sprite_index = Essences_Sheet;
				break;
			case ITEM_TYPES.MATERIALS:
				sprite_index = Materials_Sheet;
				break;
			case ITEM_TYPES.MATTER:
				sprite_index = Matter_Sheet;
				break;
			case ITEM_TYPES.RESOURCES:
				sprite_index = Essences_Sheet;
				break;
		}
	
		image_index = reward - 1;
	}


}
