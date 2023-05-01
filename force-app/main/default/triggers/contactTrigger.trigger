trigger contactTrigger on Contact (before insert,After insert,After delete) {
    if(trigger.isafter && trigger.isinsert){
        //contactTriggerhandler.updateaccount(trigger.new);
        contactTriggerhandler.updateAccountName(trigger.new);
    }
    if(trigger.isafter && trigger.isdelete){
     //  contactTriggerhandler.deletelastnameaccount(trigger.old);
    }

}