@istest
public class Appextriggerhandlertest {

    private static testmethod void accountperform(){
        Account ac = new Account();
        ac.Name='checked0017';
        ac.NumberOfEmployees=8;
        test.startTest();
        	insert ac;
        test.stopTest();
        Account acclist =[select id,name from account where id=:ac.id];
        System.debug(acclist);
        system.assert(acclist.id!=null);
       
    }
   	
    private static testmethod void accountupdate(){
        Account ac = new Account();
        ac.Name='checked0017';
        ac.NumberOfEmployees=8;
        insert ac;
         Account ac1 = new Account();
        ac1.Name='checked0017';
        ac1.NumberOfEmployees=8;
        insert ac1;
         Account ac12 = new Account();
        ac12.Name='checked0017';
        insert ac12;
        test.startTest();
        	ac.NumberOfEmployees=9;
        	update ac;
        	ac1.NumberOfEmployees=7;
        	update ac1;
        	ac12.NumberOfEmployees=7;
        	update ac12;
        test.stopTest();
    }
}