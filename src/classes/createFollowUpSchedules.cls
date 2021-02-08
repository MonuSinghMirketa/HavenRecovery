/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* summary of this class.
*
* Creates 8 patient follow up records after patient gets discharged.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Anusha Prasad
* @created        2020-12-12
* 
**/

global class createFollowUpSchedules {
  
    @invocablemethod
    public static void createFollowUpRecords(List<Id> accountId){
        try{
    // Querying the Patient Name, Sales Rep and Discharge Date of the patient
    system.debug('pateint follow up creation class'+accountId);
    Account patientDetails = [Select id, name, Alumni_Rep__c, Account_Status__c, discharge_date__c from account where id in :accountId];
    
    // Querying the Schedule Frequency records 
    
    List<schedule_frequency__c> listOfSchedules = [select Counter_Number__c , Number_of_days__c from schedule_frequency__c];    
    
    // Creating list to store the Patient Follow Up records to be created
    
    List<Patient_Follow_Up__c> followUpRecordsToBeInserted = new List<Patient_Follow_Up__c>();
        
        // Iterating over Schedule frequency records to create Patient Follow Up records
        for(schedule_frequency__c scheduleFrequency:listOfSchedules){            
                Patient_Follow_Up__c followUp = new Patient_Follow_Up__c();
                
                Integer NumberOfDays = schedulefrequency.Number_of_days__c.intValue();
            
                followUp.Follow_Up_Counter__c = scheduleFrequency.Counter_Number__c;
                followUp.Follow_Up_Date__c = patientDetails.Discharge_date__C.addDays(NumberOfDays);
                followUp.Patient_Name__c = patientDetails.id;
                followUp.Rep_Name__c = patientDetails.Alumni_Rep__c;
            	followUp.Follow_Up_Status__c='Scheduled';
                followUpRecordsToBeInserted.add(followUp);
        }    
        
        insert followUpRecordsToBeInserted;

    }catch(NullPointerException e){
        System.debug('The error is in Line: '+ e.getLineNumber());
    }
    }

}