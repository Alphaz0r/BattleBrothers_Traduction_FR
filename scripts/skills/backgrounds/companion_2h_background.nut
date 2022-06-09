this.companion_2h_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.companion";
		this.m.Name = "Compagnon";
		this.m.Icon = "ui/traits/trait_icon_32.png";
		this.m.HiringCost = 0;
		this.m.DailyCost = 14;
		this.m.DailyCostMult = 1.0;
		this.m.Excluded = [
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.paranoid",
			"trait.night_blind",
			"trait.ailing",
			"trait.impatient",
			"trait.asthmatic",
			"trait.greedy",
			"trait.clubfooted",
			"trait.drunkard",
			"trait.disloyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.dexterous"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.GoodEnding = "Du tout début jusqu\'à votre retraite, %name% était avec vous, quittant la compagnie peu de temps après votre départ. Mais il n\'en avait pas encore fini avec la vie de combattant et a commencé à se battre pour une autre compagnie - la sienne. Ayant tant appris sous votre direction, il vous rend aussi fier qu\'un fils puisse le faire. Ironically, il déteste l\'idée que vous soyez une figure paternelle pour lui, et vous lui dites toujours que vous n\'aurez jamais engendré un fils aussi laid pour commencer. Vous restez en contact jusqu\'à ce. jour.";
		this.m.BadEnding = "Avec vous depuis le début, %name% a été aussi loyal que talentueux. Il est resté dans la compagnie pendant un certain temps avant de la quitter pour suivre sa propre voix. L\'autre jour, vous avez reçu une lettre du mercenaire indiquant qu\'il avait créé sa propre compagnie et qu\'il avait besoin d\'aide. Malheureusement, le message était daté d\'il y a presque un an. Lorsque vous avez enquêté sur l\'existence de sa compagnie, vous avez appris qu\'elle avait été complètement anéantie lors d\'une bataille entre nobles.";
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsUntalented = true;
		this.m.IsCombatBackground = true;
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
			}
		];
	}

	function onBuildDescription()
	{
		return "Inquiet et parfois suicidaire, il n\'est pas surprenant que %name% plonge souvent dans la bataille avec rien de plus qu\'un gros couteau à deux mains. {Vêtu de ses intentions meurtrières, vous l\'avez vu une fois couper un homme en deux, de haut en bas. | On dit qu\'une fois il a coupé un orc guerrier en deux, laissant le tronc de ses jambes encore debout. | L\'homme est connu pour ignorer la fragilité de sa propre mortalité juste pour mettre fin à la vie d\'un autre. | Il adore être au cœur de la bataille où il peut brandir ses armes sans se soucier de la sécurité ou de la précision. | On raconte qu\'il a gagné un tournoi de joute, mais qu\'il a dû s\'enfuir après avoir couché avec la femme d\'un noble qui l\'observait. | Cet homme n\'est pas un meurtrier, mais il en aurait fait un bon. | Il semble parfois impossible de l\'arrêter, mais vous êtes heureux de l\'avoir à vos côtés. | Dans un accès de rage sanguinaire, il a empalé deux gobelins sur une seule pique. | Une brute forte, tu as vu une fois %name% tuer quelqu\'un juste sur son backswing.} Il utilise n\'importe quelle arme que vous lui donnez, mais %name% a une prédilection pour celles qui peuvent ruiner le corps d\'un homme.";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		_vars.push([
			"1h",
			brothers.len() >= 1 ? brothers[0].getName() : ""
		]);
		_vars.push([
			"2h",
			brothers.len() >= 2 ? brothers[1].getName() : ""
		]);
		_vars.push([
			"ranged",
			brothers.len() >= 3 ? brothers[2].getName() : ""
		]);
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				5
			],
			Bravery = [
				10,
				5
			],
			Stamina = [
				5,
				5
			],
			MeleeSkill = [
				10,
				5
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				2,
				0
			],
			RangedDefense = [
				2,
				0
			],
			Initiative = [
				-5,
				0
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		if (this.Math.rand(0, 3) == 3)
		{
			local actor = this.getContainer().getActor();
			actor.setTitle(this.Const.Strings.SellswordTitles[this.Math.rand(0, this.Const.Strings.SellswordTitles.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 1;
		talents[this.Const.Attributes.Bravery] = 1;
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}
	}

});

