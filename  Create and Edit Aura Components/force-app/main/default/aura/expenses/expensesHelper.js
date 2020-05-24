({

	createExpense:			function(component, expense)
	{
		this.saveUserSideExpense(component, expense, responseFunction);

		function responseFunction(response)
		{
			var			state;
			var			expenses;
			
			state = response.getState();
			if (state === "SUCCESS")
			{
				expenses = component.get("v.expenses");
				expenses.push(response.getReturnValue());
				component.set("v.expenses", expenses);
			}
			else
				console.log("Failed with state: " + state);
		};
	},

	updateExpense:			function(component, expense)
	{
		this.saveUserSideExpense(component, expense);
	},

	saveUserSideExpense:	function(component, expense, callbackFunction)
	{
		var			savedExpense;
		var			params;
		
		savedExpense = component.get("c.saveExpense");
		params =
		{
			"expense"	: expense
		};
		savedExpense.setParams(params);
		if (callbackFunction)
			savedExpense.setCallback(this, callbackFunction);
		$A.enqueueAction(savedExpense);
	},

	// updateViewExpenses:		function(component, response)
	// {
	// 	var			state;
	// 	var			expenses;
		
	// 	state = response.getState();
	// 	if (state === "SUCCESS")
	// 	{
	// 		expenses = component.get("v.expenses");
	// 		expenses.push(response.getReturnValue());
	// 		component.set("v.expenses", expenses);
	// 	}
	// 	else
	// 		console.log("Failed with state: " + state);
	// },

	initViewExpenses:		function(response)
	{
		var		state;

		state = response.getState();
		if (state === "SUCCESS")
			component.set("v.expenses", response.getReturnValue());
		else
			console.log("Failed with state: " + state);
	},

})
