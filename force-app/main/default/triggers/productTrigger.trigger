trigger productTrigger on Product2 (After insert) {
    if(trigger.isafter && trigger.isinsert){
        productTriggerHandler.insertperform(trigger.new);
    }
}