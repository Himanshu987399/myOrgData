trigger parenttrigger on ParentObject__c (before insert,after insert) {
    if(trigger.isafter && trigger.isInsert){
        List<childObject__c> childObj = new List<childObject__c>();
        for(ParentObject__c obj : trigger.New){
            childObject__c chinstance = new childObject__c();
            chinstance.ParentObject__c = obj.id;
            chinstance.Name = obj.Name;
            childObj.add(chinstance);
        }
        if(childObj.size() != 0){
            insert childObj;
        }
    }
}