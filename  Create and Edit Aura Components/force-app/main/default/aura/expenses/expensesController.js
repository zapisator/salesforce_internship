({

	handleCreateExpense: function(component, event, helper)
	{
		var			newExpense;

		newExpense = event.getParam("expense");
		helper.createExpense(component, newExpense);
	},

	handleUpdateExpense:	function(component, event, helper)
	{
		var			updatedExpense;
		
		updatedExpense = event.getParam("expense");
		helper.updateExpense(component, updatedExpense);
	},

	doInit: 				function(component, event, helper)
	{
		var			actionGetExpense;

		// console.log("Init actionGetExpense. Before actions.");
		actionGetExpense = component.get("c.getExpenses");
		// console.log("Got actionGetExpense: " + JSON.stringify(actionGetExpense));
		actionGetExpense.setCallback(this, function(response)
		{
			var		state;

			state = response.getState();
			if (state === "SUCCESS")
				component.set("v.expenses", response.getReturnValue());
			else
				console.log("Failed with state: " + state);
		});
		// console.log("Init actionGetExpense. Before enqueueing.");
		$A.enqueueAction(actionGetExpense);
		// console.log("Init actionGetExpense. Before actions.");

		/*
		** Auxiliar code.
		*/
		// function(response)
		// {
		// 	var		state;

		// 	state = response.getState();
		// 	if (state === "SUCCESS")
		// 		component.set("v.expenses", response.getReturnValue());
		// 	else
		// 		console.log("Failed with state: " + state);
		// };
	},

})

// function(response)
// 		{
// 			var			state;
// 			var			expenses;
			
// 			console.log("Response var: " + JSON.stringify(response));
// 			state = response.getState();
// 			if (state === "SUCCESS")
// 			{
// 				expenses = component.get("v.expenses");
// 				expenses.push(response.getReturnValue());
// 				component.set("v.expenses", expenses);
// 			}
// 			else
// 				console.log("Failed with state: " + state);
// 		}