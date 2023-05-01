public class productTriggerHandler {
    public static void insertperform(List<Product2> prolist){
        Pricebook2 standardpricebook=[select id,name from pricebook2 where isstandard = true];
        List<PricebookEntry> priceobj = new List<PricebookEntry>(); 
        for(Product2 pro : prolist){
            PricebookEntry priceins = new PricebookEntry();
            priceins.Product2Id=pro.id;
            priceins.Pricebook2Id=standardpricebook.id;
            priceins.UnitPrice=1;
            priceobj.add(priceins);
        }
        insert priceobj;
    }
}