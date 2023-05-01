@istest
public class Apex20_test {
	@istest
    public static void test020(){
        account acc = new Account();
        acc.name = 'checked';
        insert acc;
        
        Contact con = new Contact();
        con.lastname = 'sj';
        con.AccountId = acc.Id;
        insert con;
        
        
        Attachment attach=new Attachment();       
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=acc.id;
        insert attach;
        
        Apex20.test();
    }
}