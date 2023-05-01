// WAP to enter a startDate='06:07:55 2-jan-2016' & endDate='07:08:55 5-feb-2016' and display the difference between two dates in Years, months, days, hours, minutes,seconds.
public class Apex18 {
    public static void test(){
        Datetime startdate = Datetime.newInstanceGmt(2016, 01, 02, 06, 07, 55);
        Datetime endate = Datetime.newInstanceGmt(2016, 02, 05, 07, 08, 55);
        Integer second =endate.second()-startdate.second();
        Integer min = endate.minute()-startdate.minute();
        Integer hour =endate.hour()-startdate.hour();
        integer day = endate.day()-startdate.day();
        Integer month = endate.month()-startdate.month();
        Integer year = endate.year()-startdate.year();
        System.debug(year+':'+month+':'+day+'T'+hour+':'+min+':'+second);
    }
    
}