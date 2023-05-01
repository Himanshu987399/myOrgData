global class FutureClass
{
   @future
    public static void myFutureMethod()
    {   
       system.debug('methodCall'); 
        System.enqueueJob(new queableApexExample());
    }
}