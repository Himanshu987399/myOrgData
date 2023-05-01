({
    doinit : function(component, event, helper) {
        //call apex class
        var status = component.get("c.check");
        
        //check status of apex class
        status.setCallback(this,function(val){
            var stage = val.getState();
            if(stage=='SUCCESS'){
                component.set("v.contactlist",val.getReturnValue());
                
            }
            
        });
        $A.enqueueAction(status);
    },
    handlerinsert: function(component,event,helper){
        var status1 = component.get("c.insertaccount");
        status1.setParams({name:component.get("v.namecheck")})
        status1.setCallback(this,function(val){
            var stage = val.getState();
            if(stage=='SUCCESS'){
               alert("Successfully insert");
            }
            
        });
        $A.enqueueAction(status1);
    }
    
    
})