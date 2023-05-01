public class LineitemInOpportunity {
    public static void opportunityLineItem(){
       
        opportunity oppobject = new  opportunity();
        oppobject.CloseDate = system.today();
        oppobject.StageName = 'qualification';
        oppobject.Name = 'Lenovo';
        insert oppobject;
        
        List<Product2> pro1 = new List<product2>();
        for(integer i=1; i<=5; i++){
            product2 pro = new product2();
            pro.Name = 'Tests'+i;
            pro.ProductCode = '0'+i;
            pro1.add(pro);
            
        }
        insert pro1;
        Pricebook2 standardpricebook =[select name,id from pricebook2 where isstandard=true limit 1];
        
        List<PricebookEntry> check =new List<PricebookEntry>();
        for(Product2 pro :pro1){
            PricebookEntry priceobj = new PricebookEntry();
            priceobj.Pricebook2Id=standardpricebook.Id;
            priceobj.Product2Id=pro.id;
            priceobj.UnitPrice=100.00;
            priceobj.isActive = true;
            check.add(priceobj);
        }        
        insert check;
        
        
        
        List<OpportunityLineItem> oppLineItem = new List<OpportunityLineItem>();
        integer i =0;
         for(product2 pro:pro1){
            OpportunityLineItem oppLineItemInstance = new OpportunityLineItem();
            oppLineItemInstance.opportunityId = oppobject.Id;
            oppLineItemInstance.Product2Id = pro.Id;
            oppLineItemInstance.Quantity = 2;
            oppLineItemInstance.TotalPrice = 200;
            oppLineItemInstance.PricebookEntryId = check[i].Id;
            i++;
            
            
            oppLineItem.add(oppLineItemInstance);
        }
        insert oppLineItem;
        
        
    }
}