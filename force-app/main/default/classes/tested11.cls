public class tested11{
    @AuraEnabled
    public static contact getContact(String Name){
        system.debug('cALL');
		return [Select id,Name from contact where Name =: Name];
	}
}