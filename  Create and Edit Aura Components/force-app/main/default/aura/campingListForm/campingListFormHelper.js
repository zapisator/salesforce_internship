({

	createItem:	function(component, item)
	{
		var		savedItem;
		var		params;


		savedItem = component.get("c.saveItem");
		params =
		{
			"item"	: item
		};
		savedItem.setParams(params);
		savedItem.setCallback(this, responseFunction);
		$A.enqueueAction(savedItem);

		/*
		** Auxiliar functions
		*/
		function responseFunction(response)
		{
			var		state;
			var		items;

			state = response.getState();
			if (state === "SUCCESS")
			{
				items = component.get("v.items");
				console.log("Items before 'create': " + JSON.stringify(items));
				items.push(response.getReturnValue());
				component.set("v.items", items);
				component.set("v.newItem",
				{ 
					'sobjectType'	: 'Camping_Item__c',
					'Name'			: '',
					'Quantity__c'	: 0,
					'Price__c'		: 0.00,
					'Packed__c'		: false,
				});
				console.log("Items after 'create': " + JSON.stringify(items));
			}
		}
	},

})
