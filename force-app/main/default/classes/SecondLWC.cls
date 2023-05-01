public class SecondLWC {
    @AuraEnabled
    public static List<Account> accountretrive(){
        return [select id,name from Account ORDER by name asc];
    } 
    @AuraEnabled
    public static List<opportunity> oppretrive(String accountid){
        System.debug(accountid);
        return [select id,name,accountid from opportunity where accountid =: accountid];
    }
    @AuraEnabled
    public static List<contact> conretrive(String accountid){
        return [select id,name,accountid from contact where accountid=: accountid];
    }
}