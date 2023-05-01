//Create New Price book 'Algo Pricebook' and 10 Products with Prices in the Pricebookfind
public class fifteenthprogram {
    public static void test(){
        List<PricebookEntry> pricebo = new List<PricebookEntry>();
        List<PricebookEntry> check =new List<PricebookEntry>();
        Pricebook2 pricebook =new Pricebook2();
        pricebook.Name = 'Algo Pricebook001';
        
        insert pricebook;
        List<Product2> Uploadproduct = new List<Product2>();
        for(integer i=1;i<=10;i++){
            Product2 createproduct = new Product2();
            createproduct.name='TestHimanshu'+i;
            Uploadproduct.add(createproduct);
        }
        insert uploadproduct;        
        
        //find standardpricebook   
        list<Pricebook2> standardpricebook =[select id from pricebook2 where isstandard=true limit 1];
        // upload product into standardpricebook
        
        for(Product2 pro : Uploadproduct){
            PricebookEntry priceobj = new PricebookEntry();
            priceobj.Pricebook2Id=standardpricebook[0].Id;
            priceobj.Product2Id=pro.id;
            priceobj.UnitPrice=100.00;
            check.add(priceobj);
        }
        if(check.size()!=0){
            insert check;
            
        }        
        
        // upload product into algo pricebook
        
        for(Product2 pro:Uploadproduct){
            PricebookEntry pricein = new PricebookEntry();
            pricein.Product2Id = pro.id;
            pricein.Pricebook2Id = pricebook.Id;
            pricein.UnitPrice = 100.00;
            pricebo.add(pricein);
        }
        if(pricebo.size()!=0){
            insert pricebo;
        }
        
    }
    
}