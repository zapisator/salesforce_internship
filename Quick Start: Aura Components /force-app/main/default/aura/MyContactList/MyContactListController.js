({
	myAction : function(component, event, helper)
	{
		var		action;
		
		component.set("v.Columns",
			[
			    {label:"First Name",	fieldName:"FirstName",	type:"text"},
			    {label:"Last Name",		fieldName:"LastName",	type:"text"},
			    {label:"Phone",			fieldName:"Phone",		type:"phone"}
			]
		);

		action = component.get("c.getContacts");
		action.setParams
		({
		    recordId: component.get("v.recordId")
		});
		action.setCallback(this,
			function(data)
			{
			    component.set("v.Contacts", data.getReturnValue());
			}
		);
		$A.enqueueAction(action);
    }
})
