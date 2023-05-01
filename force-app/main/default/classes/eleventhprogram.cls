//Print the Account Name in reverse order Ex: Name='Company' => 'ynapmoC'
public class eleventhprogram {
    public static void test(){
        List<Account> acclist =[select name from account where name like '%Company%'];
        List<string> a =new List<String>();
        String str;
        String str2;
        integer n,i;
        for(Account ac:acclist){
            str =ac.name;
            str2 ='';
            n=str.length();
            for(i=n-1;i>=0;i--){
                str2=str2+str.substring(i,i+1);
                a.add(str2);
            }
        }
        System.debug(a);
    }
    
}