//Print the Account Names in Alphabetical accending order.
public class tenthprogram {
    public static void test(){
        List<Account> acc=[select name from account order by name asc];
        System.debug(acc);
    }
}