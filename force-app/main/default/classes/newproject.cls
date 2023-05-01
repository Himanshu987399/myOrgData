public class newproject {
    @AuraEnabled
    public static List<Account> getAccount(){
        return [select Id,Name,(select id,Name from Contacts),(select id,Name from opportunities) from Account];
    }
}