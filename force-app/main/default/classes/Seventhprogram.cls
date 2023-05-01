//Create a apex class with a function that show  a message "Welcome to Salesforce "
public class Seventhprogram {
    public static String method(){
        String str='welcome to Salesforce';
        return str;
    }
    public static void test(){
        String returnstring = method();
        System.debug(returnstring);
    }
}