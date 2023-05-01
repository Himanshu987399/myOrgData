({
    addRecord: function(component, event) {
        component.set('v.FirstRow',true);
        if(component.get("v.count")<5){
            component.set('v.onlyfive',true);
            var contactList = component.get("v.contactList");
        	contactList.push({
            'sobjectType': 'Contact',
            'FirstName': '',
            'LastName': ''
            
        	});
        	component.set("v.contactList", contactList);
            var value = component.get("v.count");
        	value = value+1;
        	component.set("v.count",value);
        }
        else{
            alert("you can't add more than 5 contact");
        }
        
    },
    saveContactList: function(component, event, helper) {
        var action = component.get("c.saveContactDetails");
        action.setParams({
            "conList": component.get("v.contactList")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contactList", []);
                alert('Contact records saved successfully');
            }
            else{
                alert('error');
            }
        });
        $A.enqueueAction(action);
    }
})