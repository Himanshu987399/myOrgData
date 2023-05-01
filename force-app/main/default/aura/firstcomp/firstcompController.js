({
    doinit : function(component, event, helper) {
        component.set("v.checked01",true);
    },
    handleClick:function(cmp,event,helper){
        cmp.set("v.checked02",true);
        cmp.set("v.checked01",false);
    }
})