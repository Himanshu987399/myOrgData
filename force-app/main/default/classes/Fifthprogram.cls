//Delete all contacts belonging to Accounts Name FIELD having 'A' in them.
public class Fifthprogram {
    public static void test(){
        List<Contact> Acc=[select id,name from Contact where name like '%test%'];
        delete Acc;
    }
}