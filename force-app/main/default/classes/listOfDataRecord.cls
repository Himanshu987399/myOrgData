public class listOfDataRecord {
    @AuraEnabled
    public static List<Job_Application__c> getRecords(String name){
        string query = 'Select Id,Name,Date_applied__c,Email__c,Notes__c from Job_Application__c where Name like '+'\''+'%'+name+'%'+'\'';
        List<Job_Application__c> jobApplicationList = new List<Job_Application__c>();
        jobApplicationList = Database.query(query);
        return jobApplicationList;
    }
    @AuraEnabled
    public static List<Job_Application__c> getAllRecords(){
        string query = 'Select Id,Name,Date_applied__c,Email__c,Notes__c from Job_Application__c ';
        List<Job_Application__c> jobApplicationList = new List<Job_Application__c>();
        jobApplicationList = Database.query(query);
        return jobApplicationList;
    }
}