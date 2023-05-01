public class contactTriggerhandler {
    public static void updateaccount(List<contact> conlist){
        System.debug(conlist);
        List<Account> acclist = [select id,name from account];
        List<account> accl= new List<Account>();
        for(Account acc : acclist){
            for(contact con : conlist){
                if(acc.id == con.accountid){
                    acc.name=acc.name+con.lastname;
                    accl.add(acc);
                }
            }
        }
        System.debug(accl);
        update accl;
    }
    public static void deletelastnameaccount(List<contact> oldcontactlist){
        List<Account> acclist = [select id,name from account];
        List<account> accl= new List<Account>();
        for(Account acc : acclist){
            for(contact con : oldcontactlist){
                if(acc.id == con.accountid){
                    acc.name=acc.name.removeEnd(con.lastname);
                    accl.add(acc);
                }
            }
        }
        System.debug(accl);
        update accl;
        
    }
    public static void updateAccountName(List<contact> newContactList){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : newContactList){
            accountIds.add(con.accountId);
        }
        List<Account> accData = new List<Account>();
        List<Account> acc = [select id,Name from Account where id =:accountIds];
        for(Contact con : newContactList){
            for(Account accList : acc){
                if(accList.id == con.AccountId){
                    Account accInstance = new Account();
                    accInstance.Id = accList.id;
                    accInstance.Name = accList.Name+' '+con.LastName;
                    accData.add(accInstance);
                }
            }
        }
        if(accData.size() != 0){
            update accData;
        }
    }
}