({
    doinit : function(component, event, helper) {
        var action = component.get("c.oppcheck");
        
        
        action.setCallback(this,function(val){
            var stage = val.getState();
            if(stage =="SUCCESS"){
                console.log(JSON.stringify(val.getReturnValue()));
                component.set("v.opplist",val.getReturnValue());
            }
        })
        $A.enqueueAction(action);
    },
    handleClick : function(comp,event,helper){
        var action1 = comp.get("c.updatecheck");
        var oppid = comp.find("updatevalue").get("v.value");
        var closedate = comp.find("updateclosed").get("v.value");
        
        action1.setParams({opp:oppid,closedd:closedate});
        action1.setCallback(this,function(val){
            var stage = val.getState();
            if(stage=="SUCCESS"){
                alert("Closed date update successfully");
            }
            else{
                alert("Closed date is not updated ");
            }
        })
        $A.enqueueAction(action1);
    }
})