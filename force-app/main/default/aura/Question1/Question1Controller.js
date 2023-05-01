({
    doinit : function(component, event, helper) {
        var action = component.get("c.insertperform");
        
        action.setCallback(this,function(val){
            var stage = val.getState();
            if(stage=="SUCCESS"){
                console.log(JSON.stringify(val.getReturnValue()))
                component.set("v.acclist",val.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    accountchange: function(component,event,helper){
        var value1 =component.find("retriveid").get("v.value");
        console.log(JSON.stringify(value1));
        
        var check = component.get("c.retriveopp");
        var check2 = component.get("c.concheck");
        check.setParams({value:value1 })
        check.setCallback(this,function(val){
            var status = val.getState();
            if(status=="SUCCESS"){
                console.log(JSON.stringify(val.getReturnValue()));
                component.set("v.opplist",val.getReturnValue());
            }
        });
        $A.enqueueAction(check);
        check2.setParams({value:value1});
        check2.setCallback(this,function(val){
            var sta = val.getState();
            if(sta=="SUCCESS"){
                console.log(JSON.stringify(val.getReturnValue()));
                component.set("v.conlist",val.getReturnValue());
            }
        });
        $A.enqueueAction(check2);
    }
})