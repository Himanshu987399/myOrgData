public class Auracontact {
	@AuraEnabled
    public static List<contact> check(){
        return [select lastname,Email from contact limit 20];
    }
    @AuraEnabled
    public static void insertaccount(String name){
        Account acc = new Account();
        acc.name = name;
        insert acc;
    }
}