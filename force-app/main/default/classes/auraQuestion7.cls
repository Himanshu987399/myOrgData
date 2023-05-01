public class auraQuestion7 {
    @AuraEnabled
    public static integer conlist(String email,String password){
        List<ver__c> concheck=[select id,username__c,password__c from ver__c where username__c=:email and password__c=:password];
        system.debug(concheck);
        if(concheck.size()!=0){
            return 1;
        }    
        else{
            return 0;
        }
    }
    @AuraEnabled
    public static String updatepassword(String username){
        List<ver__c> conch=[select id,username__c,password__c,Email__c from ver__c where username__c=:username limit 1];
        system.debug(conch);
        String randomNumber='';
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(ver__c veri : conch){
            Integer len = 6;
            String str = string.valueof(Math.abs(Crypto.getRandomLong()));
            randomNumber = str.substring(0, len);
            system.debug(randomNumber);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(veri.Email__c);
            mail.setToAddresses(sendTo);
            mail.setSubject('FORGET PASSWORD');
            String Body='Forget Password OTP is '+randomNumber;
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        
        if(mails.size()!=0){
            Messaging.sendEmail(mails);
            return randomNumber;
        }
        else{
            return 'no';
        }
    }
    @AuraEnabled
    public static integer checkotp(String otp1,String usernamecheck,String passwordcheck,String randomNumber){
        System.debug(usernamecheck);
        List<ver__c> conch=[select id,username__c,password__c from ver__c where username__c=:usernamecheck];
        System.debug(conch);
        System.debug(passwordcheck);
        
        List<ver__c> checklist = new List<ver__c>();
        for(ver__c veri:conch){
            System.debug(randomNumber);
            if(otp1==randomNumber){
                veri.password__c = passwordcheck;
                checklist.add(veri);
            }
        }
        if(checklist.size()!=0){
            update checklist;
            return 0;
        }
        else{
            return 1;
        }
    }
}