@istest
public class pro_test {
    @testsetup
    public static void checked(){
        product2 product = new product2();
        product.name = 'procheck';
        insert product;
    }
    @istest
    public static void test009(){
        list<product2> pro =[select id from product2];
        
      
    }
}