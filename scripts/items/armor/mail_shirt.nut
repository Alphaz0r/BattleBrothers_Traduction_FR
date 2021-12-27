this.mail_shirt <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.ID = "armor.body.mail_shirt";
		this.m.Name = "Chemise de mailles";
		this.m.Description = "Une chemise de maille avec des protège-épaules offrant une excellente protection contre la plupart des armes.";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 27;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 650;
		this.m.Condition = 130;
		this.m.ConditionMax = 130;
		this.m.StaminaModifier = -14;
	}

});

