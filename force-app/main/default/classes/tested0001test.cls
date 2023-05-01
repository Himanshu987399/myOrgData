public class tested0001test {
    public static void test(){
        List<Opportunity> oppList = [select id,AccountId from Opportunity where AccountId != Null];
        set<id> accountId = new set<id>();
        for(Opportunity opp: oppList){
            accountId.add(opp.AccountId);
        }
        List<Attachment> attachList = [select id,body,Name,parentId from Attachment where parentId =: accountId];
        List<Attachment> attach1 = new List<Attachment>();
        for(Attachment attach : attachList){
            for(Opportunity opp : oppList){
                if(attach.ParentId == opp.AccountId){
                    Attachment att = new Attachment();
                    att.body = attach.body;
                    att.ParentId = opp.id;
                    att.name = attach.name;
                    attach1.add(att);
                }
            }
        }
        if(attach1.size() != 0){
            system.debug(attach1);
            insert attach1;
        }
    }
}