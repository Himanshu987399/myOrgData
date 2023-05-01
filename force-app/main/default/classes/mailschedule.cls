global class mailschedule implements Schedulable {
    global void execute(SchedulableContext SC) {
        Date newdate = date.today();
        Date checkdate = newdate.addDays(-7);
        system.debug('checkdate'+checkdate);
        List<Account> acc = [select id from account where createdDate >=:checkdate ];
        list<Opportunity> opp =[select id from opportunity where createdDate >=:checkdate ];
        List<Contact> con = [select id from Contact where createdDate >=:checkdate];
        List<case> cas =[select id from case where createdDate >=:checkdate];
        String header ='Account Id \n';
        string finalstr = header ;
        for(Account ac:acc){
            string recordString = ac.id +'\n';
            finalstr = finalstr +recordString;
        }
        finalstr=finalstr+'Opportunity Id \n';
        for(Opportunity op:opp){
            string recordString = op.id +'\n';
            finalstr = finalstr +recordString;
        }
        finalstr=finalstr+'Contact Id \n';
        for(contact co:con){
            string recordString = co.id +'\n';
            finalstr = finalstr +recordString;
        }
        finalstr=finalstr+'Case Id \n';
        for(case ca:cas){
            string recordString = ca.id +'\n';
            finalstr = finalstr +recordString;
        }
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Insertdatalast7days.xls';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        sendTo.add('Himanshu.sharma@cloudanalogy.com');
        mail.setToAddresses(sendTo);
        mail.setSubject('Last Seven day insert data');
        String Body='Excel data for all details ';
        mail.setHtmlBody(body);
        mail.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        mails.add(mail);
        if(mails.size()!=0){
            Messaging.sendEmail(mails);
        }
    }
    
}