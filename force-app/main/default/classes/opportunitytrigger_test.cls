@istest
public class opportunitytrigger_test {
    
    @istest
    public static void testoop(){
        Opportunity opp = new Opportunity();
        opp.Name ='sja';
        opp.StageName = 'closed won';
        opp.CloseDate =system.Date.today();
        insert opp;
        
        pricebook2 sta = new pricebook2(id = Test.getStandardPricebookId(), isActive = true);
        upsert sta;
        
        
        product2 pro = new Product2();
        pro.name= 'procheckgh';
        pro.No_of_product_sold__c=0;
        insert pro;
        
        
        PricebookEntry price = new PricebookEntry();
        price.Pricebook2Id = sta.id;
        price.Product2Id = pro.Id;
        price.UnitPrice = 100;
        price.IsActive = true;
        insert price;
        
        OpportunityLineItem opplm = new OpportunityLineItem();
        opplm.Product2Id = pro.Id;
        opplm.PricebookEntryId = price.Id;
        opplm.OpportunityId = opp.id;
        opplm.Quantity = 2;
        opplm.TotalPrice = 100;
        insert opplm;
    }
}