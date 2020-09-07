/// @description Destroy on animation end for certain effects
switch (effect_type) {
	default:
		break;
	case BATTLE_EFFECTS.DRAGO_FIREBALL_EXPLOSION:
		stop_attacking(parent_id);
		instance_destroy();
		break;
}