({
    checked : function(component,event,helper) {
        var otp = component.find("otp01").get("v.value");
        console.log(otp);
        var random = component.get("v.randomnumber");
        console.log("random===>"+random);
        var user=component.get("v.username001");
        console.log("user===>"+user);
        var pass=component.get("v.password001");
        console.log("password==>"+pass)
        var action= component.get("c.checkotp");
        if(otp==null){
            alert("Please Enter OTP");
        }
        else{
            action.setParams({otp1:otp,usernamecheck:user,passwordcheck:pass,randomNumber:random});
            
            action.setCallback(this,function(val){
                if(val.getReturnValue()==0){
                    
                    alert("Password update Successfully");
                }
                else{
                    alert("Wrong OTP");
                }
            })
        }
        $A.enqueueAction(action);
    },
    generate : function(comp,event,helper){
        var use = comp.find("username").get("v.value");
        console.log(use);
        var action = comp.get("c.updatepassword");
        if(use==null ){
            alert("Username is Null")
        }
        else{
            action.setParams({username:use});
            action.setCallback(this,function(val){
                if(val.getReturnValue()=='no'){
                    alert("Username/Email is not exist");
                    
                }
                else{
                    
                    comp.set("v.randomnumber",val.getReturnValue());
                    console.log(val.getReturnValue());
                    comp.set("v.ischecked3",true);
                    comp.set("v.ischecked2",false);
                    comp.set("v.ischecked1",false);
                    
                }
            })
        }
        $A.enqueueAction(action);
    },
    back : function(comp,event,helper){
        comp.set("v.ischecked2",true);
        comp.set("v.ischecked1",false);
    }
})