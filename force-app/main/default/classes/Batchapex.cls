global class Batchapex implements Database.Batchable<sObject>{
    public String Query;
    
   //public ForBatchClass(String q){
       // Query = q;
        
//}

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
         
        String query = 'SELECT Id, Name FROM Account limit 1';
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
        // process each batch of records default size is 200
        for(Account acc : accList) {        
            // Update the Account Name 
            acc.Name = acc.Name + 'karam';
        }
        try {
            // Update the Account Record
            System.debug('accList====='+accList);
            update accList;
         
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        system.debug('hi');
        // execute any post-processing operations like sending email
    }
    
}