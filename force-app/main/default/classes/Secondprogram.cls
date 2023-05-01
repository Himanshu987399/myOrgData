//Create 10 Contacts with diferent Account(LookUp) 
public class Secondprogram {
    public static void test(){
        Account acc = new Account();
        acc.Name ='Lookupaccount';
        insert acc;
        List<Contact> contactlist = new List<Contact>();
        for(Integer i=0;i<10;i++){
            Contact con = new Contact();
            con.LastName = 'Contact Record'+i;
            con.AccountId=acc.id;
            contactlist.add(con);
        }
        if(contactlist.size()!=0){
            insert contactlist;
        }
    }

}