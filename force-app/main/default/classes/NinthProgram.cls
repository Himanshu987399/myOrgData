//Find the current username, email and phone number from the system administration
public class NinthProgram {
    public static void test(){
        List<User> usern =[select name,email,Phone,id from user where id =: userinfo.getUserId()];
        System.debug(usern);
    }
}