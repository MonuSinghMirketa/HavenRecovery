public class CreateVobTriggerHelper {

     public static Map<id,Lead> oppIDLeadMap = new Map<id,Lead>();
    public static void VOBfrmLead(List<Lead> leads){
       
        List<Account> acctoInsert = new List<Account>();
        List<Insurance_Verification__c> vobtoInsert = new List<Insurance_Verification__c>();
        List<Opportunity> OpptoInsert = new List<Opportunity>();
        List<Contact> ContoInsert = new List<Contact>();
        
        for(Lead ld: leads){
            if(ld.isConverted==true){
                
                if(ld.ConvertedOpportunityId!=null){
                     oppIDLeadMap.put(ld.ConvertedOpportunityId,ld);
                    Opportunity opp = new Opportunity();
                    opp.id = ld.ConvertedOpportunityId;
                    opp.Name =ld.Lead_Name__c;
                    opp.Patient_First_Name__c = ld.FirstName;
                    opp.Patient_Last_Name__c = ld.LastName;
                    opp.Middle_Name__c = ld.MiddleName;
                    opp.StageName ='Active';
                    
                    opp.Patient_Birth_Date__c = ld.DOB__c;
                    opp.Patient_City__c = ld.City;
                    opp.Patient_Phone__c = ld.Phone;
                    opp.Patient_SSN__c = ld.Patient_SSN__c;
                    opp.Gender__c = ld.Gender__c;
                    opp.Patient_Zip__c = ld.PostalCode;
                    //opp.Patient_State_new__c = ld.State;
                    opp.Patient_Street_Address__c = ld.Street;
                    opp.Patient_Email__c = ld.Email;
                    //opp.LeadSource = ld.LeadSource;
                    
                    system.debug('ld da: '+ld.DOB__c+','+ld.City+','+ld.Phone+','+ld.Gender__c+','+ld.PostalCode+','+ld.State+','+
                                ld.Street);
                    if(ld.Primary_Insurance__c){
                        system.debug('ld primery ins: '+ld.Primary_Insurance__c);
                        
                        opp.Primary_Insurance__c = ld.Primary_Insurance__c;
                        opp.Insurance_Company_Name__c = ld.Insurance_Company_Name__c;
                        opp.Insurance_Phone__c = ld.Insurance_Phone__c;
                        opp.Member_ID_Number__c = ld.Member_ID_Number__c;
                        opp.Group_Number__c = ld.Group_Number__c;
               			opp.Subscriber_DOB__c = ld.Subscriber_DOB__c;
                        opp.Subscriber_Phone__c = ld.Subscriber_Phone__c;
                        opp.Subscriber_Gender__c = ld.Subscriber_Gender__c;
                        opp.Subscriber_Employer__c = ld.Subscriber_Employer__c;
                        
                    }
                    if(ld.Secondary_Insurance__c){
                        opp.Secondary_Insurance__c = ld.Secondary_Insurance__c;
                        opp.Secondary_Insurance_Company__c = ld.Secondary_Insurance_Company__c;
                        opp.Secondary_Ins_Group_No__c = ld.Secondary_Ins_Group_No__c;
                        opp.Secondary_Ins_Member_ID__c = ld.Secondary_Ins_Member_ID__c;
                        opp.Secondary_Ins_Subscriber_Employer__c = ld.Secondary_Ins_Subscriber_Employer__c;
                        opp.Secondary_Ins_Subscriber_Gender__c = ld.Secondary_Ins_Subscriber_Gender__c;
                    }
                    OpptoInsert.add(opp);
                }
            }
            if(ld.Company == Null){
                 acctoInsert.add(new Account(id=ld.ConvertedAccountID,Name=ld.Lead_Name__c));
            }else{
                acctoInsert.add(new Account(id=ld.ConvertedAccountID,Name=ld.Lead_Name__c));
            }
           
        }
        
        system.debug('op: '+OpptoInsert);
       //  system.debug('op: '+OpptoInsert[0].Primary_Insurance__c + ' '+ OpptoInsert[0].Patient_City__c + ' '+OpptoInsert[0].Patient_Phone__c+ ' '+
              //       OpptoInsert[0].Gender__c + ' ' + OpptoInsert[0].Patient_Street_Address__c + ' '+ OpptoInsert[0].Patient_State__c +' '+ OpptoInsert[0].Patient_Zip__c);
        
        // system.debug('op: '+OpptoInse);
        Database.SaveResult [] updateResult = Database.update(OpptoInsert, false);
        for(integer i=0; i<updateResult.size(); i++){
            if(updateResult.get(i).isSuccess()){
                //oppIDLeadMap.put(updateResult.get(i).getId(),OpptoInsert[i]);
                system.debug('success: '+updateResult.get(i).getId());
            }else{
                for(Database.Error  e: updateResult.get(i).getErrors()){
                    system.debug('ee: '+e.getMessage());
                    system.debug('ee: '+e.getFields());
                }
            }
        }
        
        //update acctoInsert;
         Database.SaveResult [] updateResult1 = Database.update(acctoInsert, false);
        for(Database.SaveResult r: updateResult1){
            if(r.isSuccess()){
                system.debug('success: '+r.getId());
            }else{
                for(Database.Error  e: r.getErrors()){
                    system.debug('ee: '+e.getMessage());
                    system.debug('ee: '+e.getFields());
                }
            }
        }
        system.debug('bbb');
        system.debug('size: '+oppIDLeadMap.size());
        if(MultipleTriggerCalls.isVobCreated){
           system.debug('size: '+oppIDLeadMap.size());
            for(Id oppid: oppIDLeadMap.keySet()){
                system.debug('aaa');
                Lead ld =  oppIDLeadMap.get(oppid);
                
                if(ld.Primary_Insurance__c){
                    // if(ld.Insurance_Company_Name__c!=Null || ld.Insurance_Phone__c!=Null || ld.Member_ID_Number__c!=Null || ld.Group_Number__c!=Null){
                    system.debug('first');
                    Insurance_Verification__c vob = new Insurance_Verification__c();
                    //insurance Details mapping
                    vob.Opportunity__c = oppid;
                    vob.Verification_Type__c = '1';
                    vob.RecordTypeId ='0121U000000NDrnQAG';
                    vob.Insurance_Company__c = ld.Insurance_Company_Name__c;
                    vob.Insurance_Phone__c = ld.Insurance_Phone__c;
                    vob.Member_Id_new__c = ld.Member_ID_Number__c;
                    vob.Policy_Group_Number_new__c = ld.Group_Number__c;
                    vob.Subscriber_Address_new__c = ld.Subscriber_Address__c;
                    vob.Subscriber_DOB_new__c = ld.Subscriber_DOB__c;
                    vob.Subscriber_Email_new__c = ld.Subscriber_Email__c;
                    vob.Subscriber_Employer_new__c = ld.Subscriber_Employer__c;
                    vob.Subscriber_Gender_new__c = ld.Subscriber_Gender__c;
                    vob.Subscriber_Name_new__c = ld.Subscriber_Name__c;
                    vob.Subscriber_Phone_new__c = ld.Subscriber_Phone__c;
                    vob.Relationship_to_Subscriber_new__c = ld.Subscriber_Relationship__c;
                    //patient demographic mapping
                    
                    /* vob.Patient_DOB_new__c = ld.DOB__c;
                    vob.Patient_Age_new__c = ld.Patient_Age__c;
                    vob.Patient_Phone_new__c = ld.Phone;
                    vob.Patient_SSN_new__c = ld.Patient_SSN__c;
                    vob.Patient_Address_City_new__c = ld.City;
                    vob.Patient_Address_State_new__c = ld.State;
                    vob.Patient_Address_Street_new__c = ld.Street;
                    vob.Patient_Zip_new__c = ld.PostalCode;
                    vob.Patient_Gender_new__c = ld.Gender__c;*/
                    
                    //vob.VOB__c = vb.id;
                    vobtoInsert.add(vob);
                    system.debug('vob:' +vob);
                    //}
                    
                }
                
                if(ld.Secondary_Insurance__c){
                    //if(ld.Secondary_Insurance_Company__c!=Null || ld.Secondary_Insurance_Phone_Number__c!=Null || ld.Secondary_Ins_Group_No__c!=Null || ld.Secondary_Ins_Member_ID__c!=Null){
                    system.debug('second');
                    Insurance_Verification__c vob = new Insurance_Verification__c();
                    vob.Opportunity__c = oppid;
                    vob.RecordTypeId ='0121U000000NDrnQAG';
                    vob.Verification_Type__c = '2';
                    vob.Insurance_Company__c = ld.Secondary_Insurance_Company__c;
                    vob.Insurance_Phone__c = ld.Secondary_Insurance_Phone_Number__c;
                    vob.Member_Id_new__c = ld.Secondary_Ins_Member_ID__c;
                    vob.Policy_Group_Number_new__c = ld.Secondary_Ins_Group_No__c;
                    vob.Subscriber_Address_new__c = ld.Secondary_Ins_Subscriber_Address__c;
                    vob.Subscriber_DOB_new__c = ld.Secondary_Ins_Sub_DOB__c;
                    vob.Subscriber_Email_new__c = ld.Secondary_Ins_Sub_email__c;
                    vob.Subscriber_Employer_new__c = ld.Secondary_Ins_Subscriber_Employer__c;
                    vob.Subscriber_Gender_new__c = ld.Secondary_Ins_Subscriber_Gender__c;
                    vob.Subscriber_Name_new__c = ld.Secondary_Ins_Subscriber_first_name__c + ' '+ld.Secondary_Ins_Sub_Last_Name__c ;
                    vob.Subscriber_Phone_new__c = ld.Secondary_Ins_Sub_Phone__c;
                    vob.Relationship_to_Subscriber_new__c = ld.Secondary_Ins_Subscriber_Relationship__c;
                    //patient demographic mapping
                    
                    /*  vob.Patient_DOB_new__c = ld.DOB__c;
                    vob.Patient_Age_new__c = ld.Patient_Age__c;
                    vob.Patient_Phone_new__c = ld.Phone;
                    vob.Patient_SSN_new__c = ld.Patient_SSN__c;
                    vob.Patient_Address_City_new__c = ld.City;
                    vob.Patient_Address_State_new__c = ld.State;
                    vob.Patient_Address_Street_new__c = ld.Street;
                    vob.Patient_Zip_new__c = ld.PostalCode;
                    vob.Patient_Gender_new__c = ld.Gender__c;*/
                                        // vob1.VOB__c = vb.id;
                    vobtoInsert.add(vob);
                    system.debug('vob1:' +vob);
                    // }
                    
                }
                
            }
           
        }

        system.debug('vobtoiinsert :'+vobtoInsert.size());
        system.debug('vobtoiinsert :'+vobtoInsert);
        //system.debug('vobtoiinsert :'+vobtoInsert[1]);
        insert vobtoInsert;
    }
}