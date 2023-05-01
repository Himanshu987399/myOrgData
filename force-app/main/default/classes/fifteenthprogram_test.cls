@istest
public class fifteenthprogram_test {
	@istest
    public static void test015(){
      	Pricebook2 standardPricebook = new Pricebook2(Id =Test.getStandardPricebookId(),IsActive = true);
        upsert standardPricebook;
        fifteenthprogram.test();
    }
}