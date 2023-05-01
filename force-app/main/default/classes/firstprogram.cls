//Create 20 new Accounts Records in salesforce with atleast 5 fields filled.
public class firstprogram {
    public Static void test(){
        List<Account> acclist = new List<Account>();
        for(Integer i=0;i<20;i++){
            Account acc = new Account();
            acc.Name = 'Test'+i;
            acc.AccountNumber ='10000'+i;
            acc.BillingCity = 'Noida';
            acc.Phone = '919191919'+i;
            acc.BillingCountry = 'INDIA';
            acclist.add(acc);
        }
        if(acclist.size() >0){
            Insert acclist;
        }
    }
}