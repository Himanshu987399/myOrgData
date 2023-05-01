/*Job Title:
Executive: 10 points
Manager: 7 points
Staff: 5 points
Other: 3 points
Industry:
Technology: 10 points
Healthcare: 8 points
Finance: 6 points
Other: 4 points
Company Size:
Large: 10 points
Medium: 7 points
Small: 5 points
Other: 3 points
Location:
North America: 10 points
Europe: 8 points
Asia: 6 points
Other: 4 points*/
public class leadTriggerHandler {
    public static void countLeadScore(List<Lead> newLeadList){
        List<Lead_Score__c> leadScoreList = new List<Lead_Score__c>();
        for(Lead LeadInstance : newLeadList){
      		Lead_Score__c leadScoreInstance = new Lead_Score__c();
  			leadScoreInstance.Lead__c = LeadInstance.Id;
            leadScoreInstance.Name = LeadInstance.FirstName;
            Integer totalScore = 0;
            if(LeadInstance.job_Title__c != ''){
                if(LeadInstance.job_Title__c == 'Executive'){
                    totalScore =+10;
                }
                if(LeadInstance.job_Title__c == 'Manager'){
                    totalScore =+7;
                }
              	if(LeadInstance.job_Title__c == 'Staff'){
                    totalScore =+5;
                }
                if(LeadInstance.job_Title__c == 'Other'){
                    totalScore =+3;
                }
            }
            if(LeadInstance.Industry != ''){
                if(LeadInstance.Industry == 'Technology'){
                    totalScore += 10;
                }if(LeadInstance.Industry == 'Healthcare'){
                    totalScore += 8;
                }if(LeadInstance.Industry == 'Finance'){
                    totalScore += 6;
                }if(LeadInstance.Industry == 'Other'){
                    totalScore += 4;
                }
            }
            if(LeadInstance.Company_size__c != ''){
                if(LeadInstance.Company_size__c == 'Large'){
                    totalScore += 10;
                }if(LeadInstance.Company_size__c == 'Medium'){
                    totalScore += 7;
                }if(LeadInstance.Company_size__c == 'Small'){
                    totalScore += 5;
                }if(LeadInstance.Company_size__c == 'Other'){
                    totalScore += 3;
                }
            }
            if(LeadInstance.Location__c != ''){
                if(LeadInstance.Location__c == 'North America'){
                    totalScore += 10;
                }if(LeadInstance.Location__c == 'Europe'){
                    totalScore += 8;
                }if(LeadInstance.Location__c == 'Asia'){
                    totalScore += 6;
                }if(LeadInstance.Location__c == 'Other'){
                    totalScore += 4;
                }
            }
            leadScoreInstance.Lead_Score__c = totalScore;
            if(totalScore < 10){
                leadScoreInstance.Lead_Status__c = 'Not Qualified';
            }else if(totalScore < 20){
                leadScoreInstance.Lead_Status__c = 'Contacted';
            }else{
                leadScoreInstance.Lead_Status__c = 'Qualified';
            }
            leadScoreList.add(leadScoreInstance);
        }
        if(leadScoreList.size() != 0){
            system.debug('leadScoreList--->'+leadScoreList);
            insert leadScoreList;
        }
    }
}