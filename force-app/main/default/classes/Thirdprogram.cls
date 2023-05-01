//Create 20 Opportunity with Closed Date, Stage and Opportyunity Name.
public class Thirdprogram {
    public static void test(){
        List <Opportunity> opplist =new List<Opportunity>();
        for(Integer i=0;i<20;i++){
            Opportunity opp = new Opportunity();
            opp.Name ='Test'+i;
            String str = '2022-03-10';
            opp.CloseDate=date.valueOf(str);
            opp.StageName = 'Qualification';
            opplist.add(opp);
        }
        if(opplist.size()!=0){
            insert opplist;
        }
        System.debug(opplist);
    }
}