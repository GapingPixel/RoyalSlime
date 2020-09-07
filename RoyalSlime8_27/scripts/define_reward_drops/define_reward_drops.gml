/// @function define_reward_drops()
/// @description Defines all the different possible item drops in the game
function define_reward_drops() {

	enum REWARDS {
		NOTHING,
		DRAGO_WING_ONE,
		DUCK_BEAK_SIX,
		DRAGO_MATTER_THREE,
		MAX
	};

	rewards_index = ds_list_create();
	rewards_type = ds_list_create();
	rewards_quantity = ds_list_create();
	rewards_sprite_index = ds_list_create();

	rewards_index[| REWARDS.NOTHING] = LIST_MATERIALS.NOTHING;
	rewards_type[| REWARDS.NOTHING] = ITEM_TYPES.MATERIALS;
	rewards_quantity[| REWARDS.NOTHING] = noone;

	rewards_index[| REWARDS.DRAGO_WING_ONE] = LIST_MATERIALS.AZURE_WING;
	rewards_type[| REWARDS.DRAGO_WING_ONE] = ITEM_TYPES.MATERIALS;
	rewards_quantity[| REWARDS.DRAGO_WING_ONE] = 1;

	rewards_index[| REWARDS.DUCK_BEAK_SIX] = LIST_MATERIALS.BLAZING_FEATHER;
	rewards_type[| REWARDS.DUCK_BEAK_SIX] = ITEM_TYPES.MATERIALS;
	rewards_quantity[| REWARDS.DUCK_BEAK_SIX] = 6;

	rewards_index[| REWARDS.DRAGO_MATTER_THREE] = LIST_MATTER.GROWDENT_MATTER;
	rewards_type[| REWARDS.DRAGO_MATTER_THREE] = ITEM_TYPES.MATTER;
	rewards_quantity[| REWARDS.DRAGO_MATTER_THREE] = 3;


}
