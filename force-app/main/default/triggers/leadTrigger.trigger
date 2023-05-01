trigger leadTrigger on Lead (before insert,After insert) {
    if(trigger.isInsert && trigger.isAfter){
        /*for(Lead leadInstance: Trigger.new){
            if(leadInstance.leadsource == 'Web'){
                leadInstance.Rating = 'cold';
            }else{
                leadInstance.Rating = 'hot';
            }
        }*/
        leadTriggerHandler.countLeadScore(Trigger.New);
    }
}