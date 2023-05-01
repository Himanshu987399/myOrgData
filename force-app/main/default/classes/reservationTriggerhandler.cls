public class reservationTriggerhandler {
    public static void generateError(List<reservation__c> newList){
        set<Id> passengerId = new set<Id>();
        set<Id> trainId = new set<Id>();
        for(reservation__c res:newList){
            if(res.Trainid__c != null){
                trainId.add(res.Trainid__c);
            }
            if(res.Passengerid__c != null){
                passengerId.add(res.Passengerid__c);
            }
        }
        List<reservation__c> reservationData = [select id,Trainid__c,Passengerid__c,reservationdate__c from reservation__c where Trainid__c =:trainId and Passengerid__c =: passengerId];
        if(reservationData.size() != 0){
            for(reservation__c rev : newList){
                if(rev.Passengerid__c != null && rev.Trainid__c != null){
                    for(reservation__c reserve : reservationData){
                        if(rev.Passengerid__c == reserve.Passengerid__c && rev.Trainid__c == reserve.TrainId__c && rev.reservationdate__c == reserve.reservationdate__c){
                            rev.addError('You cannot apply for reservation because your reservation is already done for same date ');
                        }
                    }
                }
            }
        }
    }
}