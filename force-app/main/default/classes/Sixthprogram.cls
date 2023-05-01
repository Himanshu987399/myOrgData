//Update all Opportunity with future CloseDate by Opportunity Name=Opportunity Name + 'F'
public class Sixthprogram {
    public static void test(){
        List<Opportunity> opp = [Select name from opportunity where closedate>today];
        List<Opportunity> opplist = new List<Opportunity>();
        for(Opportunity op:opp){
            op.Name=op.name+'F';
            opplist.add(op);
        }
        update opplist;
        System.debug(opplist);
        
    }
}