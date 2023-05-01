public class queableApexExample implements Queueable {
    public void execute(QueueableContext context) {
       	//queableApexExample.myFutureMethod();
       	system.debug('QueableMethod');
    }
     
}