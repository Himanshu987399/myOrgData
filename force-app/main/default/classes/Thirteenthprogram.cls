//Print any Integer number in reverse order. Ex: 789234  => 432987
public class Thirteenthprogram {
    public static void test(Integer a){
        integer b=a;
        integer rev=0;
        while(b!=0){
            rev = (rev*10)+math.mod(b, 10);
            b/=10;
        }
        System.debug(rev);
    }
}