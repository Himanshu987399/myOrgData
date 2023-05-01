({
	doInit : function(component, event, helper) {
		
        //initilization of Apex controller
     helper.callHelper(component, event, helper);
	},
    handleSort: function(component,event ,helper){
        
         helper.handleSort(component, event,helper);
    }
})