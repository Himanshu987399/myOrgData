public class opportunitylineitemhanddler {
    public static void afterinsert(list<opportunitylineitem> oppline){
        set<id> lineitemListt = new set<id>();
        for(OpportunityLineItem it : oppline)
        {
            lineitemListt.add(it.Opportunityid);
        }
        
        List<Opportunity> oppcheck =[select id,name,closedate,stagename from opportunity where id in : lineitemListt];
        List<opportunity> opplist = new list<Opportunity>();
        List<OpportunityLineItem> opplinelist = new list<OpportunityLineItem>();
        List<opportunitylineitem> opplineitemcheck=[select id,pricebookentryid,product2id,opportunityid,totalprice,quantity from opportunitylineitem where opportunityid IN: oppcheck];
        
        for(OpportunityLineItem oppl : oppline){
            for(opportunity opp : oppcheck){
                Opportunity oopn = new Opportunity();
                oopn.name = opp.name + 'clone';
                oopn.CloseDate = opp.CloseDate + 30;
                oopn.StageName = opp.StageName;
                for( OpportunityLineItem oppk : opplineitemcheck){
                    OpportunityLineItem opplineit = new OpportunityLineItem();
                    opplineit.Product2Id = oppk.Product2Id;
                    opplineit.PricebookEntryId = oppk.PricebookEntryId;
                    opplineit.Quantity = oppk.Quantity;
                    opplineit.TotalPrice = oppk.TotalPrice;
                    opplinelist.add(opplineit);
                    
                }
                opplist.add(oopn);
            }
            
        }
        if(opplist.size() !=0){
            insert opplist;            
        }
        List<OpportunityLineItem> updatelistline = new list<OpportunityLineItem>();
        for(Opportunity oppli:opplist){
            for(OpportunityLineItem oppn : opplinelist){
                OpportunityLineItem opplk = new OpportunityLineItem();
                opplk.Product2Id = oppn.Product2Id;
                opplk.PricebookEntryId = oppn.PricebookEntryId;
                opplk.Quantity = oppn.Quantity;
                opplk.TotalPrice = oppn.TotalPrice;
                opplk.opportunityid = oppli.id;
                updatelistline.add(opplk);
            }
        }
        if(updatelistline.size()!=0){
            insert updatelistline;
        }
    }
}
/*public class CopyOppoLineItem {
public static void CopyWithLineItem(List<OpportunityLineItem> newLineItem)
{
try{
set<id> lineitemListt = new set<id>();
for(OpportunityLineItem it : newLineItem)
{
lineitemListt.add(it.Opportunityid);
}

Map<Id,Opportunity> oldVsClone = new Map<Id,Opportunity>();
List<Opportunity> opsList = new List<Opportunity>(); 

Map<Id,Opportunity> accountOppMap = new Map<Id,Opportunity>([select id,name,StageName,CloseDate,(select id,quantity from OpportunityLineItems) from Opportunity where id in : lineitemListt ]);
for(Opportunity item : accountOppMap.values())
{
Opportunity op = new Opportunity();
op.Name = item.Name+'clone';
op.CloseDate = item.closeDate.adddays(30);
op.StageName = item.StageName;

opsList.add(op);
oldVsClone.put(item.id,op);
}

insert opsList;

List<OpportunityLineItem> itemListt = new List<OpportunityLineItem>();

for(OpportunityLineItem lines : newLineItem)
{
OpportunityLineItem itemList = new OpportunityLineItem();
itemList.Quantity = lines.Quantity;
itemList.PricebookEntryId = lines.PricebookEntryId;
itemList.UnitPrice = lines.UnitPrice;

itemList.OpportunityId =oldVsClone.get(lines.OpportunityId).id;
itemListt.add(itemlist);
}



update itemListt;
}
catch(Exception ex)
{
system.debug('Message-->>' + ex.getMessage()+  'Line number-->>' + ex.getLineNumber());
}
}
}*/