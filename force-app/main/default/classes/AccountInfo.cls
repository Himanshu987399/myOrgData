public class AccountInfo {
    public String type;
    public String url;
    public String Name;
    public String AccountNumber;
    public static void tested(){
            String jsonString = '[{"attributes":{"type":"Account","url":"/services/data/v56.0/sobjects/Account/0015j00000tRkslAAC"},"Name":"HimSha4","AccountNumber":null},{"attributes":{"type":"Account","url":"/services/data/v56.0/sobjects/Account/0015j00000tRksmAAC"},"Name":"HimSha3","AccountNumber":null}]';
List<AccountInfo> accountList = (List<AccountInfo>) JSON.deserialize(jsonString, List<AccountInfo>.class);
        
        for(AccountInfo acc:accountList ){
            system.debug('acc__'+acc);
        }
    }


}