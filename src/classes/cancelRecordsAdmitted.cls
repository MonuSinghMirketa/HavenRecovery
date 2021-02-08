/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* summary of this class.
*
* Deletes unsuccessful patient follow up records when the same patient admits again.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Anusha Prasad
* @created        2020-12-12
* 
**/
global class cancelRecordsAdmitted {
    @invocableMethod
    public static void deleteCancelledRecords(List<ID> accountId){
        List<Patient_Follow_Up__c> cancelledRecords = new List<Patient_Follow_Up__c>();
        cancelledRecords = [select id, patient_name__c from Patient_Follow_Up__c where patient_name__c =:accountId and Follow_Up_Status__c='Unsuccessful'];
        delete cancelledRecords;
        
    }
    

}