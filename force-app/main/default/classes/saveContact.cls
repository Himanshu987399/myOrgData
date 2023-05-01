public class saveContact {
	@AuraEnabled
    public static void saveContactDetails(List<contact> conList){
        system.debug('conlist-->'+conList);
    }
}