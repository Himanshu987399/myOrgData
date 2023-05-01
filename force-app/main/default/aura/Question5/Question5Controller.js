({
	doInit : function(component, event, helper) {
        var action = component.get("c.allObjects");
        action.setCallback(this ,function(response){
            component.set("v.Objects",response.getReturnValue()) ;
            console.log(response.getReturnValue());
            
        });
        $A.enqueueAction(action);
		
	},
    onSelect11: function(component,event,helper){
        var val = component.find("objectName").get("v.value");
        console.log("val=======>"+val);
        var action1 = component.get("c.fieldsNames");
        action1.setParams({ids:val});     
        action1.setCallback(this,function(response){
            
            component.set("v.Fields",response.getReturnValue());
            console.log("Objects==========>"+response.getReturnValue());
            
        });
         $A.enqueueAction(action1);
                                   
                                  
        
        
    },
    onSelect12: function(component,event,helper){
        var action3 = component.get("c.forType");
         var action4 = component.get("c.forApiName");
        var val = component.find("objectName").get("v.value");
        var val1 = component.find("FieldName").get("v.value");
        console.log("val========>"+val);
        console.log("val2========>"+val1);
        action3.setParams({objName:val,fieldName:val1});
        action3.setCallback(this,function(response){
            
            component.set("v.TypeOfTheField",response.getReturnValue());
            console.log("types==========>"+response.getReturnValue());
            
        });
        action4.setParams({objName:val,fieldName:val1});
        action4.setCallback(this,function(response){
            
            component.set("v.Api",response.getReturnValue());
            console.log("Api==========>"+response.getReturnValue());
            
        });
        
        $A.enqueueAction(action3);
        $A.enqueueAction(action4);
    }
})