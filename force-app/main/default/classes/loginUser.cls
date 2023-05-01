public class loginUser {
@AuraEnabled
    public static string login(string username, string password){
        try{
            list<UserDetail__c> userDetail = [select id,Username__c,Password__c,name from UserDetail__c where Username__c =: username and Password__c =: password ];
            if(userDetail.size() != 0){
                string val = 'Welcome Back '+userDetail[0].name;
                return val;
            }
            else{
                string val = 'Username and Password is not Exits';
                return val;
            }
        }catch(exception e){
            return e.getMessage();
        }
               
    }
}