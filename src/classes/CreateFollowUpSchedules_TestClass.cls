@isTest(seeAllData=true)
public class CreateFollowUpSchedules_TestClass {

        static testMethod void testingMethod(){
        Account acc1 = new Account();
        acc1.name = 'Mirketa_Test_Patient_FollowUpcreate';
        acc1.discharge_date__c = system.now();
        acc1.Account_Status__c ='Admitted';
        insert acc1;
        
    	acc1.Account_Status__c = 'Discharged';
    	update acc1;
        
        acc1.Account_Status__c ='Admitted';
        update acc1;
        
        
    }  
    
}