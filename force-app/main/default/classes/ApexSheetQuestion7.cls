public class ApexSheetQuestion7 {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        
        return [SELECT Name ,ID,AccountNumber,Phone,Rating FROM Account];
        
    }
    

}