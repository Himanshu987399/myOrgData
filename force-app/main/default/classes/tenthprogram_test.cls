@istest
public class tenthprogram_test {
	@istest
    public static void test010(){
        list<Account> acclist = new List<Account>();
        for(integer i=0;i<10;i++){
            Account acc = new Account();
            acc.Name = 'test'+i;
            acclist.add(acc);
            tenthprogram.test();
        }
    }
}