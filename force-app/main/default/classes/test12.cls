// Write a Script to get all the Accounts having more than 2 Opportunites with Closed Won.
public class test12 {
    public static void test(){
    	List<Opportunity> opplist =[select id,name,accountid from opportunity where accountid!=null and stagename='Closed won' ];
        map<id,integer> maplist = new Map<id,integer>();
        
        for(Opportunity opp : opplist){
            if(!maplist.containsKey(opp.accountid)){
                maplist.put(opp.Accountid,1);
            }
            else{
                integer count = maplist.get(opp.accountid)+1;
                maplist.put(opp.accountid,count);
                
            }
        }
        List<Account> acclist=[Select name,id from account];
        for(Account acc : acclist){
            if(maplist.containskey(acc.Id)){
                if(maplist.get(acc.id)>=2){
                    system.debug(acc.id);
                    System.debug(acc.Name);
                }
            }
        }
    }
}