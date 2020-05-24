({

	clickCreateItem : function(component, event, helper)
	{
		var		validItem;
		var		itemForm;
		var		newItem;

		itemForm = component.find('itemform');

		validItem = itemForm.reduce((validSoFar, inputCmp) =>
		{
			var		validity;

			inputCmp.showHelpMessageIfInvalid();
			validity = inputCmp.get('v.validity').valid;
			return validSoFar && validity;
		}, true);
		
		if (validItem)
		{
			newItem = component.get("v.newItem");
			console.log("Create item: " + JSON.stringify(newItem));
			helper.createItem(component, newItem);
		}
	},

})
