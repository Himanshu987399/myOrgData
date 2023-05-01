trigger opportunitytrigger on Opportunity (before insert,before update,after update,after insert,after delete) {
    if(trigger.isbefore && trigger.isinsert){
        //opportunitytriggerhandler.tested(trigger.new);
    }
    if(trigger.isBefore && trigger.isupdate){
        // opportunitytriggerhandler.opplineitem(trigger.new,trigger.old);
        //opportunitytriggerhandler.opplineupdate(trigger.new,trigger.old);
        //test004.test(trigger.new);
        opportunityTriggerHandler.method(trigger.new);
    }    
    if(trigger.isafter && trigger.isinsert){
        // opportunityTriggerHandler2.countNoOfOpportuntiy(trigger.new);
        opportunityTriggerHandler.method(trigger.new);
        //sendEmailToXmlFormat.test001(trigger.new);
        //opportunitytriggerhandler.updateAccountField(trigger.new);
    }
    if(trigger.isafter && trigger.isdelete){
        //   opportunityTriggerHandler2.countNoOfOpportuntiy(trigger.new);
    }
}