/*"3. Create three custom objects:
       1. Train.(Fileds{Name})
       2. Passenger.(Fields{Name,Phone})
       3. Reservation.(Fields{TrainId,PassengerId,ReservationDate,DestinationFrom,DestinationTo}) .

    WAT to restrict a passenger to apply for reservation for same day and for same train"/*/
public class test003 {
    public static void test(List<Reservation__c> newlist){
        List<Reservation__c> revlist = [select id,reservationdate__c,Passengerid__c,Trainid__c from Reservation__c];
        for(Reservation__c rev : newlist){
            for(Reservation__c rev2 : revlist){
                if(rev.reservationdate__c == rev2.reservationdate__c && rev.Passengerid__c==rev2.Passengerid__c && rev.Trainid__c==rev2.Trainid__c){
                    rev.addError('You are not able to booked your reservation');
                }
            }
        }
    }
}