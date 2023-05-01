({
    addRow: function(component, event, helper) {
        helper.addRecord(component, event);
    },
    save : function(component, event, helper) {
        helper.saveContactList(component, event, helper);
    },
    removeRows: function(component, event, helper) {
        console.log("value"+component.get("v.count"))
        
        if(component.get("v.count")< 0){
            alert("please add contact");
        }else{
            var value = component.get("v.count");
        	value = value-1;
        	component.set("v.count",value);
            var contactList = component.get("v.contactList");
        	var selectedItem = event.currentTarget;
        	var index = selectedItem.dataset.record;
        	contactList.splice(index, 1);
        	component.set("v.contactList", contactList);
        }
        
    }
})