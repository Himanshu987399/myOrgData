//Manually add 2 (jpg and PDF) attachments under Accounts related list.WAP to copy the attachments to Contact associated(parent child) with Account
public class Apex20 {
    public Static void test(){
        List<Account> acclist=[select id,name from account];
        List<Attachment> attachlist = [select parentid,body,name,contenttype from attachment where parentid IN: acclist];
      
        List<Contact> conlist =[select id,accountid from Contact where accountid IN : acclist];
        System.debug(conlist);
        list<Attachment> attac = new list<Attachment>();
        for(Contact con : conlist){
            for(Attachment acc : attachlist){
                if(con.accountid == acc.parentid){
                    Attachment att= new attachment();
                    att.name = acc.name;
                    att.body=acc.body;
                    att.ParentId=con.id;
                    att.ContentType = acc.ContentType;
                    attac.add(att);
                }
            }
        }
        System.debug(attac);
        insert attac;
    }    
}