public class secondLWCclass {
    @AuraEnabled
    public static List<wrapper> wrapperMethod(){
        List<Contact> conList = new List<Contact>();
        conList = [Select id ,name ,Accountid from contact where Accountid!=null];
        
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [Select id ,name ,Accountid from Opportunity where Accountid!=null];   
        
        Map<id,List<Contact>> accidVsListCon = new Map<Id,List<contact>>();
        
        for(Contact con :conList){
            if(!accidVsListCon.containskey(con.Accountid)){
                List<Contact> conInstance = new List<Contact>();
                conInstance.add(con);
                accidVsListCon.put(con.Accountid,conInstance);
            }else{
                List<Contact> conInstance = accidVsListCon.get(con.AccountId);
                conInstance.add(con);
                accidVsListCon.put(con.Accountid,conInstance);
            }
        }
        
        
        Map<id,List<Opportunity>> accidVsListOpp = new Map<Id,List<Opportunity>>();
        for(Opportunity opp :oppList){
            if(!accidVsListOpp.containskey(opp.Accountid)){
                List<Opportunity> oppInstance = new List<Opportunity>();
                oppInstance.add(opp);
                accidVsListOpp.put(opp.Accountid,oppInstance);
            }else{
                List<Opportunity> oppInstance = accidVsListOpp.get(opp.AccountId);
                oppInstance.add(opp);
                accidVsListOpp.put(opp.Accountid,oppInstance);
            }
        }
        
        List<Account> accList = new List<Account>();
        accList = [Select id ,name from Account where id IN:accidVsListCon.keySet() AND id IN:accidVsListOpp.keySet()];
        
        List<wrapper> wrapperList = new List<wrapper>();
        
        for(Account acc :accList){
            wrapper wrapperInstance = new wrapper();
            wrapperInstance.Accountid = acc.id;
            wrapperInstance.conList = accidVsListCon.get(acc.id);
            wrapperInstance.oppList = accidVsListOpp.get(acc.id);
            wrapperList.add(wrapperInstance);
        }
        System.debug('wrapperList>>>>>>>>>>>>>>  '+wrapperList);
        
        return wrapperList;
    } 
    public class wrapper{
        public id Accountid;
        public List<Contact> conList;
        public List<opportunity> oppList;
    }
}