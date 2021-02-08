/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* summary of this Trigger.
*
* Fires when Alumni Rep updates the patient follow up records.
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Anusha Prasad
* @created        2020-12-12
* 
**/
trigger updateFollowUpTrigger on Patient_Follow_Up__c (after update) {
    
    if(!UtilClassToControlRecursion.HasAfterUpdateTriggerCalled()){
        UtilClassToControlRecursion.SetAfterUpdateTriggerCalled();
        
        UpdatePatientFollowUpRecordsHandler handler = new UpdatePatientFollowUpRecordsHandler();
        
        handler.createAccountMap();
        handler.createPatientFollowUpMap();
        handler.updatePatientFollowUpRecords(Trigger.New, Trigger.OldMap);
    }
}