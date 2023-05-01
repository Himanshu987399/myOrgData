({
	doInit : function(component, event, helper) {
		
        //initilization of Apex controller
     helper.callHelper(component, event, helper);
     helper.callhelper2(component, event, helper);  
	},
    handleSort: function(component,event ,helper){
        
         helper.handleSort(component, event,helper);
    },
    /*handleDOM:function(component,event,helper){
       var d = document.getElementsByClassName("snipitTable");
       var dom =  d[0].innerHTML
        console.log(d[0].innerHTML);
        
        var action = component.get("c.sendOTP");
        action.setParams({OTP:dom});
        
         $A.enqueueAction(action);
       
    }
    */
})