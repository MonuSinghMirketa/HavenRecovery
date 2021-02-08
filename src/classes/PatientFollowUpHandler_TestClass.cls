@isTest(seeAllData=true)
public class PatientFollowUpHandler_TestClass {
    static testMethod void testMethod1(){
        Account acc1 = new Account();
        acc1.Name = 'Anu2sha_1';
        acc1.Discharge_Date__c = system.now();
        acc1.Account_Status__c = 'Admitted';
        insert acc1;
        
        acc1.Account_Status__c = 'Discharged';
        update acc1;
        
        List<Patient_follow_up__c> pt1 = [select id, patient_name__c,rep_name__c, follow_up_date__c, follow_up_counter__c,Follow_Up_Status__c from patient_follow_up__c where patient_name__c = :acc1.Id order by follow_up_date__c asc];
		
        for(Patient_follow_up__c pf1 : pt1){
            
            if(pf1.follow_Up_counter__c == 1){
                pf1.follow_up_date__c = pf1.follow_up_date__c.addDays(14);
                test.startTest();
                update pf1;
                test.stopTest();
            }
        }
        
    }
    
    static testMethod void testMethod2(){
        Account acc1 = new Account();
        acc1.Name = 'Pra3sad_5';
        acc1.Discharge_Date__c = system.now();
        acc1.Account_Status__c = 'Admitted';
        insert acc1;
        
        acc1.Account_Status__c = 'Discharged';
        update acc1;
        
        List<Patient_follow_up__c> pt1 = [select id, patient_name__c,rep_name__c, follow_up_date__c, follow_up_counter__c,Follow_Up_Status__c from patient_follow_up__c where patient_name__c = :acc1.Id order by follow_up_date__c asc];
		
        for(Patient_follow_up__c pf1 : pt1){
            
            if(pf1.follow_Up_counter__c == 1){
                pf1.follow_up_date__c = pf1.follow_up_date__c.addDays(34);
                test.startTest();
                update pf1;
                test.stopTest();
            }
        }
        
    }
    
    static testMethod void testMethod3(){
        Account acc1 = new Account();
        acc1.Name = 'Prat4eek_6';
        acc1.Discharge_Date__c = system.now();
        acc1.Account_Status__c = 'Admitted';
        insert acc1;
        
        acc1.Account_Status__c = 'Discharged';
        update acc1;
        
        List<Patient_follow_up__c> pt1 = [select id, patient_name__c,rep_name__c, follow_up_date__c, follow_up_counter__c,Follow_Up_Status__c from patient_follow_up__c where patient_name__c = :acc1.Id order by follow_up_date__c asc];
		
        for(Patient_follow_up__c pf1 : pt1){
            
            if(pf1.follow_Up_counter__c == 8){
                pf1.Follow_Up_Status__c = 'Completed';
                pf1.follow_up_date__c = pf1.follow_up_date__c.addDays(2);
                Test.startTest();
                update pf1;
                Test.stopTest();
            }
        }
        
    }
    
}