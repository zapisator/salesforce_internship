({
	clickCreateItem : function(component, event, helper)
	{
		var		validItem;
		var		itemForm;
		var		newItem;
		var		items;

		itemForm = component.find('itemform');
		validItem = itemForm.reduce(helper.reducer, true);
		if (validItem)
		{
			newItem = component.get("v.newItem");
			items = component.get("v.items");
			items.push(newItem);
			component.set("v.items", items);
		}
	}
})
