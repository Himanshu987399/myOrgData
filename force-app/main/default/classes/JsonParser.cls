public class JsonParser{
        public String submissionTime{get;set;}
        public bankData bankData{get;set;}
        public String reference{get;set;}
        public list<decisionMetrics> decisionMetrics{get;set;}
        public Integer dataVersion{get;set;}
        public class userAddress{
            public String streetName{get;set;}
            public String streetNumber{get;set;}
            public String streetType{get;set;}
            public String unitType{get;set;}
            public String suburb{get;set;}
            public String unitNumber{get;set;}
            public String stateCode{get;set;}
            public String levelType{get;set;}
            public String state{get;set;}
            public String levelNumber{get;set;}
            public String postcode{get;set;}
            public String streetLine{get;set;}
            public String countryCode{get;set;}
            public String text{get;set;}
        }
        public class transactions{
            public Decimal amount{get;set;}
            public list<tags> tags{get;set;}
           
            public String type{get;set;}
            public String text{get;set;}
            public String balance{get;set;}            
        }
        public class transactionGroups{
            public list<analysisPoints> analysisPoints{get;set;}
            public list<transactions> transactions{get;set;}
            public String name{get;set;}
        }
        public class tags{
            public String thirdParty{get;set;}
            public String pending{get;set;}
        }
        public class statementSummary{
            public String transactionsEndDate{get;set;}
            public String searchPeriodEnd{get;set;}
            public String transactionsStartDate{get;set;}
            public String searchPeriodStart{get;set;}
            public Integer daysInNegative{get;set;}
            public String minDayEndBalance{get;set;}
            public String totalDebits{get;set;}
            public String closingBalance{get;set;}
            public String totalCredits{get;set;}
            public String minBalance{get;set;}
            public String openingBalance{get;set;}
        }
        public class statementAnalysis{
            public analysisCategory analysisCategory{get;set;}
        }
        public class decisionMetrics{
            public String name{get;set;}
            public String type{get;set;}
            public String descriptor{get;set;}
            public String value{get;set;}
            public String id{get;set;}
        }
        public class dayEndBalances{
            
            public String balance{get;set;}
        }
        public class bankData{
            public list<bankAccounts> bankAccounts{get;set;}
            public String bankSlug{get;set;}
            public userAddress userAddress{get;set;}
            public String bankName{get;set;}
        }
        public class bankAccounts{
            public list<dayEndBalances> dayEndBalances{get;set;}
            public String accountNumber{get;set;}
            public String currentBalance{get;set;}
            public String bsb{get;set;}
            public String availableBalance{get;set;}
            public String accountName{get;set;}
            public list<transactions> transactions{get;set;}
            public String accountHolderType{get;set;}
            public statementSummary statementSummary{get;set;}
            public String accountHolder{get;set;}
            public additionalDetails additionalDetails{get;set;}
            public String accountType{get;set;}
            public list<statementAnalysis> statementAnalysis{get;set;}
            public Integer id{get;set;}
        }
        public class analysisPoints{
            public String name{get;set;}
            public String title{get;set;}
            public String type{get;set;}
            public String value{get;set;}
           
        }
        public class analysisCategory{
            public list<analysisPoints> analysisPoints{get;set;}
            public list<transactionGroups> transactionGroups{get;set;}
            public String name{get;set;}
        }
        public class additionalDetails{
            public String phone{get;set;}
            public String openDate{get;set;}
            public String email{get;set;}
            public accountAddress accountAddress{get;set;}
            public String interestRate{get;set;}
        }
        public class accountAddress{
            public String stateCode{get;set;}
            public String streetNumber{get;set;}
            public String streetName{get;set;}
            public String unitType{get;set;}
            public String streetType{get;set;}
            public String unitNumber{get;set;}
            public String suburb{get;set;}
            public String levelType{get;set;}
            public String state{get;set;}
            public String levelNumber{get;set;}
            public String postcode{get;set;}
            public String streetLine{get;set;}
            public String countryCode{get;set;}
            public String text{get;set;}
        }
    }