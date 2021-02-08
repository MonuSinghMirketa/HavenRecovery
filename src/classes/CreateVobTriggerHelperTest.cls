@isTest
public class CreateVobTriggerHelperTest {

    @isTest
    public static void testVOBfrmLead(){
        Account ac = new Account(Name ='Referral_Test');
        insert ac;
        lead newLead = new lead(lastName ='Testlead1',Referred_By__c = ac.id,Status ='Pending',Primary_Insurance__c=true,Secondary_Insurance__c=true
                               );
        newLead.Patient_SSN__c ='1122';
        newLead.DOB__c = Date.valueOf('1997-02-02');
        newLead.Phone = '9867787898';
        newLead.Patient_SSN__c ='901';
        newLead.City = 'West Palm Beach';
        newLead.Street = '123 Datura Street';
       // newLead.State = 'FL';
        newLead.PostalCode ='133035';
        newLead.Gender__c ='Male';
        newLead.Email = 'testemail1@gmail.com';
        //newLead.LeadSource = 'Readmit';
        
        newLead.Insurance_Company_Name__c ='TestMNC';
        newLead.Insurance_Phone__c = '9998887776';
        newLead.Member_ID_Number__c ='111';
        newLead.Group_Number__c = '100';
        newLead.Subscriber_Address__c = 'ABC,CA 129,USA';
        newLead.Subscriber_City__c = 'LANE 11';
        newLead.Subscriber_DOB__c = Date.valueOf('1995-02-02');
        newLead.Subscriber_Employer__c = 'TestEmp1';
        newLead.Subscriber_Email__c = 'testmamta@gmail.com';
        newLead.Subscriber_Name__c ='Annie Grey';
        newLead.Subscriber_Phone__c = '1122334421';
        newLead.Subscriber_Relationship__c = 'self';
        
        newLead.Secondary_Insurance_Company__c = 'TestMNC2';
        newLead.Secondary_Insurance_Phone_Number__c = '5456782310';
        newLead.Secondary_Ins_Member_ID__c ='23';
        newLead.Secondary_Ins_Group_No__c ='78';
        newLead.Secondary_Ins_Subscriber_Address__c = 'MG,Test 10, IND';
        newLead.Secondary_Ins_Subscriber_Employer__c = 'SecondaryEmpTest';
        newLead.Secondary_Ins_Sub_DOB__c = Date.valueOf('1994-02-10');
        newLead.Secondary_Ins_Sub_email__c = 'testsecmamta@gmail.com';
        newLead.Secondary_Ins_Sub_Phone__c = '5456782310';
        newLead.Secondary_Ins_Sub_Last_Name__c = 'Manny';
        newLead.Secondary_Ins_Subscriber_first_name__c ='Ranni';
        
        
        
        Test.startTest();
        
        insert newLead;
        
        
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(newLead.id);
        
        LeadStatus convertStatus =[SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        Map<id,Lead> mp= new Map<id,Lead>();
        mp.put(lcr.getOpportunityId(), newLead);
        CreateVobTriggerHelper.oppIDLeadMap = mp;
        MultipleTriggerCalls.isVobCreated =true;
        system.debug('err '+ lcr.getErrors());
        system.debug('err '+ lcr);

        system.assert(lcr.isSuccess());
        Test.stopTest();
        
    }
}