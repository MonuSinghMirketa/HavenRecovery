trigger VobCreationOnOpportunityInsertAndUpdate on Opportunity (after insert, after update) {

    List<Insurance_Verification__c> vobInsertOnOppInsert = new List<Insurance_Verification__c>();
    //List<Insurance_Verification__c> vobInsertOnOppUpdate = new List<Insurance_Verification__c>();


    if(!System.isBatch() && !System.isFuture()){
        if(trigger.isInsert && trigger.isAfter){
            if(MultipleTriggerCalls.isVobCreated){
                MultipleTriggerCalls.isVobCreated =false;
                
                for(Opportunity opp: trigger.new){
                	if(opp.Primary_Insurance__c){
                     	Insurance_Verification__c vob = new Insurance_Verification__c();
                        vob.Verification_Type__c = '1';
                        vob.Opportunity__c = opp.id;
                    	vob.RecordTypeId ='0121U000000NDrnQAG';
                        vob.Insurance_Company__c = opp.Insurance_Company_Name__c;
                    vob.Insurance_Phone__c = opp.Insurance_Phone__c;
                    vob.Member_Id_new__c = opp.Member_ID_Number__c;
                    vob.Policy_Group_Number_new__c = opp.Group_Number__c;
                    //vob.Subscriber_Address_new__c = opp.Subscriber_Address__c;
                   // vob.Subscriber_Address_new__c = opp.Subscriber_Street_Address__c+','+opp.Subscriber_Address__c+','+opp.Subscriber_Address2__c+','+opp.Subscriber_City__c +','+opp.Subscriber_State__c+opp.Subscriber_Zip__c; 

                        vob.Subscriber_Address_new__c = ' ';
                        if(opp.Subscriber_Street_Address__c!=null){
                              vob.Subscriber_Address_new__c = opp.Subscriber_Street_Address__c+' ';
                          }
                          if(opp.Subscriber_Address__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_Address__c+' ';
                          }
                          if(opp.Subscriber_Address2__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_Address2__c+' ';
                          }
                          if(opp.Subscriber_City__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_City__c+' ';
                          }
                          if(opp.Subscriber_State__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_State__c+' ';
                          }
                          if(opp.Subscriber_Zip__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_Zip__c;
                          }
                    vob.Subscriber_DOB_new__c = opp.Subscriber_DOB__c;
                    vob.Subscriber_Email_new__c = opp.Subscriber_Email__c;
                    vob.Subscriber_Employer_new__c = opp.Subscriber_Employer__c;
                    vob.Subscriber_Gender_new__c = opp.Subscriber_Gender__c;
                    //vob.Subscriber_Name_new__c = opp.Subscriber_First_Name__c+' '+opp.Subscriber_Last_Name__c;
                    vob.Subscriber_Name_new__c = ' ';
                          if(opp.Subscriber_First_Name__c!=null){
                              vob.Subscriber_Name_new__c = opp.Subscriber_First_Name__c + ' ';
                          }
                          if(opp.Subscriber_Last_Name__c!=null){
                              vob.Subscriber_Name_new__c +=  opp.Subscriber_Last_Name__c;
                          }
                    vob.Subscriber_Phone_new__c = opp.Subscriber_Phone__c;
                    vob.Relationship_to_Subscriber_new__c = opp.Subscriber_Relationship__c;
                        vobInsertOnOppInsert.add(vob);
                	}
                    if(opp.Secondary_Insurance__c){
                        Insurance_Verification__c vob = new Insurance_Verification__c();
                        vob.Verification_Type__c = '2';
                        vob.Opportunity__c = opp.id;
                    	vob.RecordTypeId ='0121U000000NDrnQAG';
                        vob.Insurance_Company__c = opp.Secondary_Insurance_Company__c;
                    vob.Insurance_Phone__c = opp.Secondary_Insurance_Phone_Number__c;
                    vob.Member_Id_new__c = opp.Secondary_Ins_Member_ID__c;
                    vob.Policy_Group_Number_new__c = opp.Secondary_Ins_Group_No__c;
                    vob.Subscriber_Address_new__c = opp.Secondary_Ins_Subscriber_Address__c;
                    //vob.Subscriber_Address_new__c = opp.secondar
                        vob.Subscriber_DOB_new__c = opp.Secondary_Ins_Sub_DOB__c;
                    //vob.Subscriber_Email_new__c = opp.Secondary_Ins_Sub_email__c;
                    vob.Subscriber_Employer_new__c = opp.Secondary_Ins_Subscriber_Employer__c;
                    vob.Subscriber_Gender_new__c = opp.Secondary_Ins_Subscriber_Gender__c;
                    //vob.Subscriber_Name_new__c = opp.Secondary_Ins_Subscriber_First_Name__c + ' '+opp.Secondary_Ins_Sub_Last_Name__c ;
                        vob.Subscriber_Name_new__c = ' ';
                        if(opp.Secondary_Ins_Subscriber_First_Name__c!=null){
                             vob.Subscriber_Name_new__c = opp.Secondary_Ins_Subscriber_First_Name__c +' ';
                        }
                        if(opp.Secondary_Ins_Sub_Last_Name__c!=null){
                            vob.Subscriber_Name_new__c+= opp.Secondary_Ins_Sub_Last_Name__c;
                        }
                    vob.Subscriber_Phone_new__c = opp.Secondary_Ins_Subscriber_Phone__c;
                    vob.Relationship_to_Subscriber_new__c = opp.Secondary_Ins_Subscriber_Relationship__c;
                        vobInsertOnOppInsert.add(vob);
                    }
                   
            	}
            }
        }
          if(trigger.isUpdate && trigger.isAfter){
              if(MultipleTriggerCalls.isVobCreated){
                  MultipleTriggerCalls.isVobCreated =false;
                  integer i=0;
                  Boolean newvaluePrime;
                  Boolean oldvaluePrime;
                  Boolean newvalueSec;
                  Boolean oldvalueSec;
                  for(Opportunity opp: trigger.new){
                      newvaluePrime = opp.Primary_Insurance__c;
                      oldvaluePrime = trigger.old[i].Primary_Insurance__c;
                      newvalueSec = opp.Secondary_Insurance__c;
                      oldvalueSec = trigger.old[i].Secondary_Insurance__c;
                      //oldvaluePrime!=true && newvaluePrime!=false
                      
                      if(opp.Primary_Insurance__c){
                          List<Insurance_Verification__c> vb = [select id,Name from Insurance_Verification__c where (Opportunity__c=:opp.id And Verification_Type__c='1') ];
                          Insurance_Verification__c vob = new Insurance_Verification__c();

                          if(vb!=null && vb.size() >0){
                              vob.Id = vb[0].id;
                          }
                          vob.Verification_Type__c = '1';
                          vob.Opportunity__c = opp.id;
                          vob.RecordTypeId ='0121U000000NDrnQAG';
                          vob.Insurance_Company__c = opp.Insurance_Company_Name__c;
                    vob.Insurance_Phone__c = opp.Insurance_Phone__c;
                    vob.Member_Id_new__c = opp.Member_ID_Number__c;
                    vob.Policy_Group_Number_new__c = opp.Group_Number__c;
                          vob.Subscriber_Address_new__c =' ';
                   // vob.Subscriber_Address_new__c = opp.Subscriber_Street_Address__c+','+opp.Subscriber_Address__c+','+opp.Subscriber_Address2__c+','+opp.Subscriber_City__c +','+opp.Subscriber_State__c+opp.Subscriber_Zip__c; 
                          if(opp.Subscriber_Street_Address__c!=null){
                              vob.Subscriber_Address_new__c = opp.Subscriber_Street_Address__c+' ';
                          }
                          if(opp.Subscriber_Address__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_Address__c+' ';
                          }
                          if(opp.Subscriber_Address2__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_Address2__c+' ';
                          }
                          if(opp.Subscriber_City__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_City__c+' ';
                          }
                          if(opp.Subscriber_State__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_State__c+' ';
                          }
                          if(opp.Subscriber_Zip__c!=null){
                              vob.Subscriber_Address_new__c+= opp.Subscriber_Zip__c;
                          }
                    vob.Subscriber_DOB_new__c = opp.Subscriber_DOB__c;
                    vob.Subscriber_Email_new__c = opp.Subscriber_Email__c;
                    vob.Subscriber_Employer_new__c = opp.Subscriber_Employer__c;
                    vob.Subscriber_Gender_new__c = opp.Subscriber_Gender__c;
                          vob.Subscriber_Name_new__c = ' ';
                          if(opp.Subscriber_First_Name__c!=null){
                              vob.Subscriber_Name_new__c = opp.Subscriber_First_Name__c + ' ';
                          }
                          if(opp.Subscriber_Last_Name__c!=null){
                              vob.Subscriber_Name_new__c +=  opp.Subscriber_Last_Name__c;
                          }
                    
                    vob.Subscriber_Phone_new__c = opp.Subscriber_Phone__c;
                    vob.Relationship_to_Subscriber_new__c = opp.Subscriber_Relationship__c;
                          vobInsertOnOppInsert.add(vob);
                      }
                      //oldvalueSec!=true && newvalueSec!=false
                      if(opp.Secondary_Insurance__c){
                          List<Insurance_Verification__c> vb = [select id,Name from Insurance_Verification__c where (Opportunity__c=:opp.id And Verification_Type__c='2') ];
							Insurance_Verification__c vob = new Insurance_Verification__c();
                          if(vb!=null && vb.size() >0){
                              vob.Id = vb[0].id;
                          }
                          
                          vob.Verification_Type__c = '2';
                          vob.Opportunity__c = opp.id;
                          vob.RecordTypeId ='0121U000000NDrnQAG';
                          vob.Insurance_Company__c = opp.Secondary_Insurance_Company__c;
                          vob.Insurance_Phone__c = opp.Secondary_Insurance_Phone_Number__c;
                    vob.Member_Id_new__c = opp.Secondary_Ins_Member_ID__c;
                    vob.Policy_Group_Number_new__c = opp.Secondary_Ins_Group_No__c;
                    vob.Subscriber_Address_new__c = opp.Secondary_Ins_Subscriber_Address__c;
                    vob.Subscriber_DOB_new__c = opp.Secondary_Ins_Sub_DOB__c;
                    //vob.Subscriber_Email_new__c = opp.Secondary_Ins_Sub_email__c;
                    vob.Subscriber_Employer_new__c = opp.Secondary_Ins_Subscriber_Employer__c;
                    vob.Subscriber_Gender_new__c = opp.Secondary_Ins_Subscriber_Gender__c;
                   // vob.Subscriber_Name_new__c = opp.Secondary_Ins_Subscriber_First_Name__c + ' '+opp.Secondary_Ins_Sub_Last_Name__c ;
                          vob.Subscriber_Name_new__c = ' ';
                        if(opp.Secondary_Ins_Subscriber_First_Name__c!=null){
                             vob.Subscriber_Name_new__c = opp.Secondary_Ins_Subscriber_First_Name__c +' ';
                        }
                        if(opp.Secondary_Ins_Sub_Last_Name__c!=null){
                            vob.Subscriber_Name_new__c+= opp.Secondary_Ins_Sub_Last_Name__c;
                        }
                    vob.Subscriber_Phone_new__c = opp.Secondary_Ins_Subscriber_Phone__c;
                    vob.Relationship_to_Subscriber_new__c = opp.Secondary_Ins_Subscriber_Relationship__c;
                          vobInsertOnOppInsert.add(vob);
                      }
                      i++;
                  }
              }
          }
        if(vobInsertOnOppInsert!=Null && vobInsertOnOppInsert.size()> 0){
            upsert vobInsertOnOppInsert;
        }
    }    
}