({
    doInit : function(component, event, helper) {
        var action = component.get("c.check");
        
        action.setCallback(this,function(val){
            var stage = val.getState();
            if(stage=='SUCCESS'){
                console.log(val.getReturnValue())
                component.set("v.acclist",val.getReturnValue());
                
            }
        })
        $A.enqueueAction(action);
        
    },
    handlechange:function(comp,event,helper){
        var action1 = comp.get("c.value");
        var id =comp.find("retriveid").get("v.value");
        var last = comp.find("lastnameid").get("v.value");
        console.log(id);
        console.log(last);
        action1.setParams({ids:id,ln:last});
        action1.setCallback(this,function(val){
            var stage = val.getState();
            console.log(val)
            if(stage=='SUCCESS'){
                alert('Contact create Successfully');
            }
        })
        $A.enqueueAction(action1);
    }
    
})