({
    doInit:function(component,event,helper){
        component.set("v.ischecked1",true);
    },
    handleClick : function(component, event, helper) {
        var action = component.get("c.conlist");
        var username= component.find("username01").get("v.value");
        var pass= component.find("password01").get("v.value");
        console.log(username);
        console.log(pass);
        if(username==null || pass==null){
            alert("Username and Password is null");
        }
        else{
            action.setParams({email:username,password:pass});
            action.setCallback(this,function(val){
                console.log(val.getReturnValue());
                if(val.getReturnValue()==1){
                    alert("Successfully Login");
                }
                else{
                    alert("Something Wrong");
                }
            })
        }
        
        $A.enqueueAction(action);
    },
    forgetpassword:function(component,event,helper){
        component.set("v.ischecked1",false);
        component.set("v.ischecked2",true);
        
    }
})