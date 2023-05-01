@istest
public class Accounttrigger_test {
    @testsetup
    public static void test002(){
        Account acc = new Account();
        acc.name = 'himanshu';
        acc.NumberOfEmployees = 10;
        insert acc;
        
        Account acd = new Account();
        acd.Name='sgh';
        acd.NumberOfEmployees = null;
        insert acd;
        
        Account acdf = new Account();
        acdf.Name='sghk';
        acdf.NumberOfEmployees = 0;
        insert acdf;
        
        Contact con = new Contact();
        con.LastName = 'kl';
        con.AccountId = acc.id;
        insert con;
        
        
        
        Contact conj = new Contact();
        conj.LastName = 'klm';
        conj.AccountId = acdf.id;
        insert conj;
        
    }
    @istest
    public static void test001(){
        List<account> acc = [select id,name,NumberOfEmployees from Account];
        System.debug(acc);
        List<Account> acclist = new List<Account>();
        for(Account ac : acc){
            if(ac.NumberOfEmployees == null){
                ac.NumberofEmployees =6;
                acclist.add(ac);
            }
            else if(ac.NumberOfEmployees <=0){
                ac.NumberOfEmployees = 5;
                acclist.add(ac);
            }
            else if(ac.NumberOfEmployees>0){
                ac.NumberOfEmployees = 10;
                acclist.add(ac);
            }
            
        }
        if(acclist.size()!=0){
            update acclist;
            System.debug(acclist);
        }
        
    }
    
}