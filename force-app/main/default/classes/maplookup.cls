//find the account which having contact
public class maplookup {
    public static void test(){
        List<Contact> conlist = [select id,Accountid,name from contact where name like '%list%'];
        Map<id,Integer> maplist = new map<id,Integer>();
        for(Contact con:conlist){
            if(!maplist.containsKey(con.Accountid)){
                maplist.put(con.Accountid,1);
            }
            else {
                Integer count = maplist.get(con.Accountid)+1;
                maplist.put(con.Accountid,count);
            }
        }
        System.debug(maplist);
        
    }

}