this.insecure_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.insecure";
		this.m.Name = "Anxieux";
		this.m.Icon = "ui/traits/trait_icon_03.png";
		this.m.Description = "Je peux pas y arriver ! Ce personnage aurait besoin d\'un peu plus de confiance en lui.";
		this.m.Excluded = [
			"trait.fearless",
			"trait.brave",
			"trait.optimist",
			"trait.irrational",
			"trait.determined",
			"trait.sure_footing",
			"trait.cocky",
			"trait.brute",
			"trait.bloodthirsty"
		];
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "N\'aura jamais un moral \'Confident\'"
			}
		];
	}

});

