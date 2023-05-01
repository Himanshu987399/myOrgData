({
    
    onclick : function(component, event, helper) {
         new Promise(function(resolve, reject) { 
            var action = component.get("c.test001");
            action.setCallback(this, 
                               function(response) {
                                   var state = response.getState();
                                   if (state === "SUCCESS") {
                                       resolve(response.getReturnValue());
                                   } else {
                                       reject(new Error(response.getError()));
                                   }
                               }); 
            $A.enqueueAction(action);
        }).then(function(resolve){
            console.log(resolve);
        }).catch(function(reject){
            console.log(reject);
        })  
    },
})