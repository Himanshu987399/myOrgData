public class sendEmailToXmlFormat {
    public static void test001(List<Opportunity> opplist){
        
        Opportunity rew=new Opportunity();
        rew =[SELECT id,Name,Type FROM Opportunity where id IN: opplist LIMIT 1];
        Dom.Document doc = new Dom.Document();
        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartDocument(null, '1.0');
        w.writeStartElement(null, 'Opportunities', null);
        w.writeStartElement(null, 'Opportunity', null);
        w.writeStartElement(null, 'Id', null);
        w.writeCharacters(rew.Id);
        w.writeEndElement();
        w.writeStartElement(null, 'Name', null);
        if(rew.Name!=null)
        {
            w.writeCharacters(rew.Name);
        }
        w.writeEndElement();
        w.writeStartElement(null, 'Type', null);
        if(rew.Type!=null)
        {
            w.writeCharacters(rew.Type);
        }
        w.writeEndElement();
        w.writeEndDocument();
        string xmlOutput = w.getXmlString();
        w.close();
        doc.Load(xmlOutput);
        string xmldata = doc.toXmlString();
        system.debug('XML is '+xmldata);
        Blob  csvBlob;
        try{
            csvBlob  = Blob.valueOf(xmldata);  
        }catch(exception e){
            csvBlob  = Blob.valueOf('Some Text');
        }
       
        Attachment attachment = new Attachment();
        attachment.Body = csvBlob ;
        attachment.Name = 'Rewardfile.xml';
        attachment.ParentId = rew.id;
        insert attachment;
        
        Update rew; 
        
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
       // blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Rewardfile.xml';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> sendTo = new List<String>();
        sendto.add('himanshu.sharma@cloudanalogy.com');
        mail.setToAddresses(sendTo);
        mail.setSubject('Opportunity details to create New Opportunity');
        String Body='Thanks for creating new Opportunity';
        mail.setHtmlBody(body);
        mail.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        mails.add(mail);
        if(mails.size()!=0){
            Messaging.sendEmail(mails);
        }
    }
}