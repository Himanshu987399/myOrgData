/*  Create a Custom field in Opportunity:
CheckBox(Same Contact).
Write a Script to check if the Contact Roles in the Opportunity are same 
as the Contact present in the Account(Lookup in Opportunity).
If the Contact in Account and Contact Roles is Opportunity are same 
then Set the CheckBox(Same Contact) to True;*/
public class test002 {
    public static void test(){
        try{
            set<id> setOfOpportunity = new set<id>();
            List<OpportunityContactRole> oppConList = new List<OpportunityContactRole>();
            oppConList = [select OpportunityId , opportunity.accountId , contact.accountId from OpportunityContactRole];
            if(oppConList.size()>0){
                for(OpportunityContactRole opcr : oppConList){
                    if(opcr.opportunity.accountId == opcr.contact.accountId){
                        setOfOpportunity.add(opcr.OpportunityId);
                    }
                }
            }
            if(setOfOpportunity.size()>0){
                List<Opportunity> oppList = [select id , Same_Contact__c from Opportunity where Id IN:setOfOpportunity];
                if(oppList.size()>0){
                    for(Opportunity opp : oppList){
                        opp.Same_Contact__c = true;                    
                    }
                }
                update oppList;
            }
            
        }
        catch(exception ex){
            System.debug('error--------->'+ex.getMessage()+'Line------->'+ex.getLineNumber());
        }
    }
    
}