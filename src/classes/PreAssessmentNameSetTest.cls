@isTest
public class PreAssessmentNameSetTest {

    @isTest
    private static void testPreassessmentTrigger(){
        //insert opportunity
        Account ac = new Account(Name ='TestAccount1');
        insert ac;
        Opportunity opp = new Opportunity(Name='TestOpp1',StageName='Prospect',CloseDate=Date.today(),AccountId=ac.id,
                                         Patient_First_Name__c='P1Test',Patient_Last_Name__c='Matt',Middle_Name__c='MidName',Preferred_Name__c='PrName',
                                         Emergency_Contact_Name__c='MamtaTest',Emergency_Contact_Phone__c='9050548990');
        insert opp;
        Pre_Admission_Assessment__c preassess= new Pre_Admission_Assessment__c(Name ='Preassess1',Opportunity__c=opp.id);
        insert preassess;
      
    }
}