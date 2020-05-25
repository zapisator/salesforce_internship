({

	validateUserInfo:		function(component)
	{
		var		isValidUserInfo;
		var		userInfoForm;

		userInfoForm = component.find('withdrawelform');
		isValidUserInfo = userInfoForm.reduce(this.reducer, true);
		return (isValidUserInfo);
	},

	reducer:				function(validSoFar, inputCmp)
	{
		var		validity;

		inputCmp.showHelpMessageIfInvalid();
		validity = inputCmp.get('v.validity').valid;
		return (validSoFar && validity);
	},

	configureParams:		function(component, withdrawelParams)
	{
		withdrawelParams.cashRequested = component.get('v.withdrawel.Withdraw__c');
		console.log("cashRequested: " + JSON.stringify(withdrawelParams.cashRequested));

		withdrawelParams.requestCurrency = component.get('v.withdrawel.Currency_type__c');
		console.log("requestCurrency: " + JSON.stringify(withdrawelParams.requestCurrency));

		withdrawelParams.balance = component.get('v.withdrawel.Balance__c');
		console.log("balance: " + JSON.stringify(withdrawelParams.balance));

		withdrawelParams.maximum_loan = component.get('v.withdrawel.maximum_loan_amount__c');
		console.log("maximum_loan: " + JSON.stringify(withdrawelParams.maximum_loan));

		withdrawelParams.cashAtAtm = component.get('v.terminal.ATM_'+ withdrawelParams.requestCurrency + '_cash__c');
		console.log("cashAtAtm: " + JSON.stringify(withdrawelParams.cashAtAtm));

		withdrawelParams.isEnoughATMMoney = withdrawelParams.cashRequested <= withdrawelParams.cashAtAtm;
		console.log("isEnoughMoney: " + JSON.stringify(withdrawelParams.isEnoughATMMoney));

		withdrawelParams.isEnoughAccountMoney = withdrawelParams.cashRequested
			<= (withdrawelParams.balance + withdrawelParams.maximum_loan);
		console.log("isEnoughAccountMoney: " + JSON.stringify(withdrawelParams.isEnoughAccountMoney));
		return (withdrawelParams);
	},

	// giveCash:				function(component, withdrawelParams)
	// {
	// 	var			actionUpdateAccount;
	// 	var			account;
	// 	var			params;
		
	// 	account = component.get("v.")
	// 	actionUpdateAccount = component.get("c.updateAccount");
	// 	params =
	// 	{
	// 		"Dispenser_account__c"	: expense
	// 	};
	// 	savedExpense.setParams(params);
	// 	if (callbackFunction)
	// 		savedExpense.setCallback(this, callbackFunction);
	// 	$A.enqueueAction(savedExpense);
	// },
/*
**
**
**
*/
	// 	createExpense:			function(component, expense)
	// {
	// 	this.saveUserSideExpense(component, expense, responseFunction);

	// 	function responseFunction(response)
	// 	{
	// 		var			state;
	// 		var			expenses;
			
	// 		state = response.getState();
	// 		if (state === "SUCCESS")
	// 		{
	// 			expenses = component.get("v.expenses");
	// 			expenses.push(response.getReturnValue());
	// 			component.set("v.expenses", expenses);
	// 		}
	// 		else
	// 			console.log("Failed with state: " + state);
	// 	};
	// },

	// saveUserSideExpense:	function(component, expense, callbackFunction)
	// {
	// 	var			savedExpense;
	// 	var			params;
		
	// 	savedExpense = component.get("c.saveExpense");
	// 	params =
	// 	{
	// 		"expense"	: expense
	// 	};
	// 	savedExpense.setParams(params);
	// 	if (callbackFunction)
	// 		savedExpense.setCallback(this, callbackFunction);
	// 	$A.enqueueAction(savedExpense);
	// },

})
