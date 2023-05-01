@istest
public class sixthprogram_test {
	@istest
    public static void test006(){
        opportunity opp = new Opportunity();
        opp.Name = 'opptest';
        opp.StageName = 'closed won';
        opp.CloseDate = date.newInstance(2022, 5, 1);
        insert opp;
        Sixthprogram.test();
    }
}