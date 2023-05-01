public class mergtwoaccount {
    public static void test001(list<Account> newaccount,list<account> oldaccount){
        system.debug('hii');
        List<Account> acc=[select id from account where name ='merg2'];
        List<contact> con =[select id,accountid from contact where accountid IN: acc];
        List<contact> conlist = new list<contact>();
        for(Contact conl:con){
            for(Account accl: newaccount){
                if(conl.AccountId!=accl.id){
                    conl.AccountId=accl.id;
                    conlist.add(conl);
                    
                }
            }
        }
        if(conlist.size()!=0){
            update conlist;
        }
        delete acc;
    }
    public static void test002(list<Account> acclist01){
        System.debug('everything ok');
    }
}