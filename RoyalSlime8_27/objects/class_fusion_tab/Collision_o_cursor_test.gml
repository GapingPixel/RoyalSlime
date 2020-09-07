/// @description Insert description here
// You can write your code in this editor
if mouse_check_button(mb_left) {
	class_fusion_tab.visible = false;
	
	with (o_fusion_window_materials) {
		instance_destroy();
	}
	with (o_fusion_window_mater) {
		instance_destroy();
	}
	with (o_fusion_window_essense) {
		instance_destroy();
	}
	
	visible = true;
	
	if o_fusion_tab_1.visible {
		instance_create_depth(166,70,depth,o_fusion_window_materials);
	} else if o_fusion_tab_2.visible {
		instance_create_depth(166,70,depth,o_fusion_window_essense);
	} else if o_fusion_tab_3.visible {
		instance_create_depth(166,70,depth,o_fusion_window_mater);
	}
}