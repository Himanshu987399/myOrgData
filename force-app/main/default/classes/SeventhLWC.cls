public class SeventhLWC {
	@AuraEnabled
    public static integer checked(String username,String password){
        system.debug(username);
        system.debug(password);
       	List<ver__c> concheck=[select id,username__c,password__c from ver__c where username__c=:username and password__c=:password];
        system.debug(concheck);
        if(concheck.size()!=0){
            return 1;
        }    
        else{
            return 0;
        }
    }
}