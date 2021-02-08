/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* summary of this class.
*
* Counter logic for patient follow up records
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Anusha Prasad
* @created        2020-12-12
* 
**/

public class updatePatientFollowUpRecordsHandler {
    	
    // List of patient follow up records to be updated 
    List<Patient_Follow_Up__C> finalListOfFollowUpToUpdate = new List<Patient_Follow_Up__c>();         
	// List of patient follow up records to be cancelled 
    List<Patient_Follow_Up__c> patientFollowUpRecordsToBeCancelled = new List<Patient_Follow_Up__c>();
    // List of patient follow up records to be created 
    List<Patient_Follow_Up__c> patientFollowUpRecordsToBeCreated = new List<Patient_Follow_Up__c>();
    
    // List of patient follow up records to be deleted 
    List<Patient_Follow_Up__c> patientFolloupToBeDeleted = new List<Patient_Follow_Up__c>();
       
    // Map to store patient account details with Id as key and patient account as value
    Map<Id,Account> accountMap = new Map<Id,Account>();
    
    // Map to store Patient Id as key and List of Patient Follow Up records as value
    Map<Id, List<Patient_Follow_Up__c>> accountFollowUps = new Map<Id, List<Patient_Follow_Up__c>>();
    
    // Method to populate  account map
    public void createAccountMap(){
        for(Account accMap : [Select Id, Discharge_Date__c From Account Limit 49999]){
        	accountMap.put(accMap.Id, accMap);    
        }
        
    }
    
    // Method to populate patient follow up map
    public void createPatientFollowUpMap(){
    	for(Patient_Follow_Up__c accountFollow : [SELECT id, patient_name__c, Follow_up_counter__c, follow_up_date__c FROM Patient_Follow_Up__c where Follow_Up_Status__c != 'Completed' order by follow_up_date__c asc LIMIT 49999]) {
            if(accountFollowUps.containsKey(accountFollow.patient_name__c)) {
                List<Patient_Follow_Up__c> followUpList = accountFollowUps.get(accountFollow.patient_name__c);
                followUpList.add(accountFollow);
                accountFollowUps.put(accountFollow.patient_name__c, followUpList);
            } 
            else {
            	accountFollowUps.put(accountFollow.patient_name__c, new List<Patient_Follow_Up__c> { accountFollow });
            }
		}
    }
    
    // Method to update the patient follow up records based on business logic
    public void updatePatientFollowUpRecords(List<Patient_Follow_Up__c> beingUpdatedPatientFollowUp, Map<Id, Patient_Follow_Up__c> patientFollowUpOldMap){
        
        for(Patient_Follow_Up__c patientFollowUp :beingUpdatedPatientFollowUp){
            
            // Old value of the Follow Up Date which got modified
            Patient_follow_up__c oldValuesFollowUpRecord = patientFollowUpOldMap.get(patientFollowUp.id); 
                
            Account patientAccount = accountMap.get(patientFollowUp.Patient_Name__c);
                
           	// Discharge date of patient
            DateTime dischargeDate = patientAccount.discharge_Date__C;
            system.debug('Discharge Date +++'+dischargeDate);
                
            //Querying the list of all Patient follow Up records which are scheduled for after the current follow up  
            List<Patient_Follow_Up__c> listOfPatientFollowUps = new List<Patient_Follow_Up__C>();
            
            // Fetch the patient follow up records for particular patient from map
            List<Patient_Follow_Up__c> tempFollowUpResultFromMap = new List<Patient_Follow_Up__C>();
            tempFollowUpResultFromMap = accountFollowUps.get(patientFollowUp.patient_name__c);
            
            for(Patient_Follow_Up__c tempFollowUp: tempFollowUpResultFromMap){
                if(tempFollowUp.follow_up_counter__c > 
                   patientFollowUp.follow_up_counter__c){
                    listOfPatientFollowUps.add(tempFollowUp);
                }
            }
            
            //listOfPatientFollowUps = [select id, patient_name__c, Follow_up_counter__c, follow_up_date__c from patients_follow_up__c where patient_name__c =:patientFollowUp.patient_name__c and follow_up_counter__C > :patientFollowUp.Follow_up_counter__c order by follow_up_date__c asc];
            system.debug('list of follow ups to be updated'+listOfPatientFollowUps);
            
            if((patientFollowUp.Follow_Up_Counter__c == 9) || (patientFollowUp.Follow_Up_Counter__c == 8 && patientFollowUp.Follow_Up_Status__c == 'Completed')){                
                // creating one new patient follow up records based on 2 weeks difference 
            	Patient_Follow_Up__c toBeCreatedWithCounter9 = new Patient_Follow_Up__c();
                toBeCreatedWithCounter9.Patient_Name__c = patientFollowUp.Patient_Name__c;
                toBeCreatedWithCounter9.Rep_Name__c = patientFollowUp.Rep_Name__c;
                toBeCreatedWithCounter9.Follow_Up_Counter__c = 9;
                toBeCreatedWithCounter9.Follow_Up_Date__c = patientFollowUp.Follow_Up_Date__c.addDays(14);
                toBeCreatedWithCounter9.Follow_Up_Status__c = 'Scheduled';
                patientFollowUpRecordsToBeCreated.add(toBeCreatedWithCounter9);
                
                // updating the remaining ones as Cancelled
                                
                List<Patient_Follow_Up__c> toBeCancelled = new List<Patient_Follow_Up__c>();
                
                // Fetch the patient follow up records for particular patient from map
            	List<Patient_Follow_Up__c> tempFollowUpResultFromMapCancelled2 = new List<Patient_Follow_Up__C>();
            	tempFollowUpResultFromMapCancelled2 = accountFollowUps.get(oldValuesFollowUpRecord.patient_name__c);
            
                for(Patient_Follow_Up__c tempFollowUp2: tempFollowUpResultFromMapCancelled2){
                    if(tempFollowUp2.follow_up_counter__c > oldValuesFollowUpRecord.follow_up_counter__c){
                    	toBeCancelled.add(tempFollowUp2);
                       // patientFolloupToBeDeleted.add(tempFollowUp2);
                	}
                }
                
                //toBeCancelled = [select id, follow_up_date__c,follow_up_counter__c from patients_follow_up__c where follow_up_date__c > :oldValuesFollowUpRecord.follow_up_date__c];
                for(Patient_Follow_Up__c followUpsToBeCancelled : toBeCancelled){
                    if(patientFollowUp.id != followUpsToBeCancelled.id){
                        followUpsToBeCancelled.Follow_Up_Status__c = 'Unsuccessful';
                        patientFollowUpRecordsToBeCancelled.add(followUpsToBeCancelled);
                        patientFolloupToBeDeleted.add(followUpsToBeCancelled);
                    }    
                }
                
            }   
        	else {
            	// Checking if the follow up date has changed on the record being updated
                if(patientFollowUp.Follow_Up_Date__c != oldValuesFollowUpRecord.Follow_Up_Date__c){
                    
                    // if the follow up date updated on Patient Follow Up record itself is greater than 1 month from discharge date     
                    if(patientFollowUp.Follow_Up_Date__c > dischargeDate.addMonths(1) && patientFollowUp.Follow_Up_Counter__c != 9){
                        
                        // for Cancelling all of patient follow up records 
                        for(Patient_Follow_Up__c followUpsToBeCancelled : listOfPatientFollowUps){
                            followUpsToBeCancelled.Follow_Up_Status__c = 'Unsuccessful';
                            patientFollowUpRecordsToBeCancelled.add(followUpsToBeCancelled);
                            patientFolloupToBeDeleted.add(followUpsToBeCancelled);
                        }
                        
                        // create one new patient follow up records based on 2 weeks difference
                        for(integer i=1; i<2; i++){
                            Patient_Follow_Up__c toBeCreated = new Patient_Follow_Up__c();
                            toBeCreated.Patient_Name__c = patientFollowUp.Patient_Name__c;
                            toBeCreated.Rep_Name__c = patientFollowUp.Rep_Name__c;
                            toBeCreated.Follow_Up_Counter__c = 9;
                            toBeCreated.Follow_Up_Date__c = patientFollowUp.Follow_Up_Date__c.addDays(14);
                            toBeCreated.Follow_Up_Status__c = 'Scheduled';
                            patientFollowUpRecordsToBeCreated.add(toBeCreated);
                        }
                        
                    }
                    
                    else{                    
                        
                        system.debug('Else Block +++');
                        Date oldFollowUpDate = date.valueOf(oldValuesFollowUpRecord.Follow_Up_Date__c);
                        Date newFollowUpDate = date.valueOf(patientFollowUp.Follow_Up_Date__c);
                        
                        Integer numberOfDaysChanged = oldFollowUpDate.daysBetween(newFollowUpdate);
                        system.debug('Difference between days'+numberOfDaysChanged);
                        
                        For(Patient_Follow_Up__c followUpToUpdate: listOfPatientFollowUps){
                                                
                            followUpToUpdate.Follow_Up_Date__c = followUpToUpdate.Follow_Up_Date__c.addDays(numberOfDaysChanged);
                            
                            if(followUpToUpdate.Follow_Up_Date__c > dischargeDate.addMonths(1)){
                                
                                // updating the first patient follow up record which has follow up date greater than one month post discharge date which got updated
                                finalListOfFollowUpToUpdate.add(followUpToUpdate);
                                
                                // creating one new patient follow up records based on 2 weeks difference 
                                Patient_Follow_Up__c createFollowUp = new Patient_Follow_Up__C();
                                createFollowUp.Patient_Name__c = patientFollowUp.Patient_Name__c;
                                createFollowUp.Rep_Name__c = patientFollowUp.Rep_Name__c;
                                createFollowUp.Follow_Up_Counter__c = 9;
                                createFollowUp.Follow_Up_Date__c = followUpToUpdate.Follow_Up_Date__c.addDays(14);
                                createFollowUp.Follow_Up_Status__c = 'Scheduled';
                                patientFollowUpRecordsToBeCreated.add(createFollowUp);
                                
                                // update the remaining ones as Cancelled
                                
                                List<Patient_Follow_Up__c> toBeCancelled = new List<Patient_Follow_Up__c>();
                                // Fetch the patient follow up records for particular patient from map
            					List<Patient_Follow_Up__c> tempFollowUpResultFromMapCancelled1 = new List<Patient_Follow_Up__C>();
            					tempFollowUpResultFromMapCancelled1 = accountFollowUps.get(followUpToUpdate.patient_name__c);
            
                                for(Patient_Follow_Up__c tempFollowUp1: tempFollowUpResultFromMapCancelled1){
                                    if(tempFollowUp1.follow_up_counter__c > followUpToUpdate.follow_up_counter__c){
                                        toBeCancelled.add(tempFollowUp1);
                                    }
                                }
                                                  
                                // toBeCancelled = [select id, follow_up_date__c,follow_up_counter__c from patients_follow_up__c where follow_up_counter__c > :followUpToUpdate.Follow_Up_Counter__c];
                                for(Patient_Follow_Up__c followUpsToBeCancelled : toBeCancelled){
                                    followUpsToBeCancelled.Follow_Up_Status__c = 'Unsuccessful';
                                    patientFollowUpRecordsToBeCancelled.add(followUpsToBeCancelled);
                                    patientFolloupToBeDeleted.add(followUpsToBeCancelled);
                                }
                                // Breaking off from the For Loop
                                break;                            
                            }
                            else{
                                finalListOfFollowUpToUpdate.add(followUpToUpdate);
                            }
                        }
                    }
                                
                }
        	}
            
            system.debug('records to be updated'+finalListOfFollowUpToUpdate);
        	insert patientFollowUpRecordsToBeCreated;
        	update patientFollowUpRecordsToBeCancelled;
        	update finalListOfFollowUpToUpdate;
            delete patientFolloupToBeDeleted;
            
        }
        
    }
    
}