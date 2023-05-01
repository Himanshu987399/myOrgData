public class caseTriggerHandler {
    public static void updateData(List<Case> caseNewList){
        List<Case> newCase = new List<Case>();
        for(Case caseInstance : caseNewList){
            if(caseInstance.Origin == 'Email'){
                caseInstance.status = 'New';
                caseInstance.Priority = 'Medium';
                
            }
        }
        
    }
}