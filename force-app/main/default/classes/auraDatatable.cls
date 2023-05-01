public class auraDatatable {
  @AuraEnabled
    public static List<Account> getAccounts(){
        
        return [SELECT Name ,ID,AccountNumber,Phone,Rating FROM Account];
        
    }
    
        @AuraEnabled
    public static void sendOTP(String OTP){
  
 String sMessage='';
       
           System.debug('OTP:::::>>'+OTP); 
           String UserEmail = UserInfo.getUserEmail();
          system.debug('Mail-->> '+ UserEmail );
           
            List<Messaging.SingleEmailMessage> mailsList = new  List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage mails = new Messaging.SingleEmailMessage();
            List<String> mail =new List<String>();
            mail.add(UserEmail);
            mails.setToAddresses(mail);
           
            system.debug('mailsList'+mailsList);
         // mail.setSubject(Subject);
            mails.setSubject('Onen Time password');
        	String Body = '';
            mails.setHtmlBody('Your OTP is '+ OTP);
            mailsList.add(mails);

           //sMessage='Success';
            Messaging.sendEmail(mailsList);
            //Messaging.send
                      	
        }
}