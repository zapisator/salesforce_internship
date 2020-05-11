({
	packItem: function(component, event, helper)
	{
		var btnCliked;

		btnCliked = event.getSource();
		btnCliked.set("v.disabled", true);
		component.set("v.Packed__c", true);
	},
})
