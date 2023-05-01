//WAP to create 5 Case Records with all the values(Account, Contact, etc) filled in.
public class Apex19 {
    public static void test(){
     	List<Case> caselist = new List<Case>();
        
        Account acc = [select id,name from Account where name ='casecheck' ];
        Contact con = [select id,FirstName from Contact where FirstName ='casecheck'];
        //create 5 case Records
        for(integer i=1;i<=5;i++){
            Case cas = new case();
            cas.ContactId=con.id;
            cas.AccountId = acc.id;
            cas.Status='working';
            cas.Origin='email';
            caselist.add(cas);
        }
        insert caselist;  
    }
}