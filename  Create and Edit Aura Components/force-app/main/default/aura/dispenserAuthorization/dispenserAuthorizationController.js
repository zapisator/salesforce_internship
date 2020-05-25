({
	clickAuthorize : function(component, event, helper)
	{
		var		isValidUserInfo;

		isValidUserInfo = helper.validateUserInfo(component);
		console.log("isValidUsesrInfo: " + JSON.stringify(isValidUserInfo));
		if (isValidUserInfo)
		{
			helper.getUserInfo(component);
			helper.getBankInfo(component);
			helper.getTerminalInfo(component);
		}
	},


})
