public class batch implements Database.batchable<sobject>{ 
   public List<sobject> start(Database.BatchableContext info){ 
      system.debug('INFO---?'+info);
       List<Account> acc = new List<account>();
       return acc;
   }     
   public void execute(Database.BatchableContext info, List<Sobject> scope){
      
   }     
   public void finish(Database.BatchableContext info){     
   } 
}