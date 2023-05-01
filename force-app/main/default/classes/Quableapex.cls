public class Quableapex implements Queueable{
    public void execute(QueueableContext Qc){
        Account acc = new Account();
        acc.Name ='SharmaHimanshu';
        insert acc;
    }
}