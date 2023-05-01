public class getContact {
	@AuraEnabled
    public static List<contact> getvalue(String accountName){
        String query = 'select id,name from contact where Account.name = '+'\''+accountName+'\'';
        return Database.query(query);
    }
}