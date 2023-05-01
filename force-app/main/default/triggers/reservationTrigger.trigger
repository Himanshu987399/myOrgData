trigger reservationTrigger on Reservation__c (before insert) {
    
    if(trigger.isbefore && trigger.isinsert){
        reservationTriggerhandler.generateError(trigger.new);
    }

}