//Create new opportunity and clone that opportunity with all the related Line Items and "Closed Date = Old closed date + 30 days & Opportunity name = Opportunity Name+ 'Clone'"
public class Apex21 {
    public static void test(){        
        List<OpportunityLineItem> oppLineList = [SELECT Id ,Opportunity.Name,Opportunity.CloseDate, Opportunity.StageName ,OpportunityId FROM OpportunityLineItem Where OpportunityId!=null];

        List<Opportunity> oppList = new List<Opportunity>();
        for(OpportunityLineItem opp :oppLineList ){
            Opportunity oppInstance = new Opportunity();
            oppInstance.Name = opp.Opportunity.Name+'clone';
            oppInstance.CloseDate = opp.Opportunity.CloseDate+30;
            oppInstance.StageName = opp.Opportunity.StageName;
            oppList.add(oppInstance);
            
        }
        if(OppList.size()>0){
            insert oppList;
            System.debug(oppList);
            
        }
    }
}