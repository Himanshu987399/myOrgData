public class updateTotalQuantity {
    public static void method(){
        List<OpportunityLineItem> oppLineItem = [select Id,Quantity,OpportunityId from OpportunityLineItem];
        // for Counting the how many Opportunity Line item having a opportunity.
        Map<Id,Integer> OpportunityVsNoOfOpp = new Map<Id,Integer>();
        for(OpportunityLineItem oppLine : oppLineItem){
            if(OpportunityVsNoOfOpp.containskey(oppLine.OpportunityId)){
                integer count = OpportunityVsNoOfOpp.get(oppLine.OpportunityId)+1;
                OpportunityVsNoOfOpp.put(oppLine.OpportunityId,count);
            }else{
                OpportunityVsNoOfOpp.put(oppLine.OpportunityId,1);
            }
        }
        // For Count total Quantity of single Opportunity.
        Map<Id,Decimal> oppIdVSTotalQuantity = new Map<Id,Decimal>();
        for(OpportunityLineItem oppLine : oppLineItem){
            if(oppIdVSTotalQuantity.containskey(oppLine.OpportunityId)){
                Decimal count = oppIdVSTotalQuantity.get(oppLine.OpportunityId)+oppLine.Quantity;
                oppIdVSTotalQuantity.put(oppLine.OpportunityId,count);
            }else{
                oppIdVSTotalQuantity.put(oppLine.OpportunityId,oppLine.Quantity);
            }
        }
        System.debug('oppIdVSTotalQuantity---->'+oppIdVSTotalQuantity);
        System.debug('OpportunityVsNoOfOpp---->'+OpportunityVsNoOfOpp);
        //for get accountid in Related Opprtunity Line Items.:
        List<Opportunity> oppList = [select id,Accountid from Opportunity where id in :OpportunityVsNoOfOpp.keySet()];
        // for opprtunity with Accountid
        Map<Id,Id> OppVSaccountId = new Map<Id,Id>();
        for(Opportunity opp: oppList){
            OppVSaccountId.put(opp.Id,opp.AccountId);
        }
        // get All the Account 
        List<Account> accList = [select id,name,totalamountopp__c from Account where id in:OppVSaccountId.values()];
        List<Account> updateAccountList = new List<Account>();
        for(Account acc: accList){
            for(Opportunity oppId : oppList){
                // if opportunity having odd number of line Item it means Account also having odd number of line items.
                if(acc.id == oppId.Accountid){
                    Integer value = Math.mod(OpportunityVsNoOfOpp.get(oppId.Id),2);
                    if(value != 0){
                        system.debug('value--->'+oppIdVSTotalQuantity.get(oppId.Id));
                        //system.debug('value--->'+acc.totalamountopp__c == null ? acc.totalamountopp__c:acc.totalamountopp__c);
                        acc.totalamountopp__c = oppIdVSTotalQuantity.get(oppId.Id);
                        updateAccountList.add(acc);
                    }
                }
                
            }
        }
        if(updateAccountList.size() !=0){
            System.debug('updateAccountList--->'+updateAccountList);
            update updateAccountList;
        }
    }
}