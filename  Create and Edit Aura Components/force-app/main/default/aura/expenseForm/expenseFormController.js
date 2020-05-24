({

	clickCreate:			function(component, event, helper)
	{
		var		validExpense;
		var		expenseForm;
		var		newExpense;
		
		expenseForm = component.find('expenseform');
		validExpense = expenseForm.reduce(helper.reducer, true);
		/*
		** If we pass error checking, do some real work
		*/
		if (validExpense)
		{
			/*
			** Create the new expense
			*/
			newExpense = component.get("v.newExpense");
			console.log("Create expense: " + JSON.stringify(newExpense));
			helper.createExpense(component, newExpense);
		}
	},

	// handleUpdateExpense: function(component, event, helper)
	// {
	// 	var		updatedExpense;
		
	// 	updatedExpense = event.getParam("expense");
	// 	helper.updateExpense(component, updatedExpense);
	// },

	// handleCreateExpense:	function(component, event, helper)
	// {
	// 	var		newExpense;
		
	// 	newExpense = event.getParam("expense");
	// 	helper.createExpense(component, newExpense);
	// },

})
