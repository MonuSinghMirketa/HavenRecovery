@isTest
public class VobCreationOnOpportunityTest {

    @isTest
    private static void testVOBCreateOnOpportunityInsertAndUpdate(){
        //first insert account
        Account ac = new Account(Name='TestAccount1');
        insert ac;
        
        //insert opportunity-cover after insert scenerio
        MultipleTriggerCalls.isVobCreated =true;
        Opportunity opp = new Opportunity(Name='TestOpportunity1',StageName='Prospect',CloseDate=Date.today(),Primary_Insurance__c=true,Secondary_Insurance__c=true);
        opp.Subscriber_First_Name__c = 'SUBFIRST1';
        opp.Subscriber_Last_Name__c ='SUBLAST1';
        opp.Secondary_Ins_Subscriber_First_Name__c ='SUBFIRST2';
        opp.Secondary_Ins_Sub_Last_Name__c = 'SUBLAST2';
        opp.Subscriber_Street_Address__c = 'STREET1';
        opp.Subscriber_Address__c = 'Address1';
        opp.Subscriber_Address2__c = 'Address2';
        opp.Subscriber_City__c = 'TESTCity';
        opp.Subscriber_State__c = 'Alabama';
        opp.Subscriber_Zip__c = '90008';
        insert opp;
         MultipleTriggerCalls.isVobCreated =true;
        
        //insert new opportunity - to cover after update scenerio
       // Opportunity oppUpdate = new Opportunity(Name='TestOpportunity2',StageName='Prospect',CloseDate=Date.today());
       // insert oppUpdate;
        opp.Primary_Insurance__c = true;
        opp.Secondary_Insurance__c = true;
        opp.Subscriber_First_Name__c = 'SUBFIRST1';
        opp.Subscriber_Last_Name__c ='SUBLAST1';
        opp.Secondary_Ins_Subscriber_First_Name__c ='SUBFIRST2';
        opp.Secondary_Ins_Sub_Last_Name__c = 'SUBLAST2';
        opp.Subscriber_Street_Address__c = 'STREET1';
        opp.Subscriber_Address__c = 'Address1';
        opp.Subscriber_Address2__c = 'Address2';
        opp.Subscriber_City__c = 'TESTCity';
        opp.Subscriber_State__c = 'Alabama';
        opp.Subscriber_Zip__c = '90008';
        Test.startTest();
        MultipleTriggerCalls.isVobCreated =true;
        update opp;
        Test.stopTest();
    }
}