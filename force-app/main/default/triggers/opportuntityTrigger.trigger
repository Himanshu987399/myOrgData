trigger opportuntityTrigger on Opportunity (before insert,before delete) {
    public static boolean firstTimeRunTrigger = true;
    if(trigger.isbefore && trigger.isdelete && firstTimeRunTrigger){
        firstTimeRunTrigger = false;
        //opportunitytriggerhandler.notAllowedDelete(trigger.old);
    }
}