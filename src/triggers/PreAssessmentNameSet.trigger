trigger PreAssessmentNameSet on Pre_Admission_Assessment__c (before insert) {

   
    if(trigger.isInsert && trigger.isBefore){
        Integer childRecordsSize = 0;
        for(Pre_Admission_Assessment__c ad: trigger.new){
            system.debug('aaa' +ad);
            //List<Pre_Admission_Assessment__c> childRecords = [select id,Name,Opportunity__c from Pre_Admission_Assessment__c where Opportunity__c=:ad.Opportunity__c];
            List<Opportunity> opp = [select id,Name,Patient_First_Name__c,Patient_Last_Name__c,Middle_Name__c,Preferred_Name__c,Emergency_Contact_Name__c,
                                     Emergency_Contact_Phone__c,(select id,Name from Pre_Admission_Assessments__r) from Opportunity where id=:ad.Opportunity__c];
            
            childRecordsSize = opp[0].Pre_Admission_Assessments__r.size();
            integer i = childRecordsSize +1;
            ad.Name = opp[0].Name +' '+ i;
            ad.First_Name__c = opp[0].Patient_First_Name__c;
            ad.Last_Name__c = opp[0].Patient_Last_Name__c;
            ad.Middle_Name__c = opp[0].Middle_Name__c;
            ad.Preferred_Name__c = opp[0].Preferred_Name__c;
        	ad.Emergency_Contact_Name__c = opp[0].Emergency_Contact_Name__c;
            ad.Emergency_Contact_Phone__c = opp[0].Emergency_Contact_Phone__c;
            
        }
        
    }
}