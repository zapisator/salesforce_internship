({

	createExpense:		function(component, newExpense)
	{
		var		createEvent;
		var		params;
		
		createEvent = component.getEvent("createExpense");
		params =
		{
			"expense"	: newExpense
		};
		createEvent.setParams(params);
		createEvent.fire();
	},

	reducer:			function (validSoFar, inputCmp)
	{
		var		validity;
			// Displays error messages for invalid fields
		inputCmp.showHelpMessageIfInvalid();
		validity = inputCmp.get('v.validity').valid;
		return (validSoFar && validity);
	},

})
