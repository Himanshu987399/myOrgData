public class CreateCaseRecord {
    public static void RecordCaseCreate(){
        
        Account aInstance = new Account();
        aInstance.Name = 'Himanshusharma001';
        Insert aInstance;
        
        Contact cInstance = new Contact();
        cInstance.LastName = 'Himanshu222';
        Insert cInstance;
        
        List<Case> caseList = new List<Case>();
        for(integer i=0; i<5; i++){
            Case caInstance = new Case();
            caInstance.AccountId = aInstance.id;
            caInstance.ContactId = cInstance.id;
            caInstance.Origin = 'Email';
            caInstance.Status = 'New';
            caseList.add(caInstance);       
        }
        Insert caseList;
        system.debug(caseList);
    }
}