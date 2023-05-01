@isTest
public class Apex19Test {
    @isTest
    static void testApex19() {
        // Create test data
        Account acc = new Account(Name='casecheck');
        insert acc;
        Contact con = new Contact(FirstName='casecheck', LastName='test', AccountId=acc.Id);
        insert con;

        // Call the method
        Apex19.test();

    }
}