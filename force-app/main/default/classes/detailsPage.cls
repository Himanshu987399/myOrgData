public class detailsPage {
    @AuraEnabled
    public static list<sobject> getvalue(String recordId,string objectapi){
		List<String> fields = new List<String>(Schema.getGlobalDescribe().get(objectapi).getDescribe().fields.getMap().keySet());
        String Query = 'SELECT '+String.join(fields, ',')+ ' from '+objectapi+' where id = '+'\''+ recordId + '\'';

        return Database.query(Query);
    }
}