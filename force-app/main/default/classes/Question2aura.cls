//Created a page that will show all accounts with its opportunity and Contacts in picklist va
public class Question2aura {
	@AuraEnabled
    public static List<Account> insertperform(){
        return [select id,name from Account];
    }
    @AuraEnabled
    public static List<Opportunity> retriveopp(String value){
        List<opportunity> opplist =[select id,name,Accountid from opportunity where Accountid =:value];
        return opplist;
    }
    @AuraEnabled
    public static List<Contact> concheck(String value){
        return [select id,lastname,accountid from contact where accountid =:value];
    }
}