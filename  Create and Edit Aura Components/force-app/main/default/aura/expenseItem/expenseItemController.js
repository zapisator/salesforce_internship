({

	doInit : function(component, event, helper)
	{
		var mydate;
		
		mydate = component.get("v.expense.Date__c");
		if (mydate)
			component.set("v.formatdate", new Date(mydate));
	},

	clickReimbursed: function(component, event, helper)
	{
		var		expense;
		var		updateEvent;
		var		params;
		
		expense = component.get("v.expense");
		updateEvent = component.getEvent("updateExpense");
		params =
		{
			"expense"	: expense
		};
		updateEvent.setParams(params);
		updateEvent.fire();
	}
	
})