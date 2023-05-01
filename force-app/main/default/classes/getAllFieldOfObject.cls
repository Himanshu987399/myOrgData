public class getAllFieldOfObject {
     
    @AuraEnabled
    public static list<sObject> getdata(String recordId,String objectName){
        List<String> fields = new List<String>(Schema.getGlobalDescribe().get(ObjectName).getDescribe().fields.getMap().keySet());
        String Query = 'SELECT '+String.join(fields, ',')+ ' from '+objectName+' where id = '+'\''+ recordId + '\'';

        return Database.query(Query);
    }
}