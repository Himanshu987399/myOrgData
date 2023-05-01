public class LightningApex3 {
	@AuraEnabled
    public static List<Opportunity> oppcheck(){
        return [select id,name,closedate from opportunity order by name asc];
    }
    @AuraEnabled
    public static void updatecheck(String opp, Date closedd){
        list<Opportunity> opplist=[select id,name,closedate from Opportunity where id =:opp];
        list<Opportunity> oppchecked = new list<Opportunity>();
        for(Opportunity oppch : opplist){
            oppch.closedate = closedd;
            oppchecked.add(oppch);
        }
        if(oppchecked.size()!=0){
            update oppchecked;
        }
    }
}