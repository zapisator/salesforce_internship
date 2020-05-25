({
	clickBalance	: function(component, event, helper)
	{
		component.set("v.isRrequestedBalance", true);
	},

	clickRemoveCard : function(component, event, helper)
	{
		component.set("v.isAuthorized", false);
		component.set("v.isRrequestedBalance", false);
	},

	clickWithdraw	: function(component, event, helper)
	{
		var		isValidUserInfo;
		var		withdrawelParams;

		withdrawelParams =
		{
			cashRequested			: 0,
			requestCurrency			: '',
			balance					: 0,
			maximum_loan			: 0,
			cashAtAtm				: 0,
			isEnoughATMMoney		: false,
			isEnoughAccountMoney	: false,
		};
		isValidUserInfo = helper.validateUserInfo(component);
		if (isValidUserInfo)
		{
			withdrawelParams = helper.configureParams(component, withdrawelParams);
			// if (withdrawelParams.isEnoughATMMoney)
			// 	helper.giveCash(component, withdrawelParams);
		}
	},
})
