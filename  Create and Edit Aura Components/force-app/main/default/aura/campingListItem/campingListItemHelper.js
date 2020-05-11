({
    reducer:	function (validSoFar, inputCmp)
	{
		var		validity;

		// Displays error messages for invalid fields
		inputCmp.showHelpMessageIfInvalid();
		validity = inputCmp.get('v.validity').valid;
		return validSoFar && validity;
	},
})
