({
	validateUserInfo:	function(component)
	{
		var		isValidUserInfo;
		var		userInfoForm;

		userInfoForm = component.find('withdrawelform');
		isValidUserInfo = userInfoForm.reduce(this.reducer, true);
		return (isValidUserInfo);
	},

	getUserInfo:		function(component)
	{
		var		actionGetAccount;

		actionGetAccount = component.get("c.getAccount");
		this.configureParams(component, actionGetAccount);
		actionGetAccount.setCallback(this, responseFunction);
		console.log("enqueueAction");
		$A.enqueueAction(actionGetAccount);
		/*
		** Auxiliar functions. 
		*/
		function responseFunction(response)
		{
			var		state;
			var		returnValue;

			console.log("response: " + response);
			console.log("response == actionGetAccount: " + (response == actionGetAccount));
			console.log("response === actionGetAccount: " + (response === actionGetAccount));
			console.log("typeof(response): " + typeof(response));
			console.log("typeof(actionGetAccount): " + typeof(actionGetAccount));
			console.log("state: " + state);
			state = response.getState();
			if (state === "SUCCESS")
			{
				returnValue = response.getReturnValue();
				if (returnValue)
				{
					component.set("v.withdrawel", returnValue);
					component.set("v.isAuthorized", true);
				}
				console.log("returnValue: " + JSON.stringify(returnValue));
			}
			else
				console.log("Failed with state: " + state);
			console.log("response == actionGetAccount: " + (response == actionGetAccount));
			console.log("response === actionGetAccount: " + (response === actionGetAccount));
		};
	},

	configureParams:	function(component, actionGetAccount)
	{
		var		cardNumber;
		var		PIN;
		var		params;

		cardNumber = component.get("v.withdrawel.Card_number__c");
		console.log("cardNumber: " + JSON.stringify(cardNumber));
		PIN = component.get("v.withdrawel.PIN__c");
		console.log("PIN: " + JSON.stringify(PIN));
		params =
		{
			cardNumber	: cardNumber,
			PIN			: PIN
		};
		console.log("params: " + JSON.stringify(params));
		console.log("actionGetAccount (before): " + JSON.stringify(actionGetAccount));
		actionGetAccount.setParams(params);
		console.log("actionGetAccount (after): " + JSON.stringify(actionGetAccount));
	},

	reducer:			function (validSoFar, inputCmp)
	{
		var		validity;

		inputCmp.showHelpMessageIfInvalid();
		validity = inputCmp.get('v.validity').valid;
		return (validSoFar && validity);
	},

})
