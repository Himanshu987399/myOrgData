public with sharing class firstpagevf {
    
    public firstpagevf()
    {
        
    }
    public list<SelectOption> getlistoption(){
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('INDIA','INDIA'));
            options.add(new SelectOption('US','US'));
            options.add(new SelectOption('BRAZIL','BRAZIL'));
            return options;
        
        
    }
}