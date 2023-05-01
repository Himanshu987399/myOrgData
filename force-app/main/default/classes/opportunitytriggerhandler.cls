public class opportunitytriggerhandler {
   /* public static void updateAccountField(List<Opportunity> oppList){
        set<id> accountIds = new set<id>();
        for(Opportunity opp: oppList){
            if(opp.Accountid != null)
                accountIds.add(opp.AccountId);
        }
        
        List<Opportunity> opplists = [select id,Accountid from Opportunity where Accountid =: accountIds];
        Map<id,integer> accountIdvsOpportunity = new Map<Id,Integer>();
        
        for(Opportunity opp: opplists){
            
            if(accountIdvsOpportunity.containsKey(opp.AccountId)){
                integer count = accountIdvsOpportunity.get(opp.AccountId)+1;
                accountIdvsOpportunity.put(opp.AccountId,count);
            }else{
                accountIdvsOpportunity.put(opp.Accountid,1);
            }
            
            
        }*/
        /*List<Account> accList = new List<Account>();
for(id ids : accountIdvsOpportunity.keySet()){
Account acc = new Account();
acc.id = ids;
acc.field = accountIdvsOpportunity.get(ids);

}*/
      /*  system.debug('accountIdvsOpportunity---->'+accountIdvsOpportunity);
    }
    public static void notAllowedDelete(List<Opportunity> opplist){
        List<SBQQ__Quote__c> quoteline = [select id,SBQQ__NetAmount__c,SBQQ__Opportunity2__c from SBQQ__Quote__c where SBQQ__Opportunity2__c in: opplist];
        for(Opportunity opp: opplist){
            for(SBQQ__Quote__c quote: quoteline){
                if(opp.id == quote.SBQQ__Opportunity2__c && quote.SBQQ__NetAmount__c > 10000){
                    opp.addError('you cannot delete Opportunity because related quote amount is greater than 10000');
                }
            }
        }
        
    }
    public static void tested(List<opportunity> opplist){
        for(opportunity opp : opplist){
            if(opp.closedate<system.today()){
                opp.CloseDate.addError('Please enter a future Closed Date');
            }
        }
        
    }
    public static void opplineitem(List<opportunity> newopp,List<opportunity> oldopp){
        
        List<product2> updatepro = new list<product2>();
        
        List<OpportunityLineItem> oppcheck = [select id,product2id,opportunityid,quantity from opportunitylineitem where opportunity.id IN: newopp];
        Map<id,decimal> maplist = new map<id,Decimal>();
        for(OpportunityLineItem oppline : oppcheck){
            maplist.put(oppline.product2id, oppline.quantity);
        }
        System.debug(maplist);
        List<product2> prolist = [select id,No_of_product_sold__c from product2 where id IN: maplist.keySet()];
        for(Opportunity opp: newopp){
            if(opp.StageName =='closed won'&& opp.HasOpportunityLineItem==true){
                for(product2 pro : prolist){
                    if(maplist.containsKey(pro.id)){
                        if(pro.No_of_product_sold__c == null){
                            pro.No_of_product_sold__c=maplist.get(pro.id);
                            updatepro.add(pro);
                        }
                        else{
                            pro.No_of_product_sold__c=pro.No_of_product_sold__c+maplist.get(pro.id);
                            updatepro.add(pro);
                        }
                    }
                }
            }
        }
        if(updatepro.size()!=0){
            update updatepro;
        }
        
    }*/
    /*public static void opplineupdate(List<opportunity> newlist,list<opportunity> oldlist){
Map<id,Opportunity> maplist = new map<id,opportunity>();
System.debug(newlist);
system.debug(oldlist);
for(opportunity opp :newlist){
for(opportunity opp2:oldlist){
if(opp.StageName !='closed won'||opp2.stagename !='closed lost' ){
if(opp.StageName =='closed won'|| opp2.stagename =='closed lost'){
maplist.put(opp.id,opp);
system.debug(maplist);
}
}

}
}
if(maplist.size()>0){
List<OpportunityLineItem> oppline =[select opportunityid from OpportunityLineItem where opportunityid !=null and opportunityid IN: maplist.keyset()];
if(oppline.size()==0){
newlist[0].adderror('opportunity cannot be closed because it have not any line item');
}
system.debug(oppline);
}
}*/
    
    public static void method(List<Opportunity> oppList){
        Map<Id,Integer> accountIdVsAmount = new Map<Id,Integer>();
        for(Opportunity opp: oppList){
            if(opp.stageName =='CLosed Won' && opp.AccountId != null){
                if(accountIdVsAmount.containsKey(opp.AccountId)){
                    Integer totalAmount = accountIdVsAmount.get(opp.AccountId)+Integer.valueOf(opp.Amount__c);
                    accountIdVsAmount.put(opp.AccountId,totalAmount);
                }else{
                   	accountIdVsAmount.put(opp.AccountId,Integer.valueOf(opp.Amount__c));
                }
            }
        }
        List<Account> accList = [Select id,Total_Amount__c from Account where id in : accountIdVsAmount.KeySet()];
        List<Account> updateAccount = new List<Account>();
        for(Account acc: accList){
            for(Id ids : accountIdVsAmount.KeySet()){
                if(acc.id == ids){
       				acc.Total_Amount__c = accountIdVsAmount.get(ids);
                    updateAccount.add(acc);
                }
            }
        }
        if(updateAccount.size() != null){
            update updateAccount;
        }
    }
}