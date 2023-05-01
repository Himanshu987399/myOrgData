trigger opportunitylineitemtrigger on OpportunityLineItem (before insert,after insert) {
    if(trigger.isafter && trigger.isinsert){
        //opportunitylineitemhanddler.afterinsert(trigger.new);
    }
}