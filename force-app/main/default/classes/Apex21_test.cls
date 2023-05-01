@istest
public class Apex21_test {
    @istest
    public static void test021(){
        Opportunity opp = new Opportunity();
        opp.name='sharma';
        opp.StageName='closed won';
        opp.CloseDate = system.date.today();
        insert opp;
        
        product2 pro = new product2();
        pro.Name = 'procheck';
        insert pro;
        
        Pricebook2 standardPricebook = new Pricebook2(Id =Test.getStandardPricebookId(),IsActive = true);
        upsert standardPricebook;
        
        PricebookEntry priceentry = new PricebookEntry();
        priceentry.Product2Id = pro.id;
        priceentry.Pricebook2Id =standardpricebook.id;
        priceentry.UnitPrice=100.00;
        priceentry.isActive = true;
        insert priceentry;
        
        OpportunityLineItem oppl = new OpportunityLineItem();
        oppl.OpportunityId = opp.Id;
        oppl.Product2Id = pro.id;
        oppl.PricebookEntryId =priceentry.Id;
        oppl.Quantity = 2;
        oppl.TotalPrice = 200;
        insert oppl;
        
        Apex21.test();
    }
}