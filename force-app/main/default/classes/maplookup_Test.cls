@isTest
public class maplookup_Test {
    @testSetup
    public static void insertdata(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Testlist';
        con.AccountId = acc.id;
        insert con;
        
        Contact con1 = new Contact();
        con1.LastName = 'Testlist';
         con1.AccountId = acc.id;
        insert con1;
    }
    
    @isTest
    public static void Testmaplook(){
        List<Contact> conlist = [Select id,Accountid,Name from Contact];
        
        maplookup.test();
    }

}