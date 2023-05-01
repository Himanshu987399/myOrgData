/*  Create picklist field label = 'Working In' and values = 'Asia, Australia, Europe'.
Write a Trigger to stop updating Opportunities with Account having ""Working in = ASIA"" and
Already 3 opportunitylineitems and stage name of opportunity closed won under same Account.*/
public class test004 {
    public static void test(List<opportunity> newlist){
        list<OpportunityLineItem> oppline = [select opportunityid,opportunity.accountid from Opportunitylineitem where opportunityid IN: newlist ];
        map<id,integer> maplist = new map<id,integer>();
        for(OpportunityLineItem oppl : oppline){
            if(!maplist.containsKey(oppl.OpportunityId)){
                maplist.put(oppl.OpportunityId, 1);
            }
            else{
                integer count = maplist.get(oppl.OpportunityId);
                maplist.put(oppl.OpportunityId,++count);
            }
        }
        list<Account> acclist =[select id from account];
        for(opportunity opp:newlist){
            for(Account acc:acclist){
                if(opp.accountid==acc.id){
                    if(acc.Work_In__c=='ASIA' || maplist.get(opp.id) >=3 || opp.StageName=='closed Won'){
                        opp.addError('you cannot update opportunity');
                    }
                }
            }
        }
    }
}