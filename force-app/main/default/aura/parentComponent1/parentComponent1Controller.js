({
	doinit : function(component, event, helper) {
		component.set("v.ValueofName",'himanshu sharma');
        var action = component.get("c.getContact");
        action.setParams({Name:'yadav'});
        action.setCallback(this,function(response){
           var state = response.getState(); 
            if(state === "SUCCESS"){
                component.set("v.valueofobject",response.getReturnValue());
                console.log("value ---> "+JSON.stringify(component.get("v.valueofobject")));
            }
        });
        $A.enqueueAction(action);
	}
})