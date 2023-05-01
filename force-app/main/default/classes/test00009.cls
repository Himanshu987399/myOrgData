public class test00009 {
    public static void test001(){
        list<Opportunity> opplist = [select id,HasOpportunityLineItem,accountid from opportunity where accountid!=null and HasOpportunityLineItem = true	];
    	list<OpportunityLineItem> oppline=[select id,Quantity,opportunityid from opportunitylineitem where opportunityid IN:opplist];
		list<Account> acclist =[select id,Quantityofproduct__c from account];
        Map<id,Double> maplid = new map<id,Double>();
        for(opportunityLineitem oppl : oppline){
            if(!maplid.containsKey(oppl.opportunityid)){
                maplid.put(oppl.opportunityid,oppl.quantity);
            }
            else{
                double count = maplid.get(oppl.opportunityid)+oppl.quantity;
                maplid.put(oppl.opportunityid, count);
            }
        }
        system.debug(maplid);
        List<account> acclist1 = new List<account>();
        for(Opportunity opp:opplist){
            for(account acc:acclist){
                if(opp.accountid==acc.id){
                    acc.Quantityofproduct__c=maplid.get(opp.id);
                    acclist1.add(acc);
                }
            }
        }
        system.debug(acclist1);
        if(acclist1.size()!=0){
            update acclist1;
        }
    }
}