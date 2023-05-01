public class Appextriggerhandler {
    public static void afterperform(List<account> acclist){
        list<contact> conlist = new List<contact>();
        for(Account ac : acclist){
            integer b=ac.NumberOfEmployees;
            for(integer i=0;i<b;i++){
                Contact con = new Contact();
                con.LastName = 'jksharma'+i;
                con.AccountId=ac.id;
                conlist.add(con);
            }
        }
        System.debug(conlist);
        insert conlist;

    }        
    public static void Tutorial(List<Account> newaccList,List<Account> oldacclist)
    {
        List<contact> deleteconlist = new list<Contact>();
        List<contact> insertconlist = new list<Contact>();
        List<contact> oldconlist = [select id,accountid from contact where accountid IN:oldacclist ];
        Map<id,integer> maplist = new Map<id,integer>();
        if(oldconlist.size()!=0){
            for(contact con :oldconlist){
            if(!maplist.containsKey(con.accountid)){
                maplist.put(con.accountid,1);			
            }
            else{
                integer count = maplist.get(con.AccountId);
                maplist.put(con.AccountId, ++count);
            }
        }
        }
        
        For(Account acc : newacclist){
            integer i=0;
            if(acc.numberofemployees < maplist.get(acc.id)){
                integer b =maplist.get(acc.Id) - acc.numberofemployees;
                for(integer j=0 ; j<b;j++){
                    deleteconlist.add(oldconlist[j]);
                }
            }
            else if(acc.NumberOfEmployees>=maplist.get(acc.id)){
                integer c=acc.NumberOfEmployees-maplist.get(acc.id);
                for(integer K=0;K<c;K++){
                    Contact con = new contact();
                    con.lastname = 'newcontact'+k;
                    con.AccountId = acc.id;
                    insertconlist.add(con);
                }
            }
            else if(oldacclist[i].numberofemployees==null && acc.NumberOfEmployees!=null){
                integer d = acc.NumberOfEmployees;
                for(integer l=0;l<d;l++){
                    Contact con = new contact();
                    con.lastname = 'newcontact'+l;
                    con.AccountId = acc.id;
                    insertconlist.add(con);
                }
            }
            i++;
        }
        if(deleteconlist.size()!=0){
            delete deleteconlist;
            system.debug(deleteconlist);
        }
        if(insertconlist.size()!=0){
            insert insertconlist;
            system.debug(insertconlist);
        }
    }
    
}