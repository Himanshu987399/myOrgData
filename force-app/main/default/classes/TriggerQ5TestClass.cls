@istest
public class TriggerQ5TestClass {
    @Testsetup
    public static void testQ5()
    {
        Account acc=new Account();
        acc.Name='new ACC1';
        INSERT acc;
        
        Contact con=new Contact();
        con.LastName='New Con11';
        con.AccountId=acc.Id;
        
        INSERT con;
        
    }
    
    @isTest
    public static void Test55()
    {
        Contact coo = new Contact();
        coo = [select id,name,Accountid from Contact Where Accountid!=Null];
        delete coo;
    }

}