global class CreateEmailActivity implements messaging.InboundEmailHandler {
    global messaging.InboundEmailresult handleInboundEmail(messaging.InboundEmail email, messaging.InboundEnvelope envelope){
        try{
            Messaging.Inboundemail.BinaryAttachment jsonAttachment = null;
            for(Messaging.Inboundemail.BinaryAttachment attachment : email.binaryAttachments) {
                System.debug('Attt->'+attachment);
                system.debug('attachment.fileName');
                if(attachment.fileName.toLowerCase().contains('json')) {
                    system.debug('test-->');
                    jsonAttachment = attachment;
                    break;
                }
            }
            
            if(jsonAttachment == null) {
                system.debug('error--->+no file');
            }
            system.debug('Jsomnnnn--->'+jsonAttachment);
            system.debug('Jsomnnnn--->'+jsonAttachment.body);
            String jsonBody = jsonAttachment.body.toString();
             system.debug('jsonBody--->'+jsonBody);
            JsonParser jsonList = (JsonParser) JSON.deserialize(jsonBody,JsonParser.class);
          
                system.debug('reference--->'+jsonList.reference);
                system.debug('bsb--->'+jsonList.bankData.bankAccounts[0].bsb);
                system.debug('bsb1--->'+jsonList.bankData.bankAccounts[1].bsb);
                system.debug('accountNumber--->'+jsonList.bankData.bankAccounts[0].accountNumber);
                system.debug('accountNumber1--->'+jsonList.bankData.bankAccounts[1].accountNumber);
            
   
        }catch(Exception e){
            System.debug('Exception :' + e.getMessage());
            System.debug('Line Number :' + e.getLineNumber());
            
        }
        return null;
        
    }
    
}
         
            /*    List<String> mainData = new List<String>();
List<contact> conList = new List<Contact>();
Messaging.InboundEmail.TextAttachment[] TextAttachments = email.textAttachments;
List<Messaging.EmailFileAttachment> attachmentLists = new List<Messaging.EmailFileAttachment>();
if(TextAttachments != Null && TextAttachments.size() > 0){
for (integer i = 0 ; i < TextAttachments.size() ; i++) {
mainData.add(TextAttachments[i].Body);
system.debug('MainData-->'+TextAttachments[i].Body);
List<AccountInfo> accountList = (List<AccountInfo>) JSON.deserialize(TextAttachments[i].Body, List<AccountInfo>.class);
for(AccountInfo acc:accountList){
system.debug('acc__'+acc);
contact con = new Contact();
con.LastName = acc.Name;
conList.add(con);
}
}
}
if(conList.size()!=0){
insert conList;
}*/
/*global class CreateEmailActivity implements messaging.InboundEmailHandler {
global messaging.InboundEmailresult handleInboundEmail(messaging.InboundEmail email, messaging.InboundEnvelope envelope){
try{
/*List<contact> contacts = new List<contact> ();
List<Attachment> attachments = new List<Attachment>();
List<Messaging.EmailFileAttachment> attachmentList = new List<Messaging.EmailFileAttachment>();
List<string> toEmailAddresss = new List<string>();
List<string> ccEmailAddresss = new List<string>();
system.debug('email' + email);
messaging.InboundEmailresult result = new messaging.InboundEmailresult();
string senderName = email.fromname;
String fromEmailAddress = email.fromAddress;
toEmailAddresss = email.toAddresses;
ccEmailAddresss = email.ccAddresses;
system.debug('fromEmailAddress>>>>'+fromEmailAddress);
Messaging.InboundEmail.BinaryAttachment[] binaryAttachments = email.binaryAttachments;
contacts = [select id from Contact where email= :fromEmailAddress LIMIT 1];
String htmlBody = email.htmlBody;
String taskSubject = email.subject;
System.debug('htmlBody:' + htmlBody);
if(contacts.size() > 0){

Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
if(binaryAttachments != Null && binaryAttachments.size() > 0){
for (integer i = 0 ; i < binaryAttachments.size() ; i++) {
Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
attach.filename = binaryAttachments[i].Filename;
attach.body =binaryAttachments[i].Body;
attachmentList.add(attach);
}
}

List<string> toAddress = new List<string>();
toAddress.add(UserInfo.getUserEmail());
if(attachmentList.size()>0){
message.setFileAttachments(attachmentList);
}
message.setToAddresses(toAddress);
message.setSubject(taskSubject);
message.setHtmlBody(htmlBody);
message.setReplyTo(fromEmailAddress);
message.setSaveAsActivity(true);
message.setTreatTargetObjectAsRecipient(true);
message.setTargetObjectId(contacts[0].Id);
List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
messages.add(message);
if(!System.Test.isRunningTest()){
Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
}
List<Emailmessage> emailmessageList = new List<Emailmessage>();
List<EmailMessageRelation> emrObj = new List<EmailMessageRelation>();
if(Schema.sObjectType.EmailMessageRelation.isQueryable()){
emrObj = [SELECT Id, EmailMessageId, CreatedDate FROM EmailMessageRelation WHERE RelationId =: contacts[0].Id ORDER BY CreatedDate Desc LIMIT 1];
}
if(Schema.sObjectType.Emailmessage.isQueryable()){
emailmessageList = [SELECT Id , ActivityId, CreatedDate FROM Emailmessage WHERE Id =: emrObj[0].EmailMessageId LIMIT 1];
if(binaryAttachments != Null && binaryAttachments.size() > 0){
for (integer i = 0 ; i < binaryAttachments.size() ; i++) {
Attachment attachment = new Attachment();
if(emailmessageList.size()> 0){
attachment.ParentId = emailmessageList[0].Id;
}
attachment.Name = binaryAttachments[i].Filename;
attachment.Body = binaryAttachments[i].Body;
attachments.add(attachment);
}
if(attachments.size() >0){
insert attachments;
}
}
}
if(emailmessageList.size()> 0){
emailmessageList[0].FromName = senderName;
emailmessageList[0].FromAddress = fromEmailAddress;
if (toEmailAddresss.size()>0 ) {
emailmessageList[0].ToAddress = toEmailAddresss[0] + ',' +fromEmailAddress;
}
update emailmessageList[0];
system.debug('emailMessageObj Id : ' + emailmessageList[0]);
}
}

}catch(Exception e){
System.debug('Exception :' + e.getMessage());
System.debug('Line Number :' + e.getLineNumber());

}
return null;

}
}*/