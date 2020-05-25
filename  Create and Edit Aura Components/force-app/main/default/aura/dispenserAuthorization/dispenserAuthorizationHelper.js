({	

	validateUserInfo:		function(component)
	{
		var		isValidUserInfo;
		var		userInfoForm;

		userInfoForm = component.find('withdrawelform');
		isValidUserInfo = userInfoForm.reduce(this.reducer, true);
		return (isValidUserInfo);
	},

	reducer:				function (validSoFar, inputCmp)
	{
		var		validity;

		inputCmp.showHelpMessageIfInvalid();
		validity = inputCmp.get('v.validity').valid;
		return (validSoFar && validity);
	},

	getUserInfo:			function(component)
	{
		var		actionGetAccount;

		actionGetAccount = component.get("c.getAccount");
		this.configureAccountParams(component, actionGetAccount);
		actionGetAccount.setCallback(this, responseFunction);
		console.log("enqueueAction getUserInfo");
		$A.enqueueAction(actionGetAccount);

		/*
		** Auxiliar functions. 
		*/
		function responseFunction(response)
		{
			var		state;
			var		returnValue;

			state = response.getState();
			if (state === "SUCCESS")
			{
				returnValue = response.getReturnValue();
				if (returnValue)
				{
					component.set("v.withdrawel", returnValue);
					component.set("v.isAuthorized", true);
				}
				console.log("withdrawel returnValue: " + JSON.stringify(returnValue));
			}
			else
				console.log("getUserInfo failed with state: " + state);
		};
	},

	configureAccountParams:	function(component, actionGetAccount)
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
			PIN			: PIN,
		};
		console.log("account params: " + JSON.stringify(params));
		console.log("actionGetAccount (before): " + JSON.stringify(actionGetAccount));
		actionGetAccount.setParams(params);
		console.log("actionGetAccount (after): " + JSON.stringify(actionGetAccount));
	},

	getBankInfo:			function (component)
	{
		var		actionGetBank;
		var		that;

		actionGetBank = component.get("c.getBank");
		this.configureBankParams(component, actionGetBank);
		that = this;
		actionGetBank.setCallback(this, responseFunction);
		console.log("enqueueAction getBankInfo");
		$A.enqueueAction(actionGetBank);

		/*
		** Auxiliar functions. 
		*/
		function responseFunction(response, component)
		{
			var		state;
			var		returnValue;

			state = response.getState();
			if (state === "SUCCESS")
			{
				returnValue = response.getReturnValue();
				if (returnValue)
				{
					component.set("v.bankConfiguration", returnValue);
					console.log("bankConfiguration at component: " + JSON.stringify(component.get("v.bankConfiguration")));
					// that.getTerminalInfo(component);
				}
				console.log("bankConfiguration returnValue: " + JSON.stringify(returnValue));
				console.log("!!! bankConfiguration.ID at component: " + JSON.stringify(component.get("v.bankConfiguration.Id")));
			}
			else
				console.log("getBankInfo failed with state: " + state);
		};
	},

	configureBankParams:	function(component, actionGetBank)
	{
		var		bankName;
		var		params;

		bankName = component.get("v.bankConfiguration.Name");
		console.log("bankName: " + JSON.stringify(bankName));
		params =
		{
			bankName	: bankName,
		};
		console.log("bank params: " + JSON.stringify(params));
		console.log("actionGetAccount (before): " + JSON.stringify(actionGetBank));
		actionGetBank.setParams(params);
		console.log("actionGetAccount (after): " + JSON.stringify(actionGetBank));
	},

	getTerminalInfo:		function(component)
	{
		var		actionGetTerminal;

		actionGetTerminal = component.get("c.getTerminal");
		this.configureTerminalParams(component, actionGetTerminal);
		actionGetTerminal.setCallback(this, responseFunction);
		console.log("enqueueAction getTerminalInfo");
		$A.enqueueAction(actionGetTerminal);

		/*
		** Auxiliar functions. 
		*/
		function responseFunction(response)
		{
			var		state;
			var		returnValue;

			state = response.getState();
			if (state === "SUCCESS")
			{
				returnValue = response.getReturnValue();
				if (returnValue)
				{
					component.set("v.terminal", returnValue);
				}
				console.log("terminal returnValue: " + JSON.stringify(returnValue));
			}
			else
				console.log("actionGetTerminal failed with state: " + state);
		};
	},

	configureTerminalParams:	function(component, actionGetTerminal)
	{
		var		terminalBankId;
		var		params;

		// terminalBankId = component.get("v.bankConfiguration.Id");
		terminalBankId = 'a0H5I000002PimDUAS';
		console.log("terminalBankId: " + JSON.stringify(terminalBankId));
		params =
		{
			terminalBankId	: terminalBankId,
		}; 
		console.log("terminal params: " + JSON.stringify(params));
		console.log("actionGetTerminal (before): " + JSON.stringify(actionGetTerminal));
		actionGetTerminal.setParams(params);
		console.log("actionGetTerminal (after): " + JSON.stringify(actionGetTerminal));
	},
})
