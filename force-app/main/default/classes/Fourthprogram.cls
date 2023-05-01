//Create 10 Products with different Product Names,  Discrption & Family 
public class Fourthprogram {
    public static void test(){
        List<Product2> Prolist = new List<Product2>();
        for(Integer i=0;i<20;i++){
            Product2 Pro = new Product2();
            Pro.Name = 'Product'+i;
        	Pro.Date__c=date.today();
            Pro.ProductCode='0'+i;
            Pro.Description = 'Sold it Product'+i;
            Pro.Family='None';
            Prolist.add(pro);
        }
        if(Prolist.size()!=0){
        	insert Prolist;   
        }
        System.debug(Prolist);
    } 
}