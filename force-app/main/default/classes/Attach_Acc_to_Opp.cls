public class Attach_Acc_to_Opp {
    public static void method(){
        List<Opportunity> oppList =[select Id,AccountId from Opportunity where AccountId !=null];
        set<Id> oppVSAccountId = new set<Id>();
        for(Opportunity opp : oppList){
            oppVSAccountId.add(opp.AccountId);
        }
        List<Attachment> attList = new List<Attachment>();
        List<Attachment> attachmentList = [select ParentId,Body,Name from Attachment where ParentId IN:oppVSAccountId];
        for(Attachment attach : attachmentList){
            for(Opportunity opp : oppList){
                if(attach.ParentId == opp.AccountId){
                    Attachment att = new Attachment();
                    att.Body = attach.Body;
                    att.Name = attach.Name;
                    att.ParentId = opp.Id;
                    attList.add(att);
                }
            }
        }
        if(attList.size() != 0){
            try{
                insert attList;
            }catch(Exception ex){
                system.debug('Error--> '+ex.getMessage());
            }
        }
    }

}