({
    callHelper : function(component,event,helper) {
        
        
        var action =component.get("c.getAccounts");
        
        // Calling Apex Method
        action.setCallback(this,function(val){
            // getting Call back status
            var  status=val.getState();
            console.log('Status Code: '+status);
            var acc = [];
            if(status=="SUCCESS"){
                acc=val.getReturnValue();
                // setting the value into aura attribute
                 console.log('acc  ====> '+JSON.stringify(acc));
                console.log('Result  ====> '+val.getReturnValue());
                component.set("v.accountList",val.getReturnValue());
                
            }
        });
        $A.enqueueAction(action);
    },
    
    
    handleSort: function(component, event) {
        var sortedBy = event.getParam('fieldName');
         var accountLs=component.get("v.accountList");
        var sortDirection = event.getParam('sortDirection');
          var cloneData = []; 
        
        if(sortDirection === 'asc'){
        cloneData=_.sortBy(accountLs, sortedBy);
         }else{
          cloneData= _.sortBy(accountLs, sortedBy).reverse();
         }
  
       component.set('v.accountList', cloneData);
        component.set('v.sortDirection', sortDirection);
        component.set('v.sortedBy', sortedBy);
     }
    
    
})