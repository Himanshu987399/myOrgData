public class opportunityTriggerHandler2 {
    public static void countNoOfOpportuntiy(List<Opportunity> oppList){
		Set<Id> oppIdVsAccount = new Set<Id>();
        for(opportunity opp : oppList){
            oppIdVsAccount.add(opp.AccountId);
        }
        List<Opportunity> oppNewList = [select id,Accountid,Amount from Opportunity where Accountid =: oppIdVsAccount];
        Map<Id,Integer> noOfOppVSAccountId = new Map<Id,Integer>();
        Map<Id,Decimal> totalAmountVSAccountId = new Map<Id,Decimal>();
        for(Opportunity oppInstance : oppNewList){
            if(noOfOppVSAccountId.containskey(oppInstance.Accountid)){
                integer count = noOfOppVSAccountId.get(oppInstance.Accountid)+1;
                noOfOppVSAccountId.put(oppInstance.Accountid,count);
            }else{
                noOfOppVSAccountId.put(oppInstance.Accountid,1);
            }
        }
        for(Opportunity oppInstance : oppNewList){
            if(totalAmountVSAccountId.containsKey(oppInstance.AccountId)){
                Decimal Amount = totalAmountVSAccountId.get(oppInstance.AccountId) + oppInstance.Amount;
				totalAmountVSAccountId.put(oppInstance.AccountId,Amount);                
            }else{
                totalAmountVSAccountId.put(oppInstance.AccountId,oppInstance.Amount);
            }
        }
        System.debug('noOfOppVSAccountId--->'+noOfOppVSAccountId);
         System.debug('totalAmountVSAccountId--->'+totalAmountVSAccountId);
        List<Account> accList = new List<Account>();
        for(Id Ids: noOfOppVSAccountId.keySet()){
            Account accInstance = new Account();
            accInstance.id = Ids;
            accInstance.No_of_Opportunity__c = noOfOppVSAccountId.get(Ids);
            if(totalAmountVSAccountId.get(Ids) != 0 ){
                 accInstance.totalamountopp__c	= totalAmountVSAccountId.get(Ids);
            }
            accList.add(accInstance);
        }
        if(accList.size() != 0){
            try{
                update accList;
            }
            Catch(exception e){
                system.debug('Error ---> '+e);
            }
        }
        
    }

}