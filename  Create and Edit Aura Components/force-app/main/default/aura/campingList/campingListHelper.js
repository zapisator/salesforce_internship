({
	addItem:			function(component, item)
	{
		var		savedItem;
		var		params;

		savedItem = component.get("v.saveItem");
		params =
		{
			"item"	: item
		};
		savedItem.setParams(params);
		savedItem.setCallback(this,
			response => this.updateViewItems(component, response));
		$A.enqueueAction(savedItem);
	},

	updateViewItems:		function(component, response)
	{
		var			state;
		var			items;

		state = response.getState();
		if (state === "SUCCESS")
		{
			items = component.get("v.items");
			items.push(response.getReturnValue());
			component.set("v.items", items);
		}
		else
			console.log("Failed with state: " + state);
	},

})
