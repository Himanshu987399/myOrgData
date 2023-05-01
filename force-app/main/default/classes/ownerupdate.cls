public class ownerupdate {
    public static void test(List<Account> newlist,List<Account> oldlist){
        List<contact> conlist = [select id,ownerid ,accountid,lastname from contact where Accountid IN: newlist];
        List<contact> concheck = new List<Contact>();
        for(Account acc : newlist){
            for(Account acc1 : oldlist){
                if(acc.ownerid != acc1.ownerid){
                    for(contact con: conlist){
                        con.OwnerId = acc.OwnerId;
                        concheck.add(con);
                    }
                }
            }
        }
        if(concheck.size()!=0){
            update concheck;
        }
    }
    public static void test1(List<Account> oldaccount){
        List<contact> conlist =[select id,accountid, lastname from contact where accountid in: oldaccount];
        for(Account acc : oldaccount){
            if(conlist.size()!=0){
                acc.adderror('Contact associated with this account');
            }
        }
        
    }
    public static void total_no_of_contact(List<Account> newaccount){
        system.debug(newaccount);
        List<contact> conlist = [select id,accountid from contact where accountid IN: newaccount];
        map<id,integer> maplist = new map<id,integer>();
        for(contact con:conlist){
            if(!maplist.containsKey(con.AccountId)){
                maplist.put(con.AccountId, 1);
            }
            else{
                integer count = maplist.get(con.AccountId);
                maplist.put(con.AccountId, ++count);
            }
        }
        system.debug(maplist);
        List<account> acccheck = new List<Account>();
        for(Account acc : newaccount){
            acc.Total_no_of_contact__c	= maplist.get(acc.id);
            acccheck.add(acc);
        }
        system.debug(acccheck);
        update acccheck;
    }
    public static void billing(List<Account> newac,List<Account> oldac){
        List<Contact> conlist = [select id,Mailingcity,accountid from contact where accountid IN: newac ];
        List<contact> concheck = new List<contact>();
        for(Account acc: newac){
            for(Account bnn: oldac){
                if(acc.BillingCity != bnn.BillingCity ){
                    for(Contact conl : conlist){
                        conl.Mailingcity = acc.BillingCity;
                        concheck.add(conl);
                    }
                }
            }
        }
        if(concheck.size() !=0){
            system.debug(concheck);
            update concheck;
        }
    }
}