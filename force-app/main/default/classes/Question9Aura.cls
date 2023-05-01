public class Question9Aura {
	@AuraEnabled
    public static list<Account> check(){
        return [select id,name from Account order by name asc];
    }
    @AuraEnabled
    public static void value(String ids,String ln){
        Contact con = new Contact();
        con.lastname= ln;
        con.AccountId = ids;
        insert con;
        
    }
    
}