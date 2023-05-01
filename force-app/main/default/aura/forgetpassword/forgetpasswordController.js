({
    doInit : function(component, event, helper) {
        component.set("v.ischecked1",true);
    },
    backClick:function(comp,event,helper){
		helper.back(comp,event,helper);
    },
    generatepassword:function(comp,event,helper){
        helper.generate(comp,event,helper);
    },
    otpsubmit : function(component, event, helper) {
    	helper.checked(component,event,helper);
    }
})