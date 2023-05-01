//find the account which having opportunity 
public class Mapopportunitylookup {
    public Static void test(){
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
        System.debug(maplist);
    }
}