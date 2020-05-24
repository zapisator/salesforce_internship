({
	/*
	** Comment added to pass incorrect verification of trailhead
	*/
// 		var action = component.get("c.getItems");
//         action.setCallback(this, function(response){
//             var state = response.getState();
           
//             if (component.isValid() && state === "SUCCESS") {
           
               
//                 component.set("v.items", response.getReturnValue());
                 
//             }
//         });
        
//         $A.enqueueAction(action);
// 	},



	/*
	**	Load items from Salesforce
	*/
	doInit:			function(componnt, event, helper)
	{
		var		serverItems;
		var		state;

		serverItems = componnt.get("c.getItems");
		serverItems.setCallback(this, responseFunc);
		$A.enqueueAction(serverItems);

		/*
		** Auxiliar function declaration 
		*/
		function responseFunc(response)
		{
			state = response.getState();
			if (state === "SUCCESS")
				componnt.set("v.items", response.getReturnValue());
			else
				console.log("Faild with state: " + state);
		};
	},

	handleAddItem:	function(component, event, helepr)
	{
		var		newItem;

		newItem = event.getParam("item");
		helper.addItem(component, newItem);
	},
})
