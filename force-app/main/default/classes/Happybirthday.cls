public class Happybirthday implements Schedulable {
    public void execute(SchedulableContext SC) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        string[] to = new string[] {'bhmansi.1998@gmail.com'};
       // string[] cc = new string[] {'karamveer.sharma2580@gmail.com,neelam.yadav@cloudanalogy.com,bhupendra.yadav@cloudanalogy.com'};
        email.setToAddresses(to);
     //   email.setCcAddresses(cc);
        
        email.setSubject('Happy birthday Mansi in advance');
        
        email.setHtmlBody('janam diwas ki apko hardik shubh kamnaye from Himanshu,Neelam,karamveer and bhupendra');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
    }
}