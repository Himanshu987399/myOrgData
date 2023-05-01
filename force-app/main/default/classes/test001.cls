//Write a script to get all Account those are associated with opportunity and put the attachment 
//from account to their opportunity. If the account does not have attachment put opportunity close lost otherwise close won."
public class test001 {
    public static void test(){
        list<Account> acclist=[select id from Account];
        List<Opportunity> opplist = [select id,accountid from opportunity where accountid !=null];
        List<Attachment> attlist = [select id,body,parentid,name from Attachment where parentid IN: acclist];
        List<Attachment> attl = new List<Attachment>();
        List<Opportunity> oppupdate = new List<Opportunity>();
        for(Attachment Att:attlist){
            for(Opportunity opp: opplist){
                if(opp.accountid == att.parentid){
                    Attachment attach = new Attachment();
                    attach.Body = Att.body;
                    attach.Name = Att.name;
                    attach.ParentId =opp.id;
                    attl.add(attach);
                    opp.StageName ='closed Won';
                    oppupdate.add(opp);
                }
                else{
                    opp.StageName = 'closed lost';
                    oppupdate.add(opp);
                }
            }
        }
        if(attl.size()!=0){
            insert attl;
            system.debug(attl);
        }
        if(oppupdate.size()!=0){
            update oppupdate;
            System.debug(oppupdate);
        }
    }
}