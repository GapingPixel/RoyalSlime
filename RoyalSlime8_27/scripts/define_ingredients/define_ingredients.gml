/// @function define_ingredients()
/// @description Creates the list of materials, and tables to read them from
function define_ingredients() {

	// The order that the ingredients listed is important, so that the graphics (Sprite [Essences_Sheet] : Sprite [Materials_Sheet] : Sprite [Matter_Sheet]) all line up perfectly with these tables
	// The order of the ingredients is also why this is separate from the monster nodes

	enum LIST_MATERIALS {
		NOTHING,
		YELLOW_GEL,
		SNAIL_SHELL,
		RED_SNAIL_SHELL,
		EARTHY_CLAW,
		LIVING_DIRT,
		MUSHCAP,
		SPORE,
		WEB,
		ORB_CARAPACE,
		TOXIC_FANG,
		SCALY_LOG,
		SNAKE_SCALE,
		VENOMOUS_FANG,
		STONE_DRILL,
		CLAY_RUNE,
		INSECT_WING,
		INSECT_STINGER,
		HONEY_CROWN,
		SNOUT,
		SEARED_FUR,
		MAGMA_FIN,
		MAGMA_SCALE,
		BLAZING_FEATHER,
		SEARING_BEAK,
		TEPID_TONGUE,
		FROG_LEG,
		AZURE_WING,
		DRAGO_CREST,
		STONE_GRAPPLER,
		FIRE_RUNE,
		ORGANIC_STONE,
		OBSIDIAN,
		LIVING_EMBER,
		LIVING_ASHES,
		GLACIAL_BEAK,
		EMPORER_CROWN,
		MAX
	};


	str_materials[LIST_MATERIALS.NOTHING] = "Nothing";
	str_materials[LIST_MATERIALS.YELLOW_GEL] = "Yellow Gel";
	str_materials[LIST_MATERIALS.SNAIL_SHELL] = "Snail Shell";
	str_materials[LIST_MATERIALS.RED_SNAIL_SHELL] = "Red Snail Shell";
	str_materials[LIST_MATERIALS.EARTHY_CLAW] = "Earthy Claw";
	str_materials[LIST_MATERIALS.LIVING_DIRT] = "Living Dirt";
	str_materials[LIST_MATERIALS.MUSHCAP] = "Mushcap";
	str_materials[LIST_MATERIALS.SPORE] = "Spore";
	str_materials[LIST_MATERIALS.WEB] = "Web";
	str_materials[LIST_MATERIALS.ORB_CARAPACE] = "Orb Carapace";
	str_materials[LIST_MATERIALS.TOXIC_FANG] = "Toxic Fang";
	str_materials[LIST_MATERIALS.SCALY_LOG] = "Scaly Log";
	str_materials[LIST_MATERIALS.SNAKE_SCALE] = "Snake Scale";
	str_materials[LIST_MATERIALS.VENOMOUS_FANG] = "Venemous Fang";
	str_materials[LIST_MATERIALS.STONE_DRILL] = "Stone Drill";
	str_materials[LIST_MATERIALS.CLAY_RUNE] = "Clay Rune";
	str_materials[LIST_MATERIALS.INSECT_WING] = "Insect Wing";
	str_materials[LIST_MATERIALS.INSECT_STINGER] = "Insect Stinger";
	str_materials[LIST_MATERIALS.HONEY_CROWN] = "Honey Crown";
	str_materials[LIST_MATERIALS.SNOUT] = "Snout";
	str_materials[LIST_MATERIALS.SEARED_FUR] = "Seared Fur";
	str_materials[LIST_MATERIALS.MAGMA_FIN] = "Magma Fin";
	str_materials[LIST_MATERIALS.MAGMA_SCALE] = "Magma Scale";
	str_materials[LIST_MATERIALS.BLAZING_FEATHER] = "Blazing Feather";
	str_materials[LIST_MATERIALS.SEARING_BEAK] = "Searing Beak";
	str_materials[LIST_MATERIALS.TEPID_TONGUE] = "Tepid Tongue";
	str_materials[LIST_MATERIALS.FROG_LEG] = "Frog Leg";
	str_materials[LIST_MATERIALS.AZURE_WING] = "Azure Wing";
	str_materials[LIST_MATERIALS.DRAGO_CREST] = "Drago Crest";
	str_materials[LIST_MATERIALS.STONE_GRAPPLER] = "Stone Grappler";
	str_materials[LIST_MATERIALS.FIRE_RUNE] = "Fire Rune";
	str_materials[LIST_MATERIALS.ORGANIC_STONE] = "Organic Stone";
	str_materials[LIST_MATERIALS.OBSIDIAN] = "Obsidian";
	str_materials[LIST_MATERIALS.LIVING_EMBER] = "Living Ember";
	str_materials[LIST_MATERIALS.LIVING_ASHES] = "Living Ashes";
	str_materials[LIST_MATERIALS.GLACIAL_BEAK] = "Glacial Beak";
	str_materials[LIST_MATERIALS.EMPORER_CROWN] = "Emporer Crown";


	enum LIST_MATTER {
		NOTHING,
		SNAIL_MATTER,
		SNAIL_MATTER_2,
		SNAIL_MATTER_3,
		GROWDENT_MATTER,
		SHROOM_MATTER,
		SHROOM_MATTER_2,
		WEAVER_MATTER,
		WEAVER_MATTER_2,
		DRAKAENA_MATTER,
		DRAKAENA_MATTER_2,
		KOMOBRA_MATTER,
		KOMOBRA_MATTER_2,
		PLACEHOLDER1,
		PLACEHOLDER2,
		PLACEHOLDER3,
		PLACEHOLDER4,
		PLACEHOLDER5,
		PLACEHOLDER6,
		PLACEHOLDER7,
		PLACEHOLDER8,
		PLACEHOLDER9,
		PLACEHOLDER10,
		PLACEHOLDER11,
		PLACEHOLDER12,
		PLACEHOLDER13,
		PLACEHOLDER14,
		PLACEHOLDER15,
		PLACEHOLDER16,
		PLACEHOLDER17,
		PLACEHOLDER18,
		PLACEHOLDER19,
		PLACEHOLDER20,
		PLACEHOLDER21,
		PLACEHOLDER22,
		PLACEHOLDER23,
		PLACEHOLDER24,
		PLACEHOLDER25,
		PLACEHOLDER26,
		PLACEHOLDER27,
		PLACEHOLDER28,
		PLACEHOLDER29,
		PLACEHOLDER30,
		PLACEHOLDER31,
		PLACEHOLDER32,
		PLACEHOLDER33,
		PLACEHOLDER34,
		PLACEHOLDER35,
		PLACEHOLDER36,
		PLACEHOLDER37,
		PLACEHOLDER38,
		PLACEHOLDER39,
		PLACEHOLDER40,
		PLACEHOLDER41,
		PLACEHOLDER42,
		PLACEHOLDER43,
		PLACEHOLDER44,
		PLACEHOLDER45,
		PLACEHOLDER46,
		PLACEHOLDER47,
		PLACEHOLDER48,
		PLACEHOLDER49,
		PLACEHOLDER50,
		PLACEHOLDER51,
		PLACEHOLDER52,
		PLACEHOLDER53,
		PLACEHOLDER54,
		PLACEHOLDER55,
		PLACEHOLDER56,
		PLACEHOLDER57,
		PLACEHOLDER58,
		PLACEHOLDER59,
		PLACEHOLDER60,
		PLACEHOLDER61,
		PLACEHOLDER62,
		PLACEHOLDER63,
		PLACEHOLDER64,
		PLACEHOLDER65,
		PLACEHOLDER66,
		PLACEHOLDER67,
		PLACEHOLDER68,
		MAX
	};

	str_matter[LIST_MATTER.NOTHING] = "Undefined";
	str_matter[LIST_MATTER.SNAIL_MATTER] = "Snail Matter";
	str_matter[LIST_MATTER.SNAIL_MATTER_2] = "Snail Matter";
	str_matter[LIST_MATTER.SNAIL_MATTER_3] = "Snail Matter";
	str_matter[LIST_MATTER.GROWDENT_MATTER] = "Growdent Matter";
	str_matter[LIST_MATTER.SHROOM_MATTER] = "Shroom Matter";
	str_matter[LIST_MATTER.SHROOM_MATTER_2] = "Shroom Matter";
	str_matter[LIST_MATTER.WEAVER_MATTER] = "Weaver Matter";
	str_matter[LIST_MATTER.WEAVER_MATTER_2] = "Weaver Matter";
	str_matter[LIST_MATTER.DRAKAENA_MATTER] = "Drakaena Matter";
	str_matter[LIST_MATTER.DRAKAENA_MATTER_2] = "Drakaena Matter";
	str_matter[LIST_MATTER.KOMOBRA_MATTER] = "Komobra Matter";
	str_matter[LIST_MATTER.KOMOBRA_MATTER_2] = "Komobra Matter";
	str_matter[LIST_MATTER.PLACEHOLDER1] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER2] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER3] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER4] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER5] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER6] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER7] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER8] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER9] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER10] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER11] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER12] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER13] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER14] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER15] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER16] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER17] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER18] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER19] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER20] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER21] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER22] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER23] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER24] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER25] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER26] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER27] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER28] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER29] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER30] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER31] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER32] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER33] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER34] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER35] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER36] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER37] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER38] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER39] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER40] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER41] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER42] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER43] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER44] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER45] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER46] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER47] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER48] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER49] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER50] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER51] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER52] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER53] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER54] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER55] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER56] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER57] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER58] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER59] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER60] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER61] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER62] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER63] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER64] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER65] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER66] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER67] = "Undefined";
	str_matter[LIST_MATTER.PLACEHOLDER68] = "Undefined";

	enum LIST_ESSENCES {
		NOTHING,
		SNAILESS,
		CARAPOD,
		ROBUSTROPOD,
		GROWDENT,
		SHROOMBY,
		SYCOPLANT,
		ORBETTE,
		DECWEAVER,
		SAGPON,
		DRAKAENA,
		KOMOBY,
		KOMOBRA,
		CLAYLING,
		RUNITE,
		HONEYBY,
		BUZZTINEL,
		PLACEHOLDER,
		PLACEHOLDER1,
		PLACEHOLDER2,
		PLACEHOLDER3,
		PLACEHOLDER4,
		PLACEHOLDER5,
		PLACEHOLDER6,
		PLACEHOLDER7,
		SOOTSWINE,
		HOGNITE,
		PLACEHOLDER8,
		MAGMORKA,
		VO_ZA,
		ZAA_ZA,
		TEMPOLE,
		EMBULL,
		DRACO,
		DRAGODON,
		MARBLING,
		BASITE,
		MINIREL,
		OBSIDIARD,
		BLAZEBORNE,
		PLACEHOLDER9,
		PENGLOO,
		PENKING,
		MAKOMUNCH,
		RAZORMAW,
		SKUTTLEBIT,
		CRAWNAUGHT,
		PLACEHOLDER10,
		PLACEHOLDER11,
		PLACEHOLDER12,
		PLACEHOLDER13,
		PLACEHOLDER14,
		PLACEHOLDER15,
		PLACEHOLDER16,
		PLACEHOLDER17,
		PLACEHOLDER18,
		PLACEHOLDER19,
		PLACEHOLDER20,
		PLACEHOLDER21,
		PLACEHOLDER22,
		PLACEHOLDER23,
		PLACEHOLDER24,
		PLACEHOLDER25,
		PLACEHOLDER26,
		PLACEHOLDER27,
		PLACEHOLDER28,
		PLACEHOLDER29,
		PLACEHOLDER30,
		PLACEHOLDER31,
		PLACEHOLDER32,
		PLACEHOLDER33,
		PLACEHOLDER34,
		PLACEHOLDER35,
		PLACEHOLDER36,
		PLACEHOLDER37,
		PLACEHOLDER38,
		PLACEHOLDER39,
		PLACEHOLDER40,
		PLACEHOLDER41,
		PLACEHOLDER42,
		PLACEHOLDER43,
		MAX
	};


	str_essences[LIST_ESSENCES.NOTHING] = "Nothing";
	str_essences[LIST_ESSENCES.SNAILESS] = "Snailess Essence";
	str_essences[LIST_ESSENCES.CARAPOD] = "Carapod Essence";
	str_essences[LIST_ESSENCES.ROBUSTROPOD] = "Robustopod Essence";
	str_essences[LIST_ESSENCES.GROWDENT] = "Growdent Essence";
	str_essences[LIST_ESSENCES.SHROOMBY] = "Shroomby Essence";
	str_essences[LIST_ESSENCES.SYCOPLANT] = "Sycoplant Essence";
	str_essences[LIST_ESSENCES.ORBETTE] = "Orbette Essence";
	str_essences[LIST_ESSENCES.DECWEAVER] = "Decweaver Essence";
	str_essences[LIST_ESSENCES.SAGPON] = "Sagpon Essence";
	str_essences[LIST_ESSENCES.DRAKAENA] = "Drakaena Essence";
	str_essences[LIST_ESSENCES.KOMOBY] = "Komoby Essence";
	str_essences[LIST_ESSENCES.KOMOBRA] = "Komobra Essence";
	str_essences[LIST_ESSENCES.CLAYLING] = "Clayling Essence";
	str_essences[LIST_ESSENCES.RUNITE] = "Runite Essence";
	str_essences[LIST_ESSENCES.HONEYBY] = "Honeyby Essence";
	str_essences[LIST_ESSENCES.BUZZTINEL] = "Buzztinel Essence";
	str_essences[LIST_ESSENCES.PLACEHOLDER] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER1] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER2] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER3] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER4] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER5] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER6] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER7] = "Undefined";
	str_essences[LIST_ESSENCES.SOOTSWINE] = "Sootswine Essence";
	str_essences[LIST_ESSENCES.HOGNITE] = "Hognite Essence";
	str_essences[LIST_ESSENCES.PLACEHOLDER8] = "Undefined";
	str_essences[LIST_ESSENCES.MAGMORKA] = "Magmorka Essence";
	str_essences[LIST_ESSENCES.VO_ZA] = "Vo'za Essence";
	str_essences[LIST_ESSENCES.ZAA_ZA] = "Zaa'za Essence";
	str_essences[LIST_ESSENCES.TEMPOLE] = "Tempole Essence";
	str_essences[LIST_ESSENCES.EMBULL] = "Embull Essence";
	str_essences[LIST_ESSENCES.DRACO] = "Draco Essence";
	str_essences[LIST_ESSENCES.DRAGODON] = "Dragodon Essence";
	str_essences[LIST_ESSENCES.MARBLING] = "Marbling Essence";
	str_essences[LIST_ESSENCES.BASITE] = "Basite Essence";
	str_essences[LIST_ESSENCES.MINIREL] = "Minirel Essence";
	str_essences[LIST_ESSENCES.OBSIDIARD] = "Obsidiard Essence";
	str_essences[LIST_ESSENCES.BLAZEBORNE] = "Blazeborne Essence";
	str_essences[LIST_ESSENCES.PLACEHOLDER9] = "Undefined";
	str_essences[LIST_ESSENCES.PENGLOO] = "Pengloo Essence";
	str_essences[LIST_ESSENCES.PENKING] = "Penking Essence";
	str_essences[LIST_ESSENCES.MAKOMUNCH] = "Makomunch Essence";
	str_essences[LIST_ESSENCES.RAZORMAW] = "Razormaw Essence";
	str_essences[LIST_ESSENCES.SKUTTLEBIT] = "Skuttlebit Essence";
	str_essences[LIST_ESSENCES.CRAWNAUGHT] = "Crawnaught Essence";
	str_essences[LIST_ESSENCES.PLACEHOLDER10] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER11] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER12] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER13] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER14] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER15] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER16] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER17] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER18] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER19] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER20] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER21] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER22] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER23] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER24] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER25] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER26] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER27] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER28] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER29] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER30] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER31] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER32] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER33] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER34] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER35] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER36] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER37] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER38] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER39] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER40] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER41] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER42] = "Undefined";
	str_essences[LIST_ESSENCES.PLACEHOLDER43] = "Undefined";


	enum LIST_RESOURCES {
		NOTHING,
		MAX
	};

	str_resources[LIST_RESOURCES.NOTHING] = "Nothing";



}
