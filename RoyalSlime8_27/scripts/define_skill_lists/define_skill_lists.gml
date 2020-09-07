/// @function define_skill_lists()
/// @description Defines the skills required to upgrade to each form in a given evolution chain.
function define_skill_lists() {

	enum SKILLS {
		FORM1,
		FORM2,
		FORM3,
		MAX
	};

	drago_form_reqs[SKILLS.FORM1] = [LIST_MATERIALS.AZURE_WING, 1];
	drago_form_reqs[SKILLS.FORM2] = [LIST_ESSENCES.DRACO, 1, LIST_MATERIALS.AZURE_WING, 1];
	drago_form_reqs[SKILLS.FORM3] = [LIST_ESSENCES.DRACO, 1, LIST_MATERIALS.AZURE_WING, 1, LIST_MATERIALS.FROG_LEG, 1];

	skill_req_lists[MONSTERS.E_DRACO] = [drago_form_reqs[SKILLS.FORM1], drago_form_reqs[SKILLS.FORM2], drago_form_reqs[SKILLS.FORM3]];


}
