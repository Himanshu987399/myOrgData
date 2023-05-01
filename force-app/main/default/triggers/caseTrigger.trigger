trigger caseTrigger on Case (before insert, After Insert) {
    if(trigger.isbefore && trigger.isInsert){
        integer i=0;
        do{
        	caseTriggerHandler.updateData(Trigger.New);
            i++;
        }while(i<0);
        
    }
    if(trigger.isAfter && trigger.isinsert){
       // caseTriggerHandler.updateData(Trigger.New);
    }
}