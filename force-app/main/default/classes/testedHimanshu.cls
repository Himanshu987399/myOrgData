public class testedHimanshu {
    public static void test(){
        List<OpportunityLineItem> oppLineItem = [select Id,Quantity,OpportunityId from OpportunityLineItem where Quantity>100];
    	set<Id> oppId = new set<Id>();
        for(OpportunityLineItem oppLine : oppLineItem){
            oppId.add(oppLine.OpportunityId);
        }
        List<Opportunity> oppList = [select id,Accountid,StageName from Opportunity where id in : oppId and StageName = 'Closed won'];
        set<Id> accountId = new set<id>();
        for(Opportunity opp: oppList){
            accountId.add(opp.accountid);
        }
        List<Account> accList = [Select id,name from account where id in:accountId];
        System.debug('Account--->'+accList);
    }

}