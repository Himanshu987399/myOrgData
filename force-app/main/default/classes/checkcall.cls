public class checkcall {
    @AuraEnabled
    public static string test001(){
        system.debug('jaiho');
        return 'abc';
    }

}