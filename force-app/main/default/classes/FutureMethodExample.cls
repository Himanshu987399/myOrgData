global class FutureMethodExample
{
    @future(callout=true)
    public static void getStockQuotes(String acctName)
    {   
        // Perform a callout to an external service
        list<Account> acc =[Select id,name from account where name=: acctName];
        list<Account> acclist = new List<Account>();
        for(Account acc1: acc){
            acc1.name='sharma';
            acclist.add(acc1);
        }
        if(acclist.size()!=0){
            System.debug(acclist);
            update acclist;
        }
    }
   
    
}