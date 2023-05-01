//Find all the Products having Description field containing 'a' in it.
public class Fourteenthprogram {
    public static void test(){
        List<Product2> pro = [Select name from product2 where description like '%a%'];
        System.debug(pro);
    }
}