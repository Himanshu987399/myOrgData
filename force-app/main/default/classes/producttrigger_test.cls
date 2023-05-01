@istest
public class producttrigger_test {
	@istest
    public static void test009(){
        pricebook2 price =new pricebook2(id=Test.getStandardPricebookId(),isActive = true);
        upsert price;
        product2 pro= new Product2();
        pro.Name = 'procheck';
        insert pro;
    }
}