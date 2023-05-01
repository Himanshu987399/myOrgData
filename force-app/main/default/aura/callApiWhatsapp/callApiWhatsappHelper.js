({
	updateQuoteAndQuoteLineItem : function(component,event,helper) {
        component.set("v.isLoading",true);
		var action = component.get("c.get_App_Token");
        //let recordId=component.get("v.recordId");
        //action.setParams({recordId:recordId});
        var isFetchingPrice = true; // Add this line to set the boolean variable to true
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.isLoading",false);
                $A.get("e.force:closeQuickAction").fire();
                $A.get('e.force:refreshView').fire();
            }
        });
        $A.enqueueAction(action);
	}
})