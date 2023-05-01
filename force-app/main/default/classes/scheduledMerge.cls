global class scheduledMerge implements Schedulable {
    global void execute(SchedulableContext SC) {
        Account acc = new Account();
        acc.name='Himanshuapexschedular001';
        
        insert acc;
        System.debug(acc);
    }
}