global class dsk implements Schedulable {
    global void execute(SchedulableContext SC) {
        Account acc = new Account();
        acc.name='Himanshuapexschedular001112';
        
        insert acc;
        System.debug(acc);
    }
}