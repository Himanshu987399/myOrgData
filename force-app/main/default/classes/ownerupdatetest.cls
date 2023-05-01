@istest
public class ownerupdatetest {
    private static testmethod void testcheck(){
        Account acc = new Account();
        acc.Name='Himanshu';
        acc.OwnerId='0055j000005fnqUAAQ';
        acc.BillingCity='Loni';
        insert acc;
        contact con = new Contact();
        con.lastname ='Himanshushrama';
        con.AccountId=acc.id;
        con.MailingCity='ghaziabad';
        insert con;
        test.startTest();
        	acc.OwnerId='0055j000005TzMkAAK';
        	acc.BillingCity='Delhi';
        	update acc;
        test.stopTest();
    }
    private static testmethod void testcheck2(){
        Account acc = new Account();
        acc.Name='sharma';
        insert acc;
		contact con = new Contact();
		con.LastName='required';
		con.AccountId=acc.id;
		test.startTest();
			delete acc;
		test.stopTest();        
    }
    private static testmethod void testcheck3(){
        Account acc = new Account();
        acc.Name='check001';
        insert acc;
        Contact con1 = new Contact();
        con1.LastName='check';
        con1.AccountId=acc.id;
        insert con1;
        contact con2 = new contact();
        con2.LastName='check01';
        con2.AccountId=acc.id;
        insert con2;
        test.startTest();
        	update acc;
        test.stopTest();
    }
}