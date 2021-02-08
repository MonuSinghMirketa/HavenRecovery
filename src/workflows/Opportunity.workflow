<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Admission_Alert_Haven</fullName>
        <description>Admission Alert Haven</description>
        <protected>false</protected>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_Opp</template>
    </alerts>
    <alerts>
        <fullName>Admission_Alert_ICFR</fullName>
        <description>Admission Alert ICFR</description>
        <protected>false</protected>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_Opp</template>
    </alerts>
    <alerts>
        <fullName>Admission_Alert_Lake_Ave</fullName>
        <description>Admission Alert Lake Ave</description>
        <protected>false</protected>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_Opp</template>
    </alerts>
    <alerts>
        <fullName>Admission_Alert_TRT</fullName>
        <description>Admission Alert TRT</description>
        <protected>false</protected>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_Opp</template>
    </alerts>
    <alerts>
        <fullName>Admission_Approved_Alert</fullName>
        <description>Admission Approved Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Admissions</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>Admissions_Directors</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admission_Approval_Notification</template>
    </alerts>
    <alerts>
        <fullName>PA_Completed</fullName>
        <description>PA Completed</description>
        <protected>false</protected>
        <recipients>
            <recipient>Admissions</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/PA_Completed</template>
    </alerts>
    <alerts>
        <fullName>Priority_Authorization</fullName>
        <ccEmails>ur@unitedbilling.com</ccEmails>
        <ccEmails>tara.gurney@unitedbilling.com</ccEmails>
        <description>Priority Authorization</description>
        <protected>false</protected>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Priority_Auth_Notification</template>
    </alerts>
    <alerts>
        <fullName>Refer_out_Email</fullName>
        <ccEmails>referouts@havendetoxnow.com</ccEmails>
        <description>Refer out Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Refer_Out_Opp</template>
    </alerts>
    <alerts>
        <fullName>Send_Mail_To_Secondary_VOB_Requested</fullName>
        <ccEmails>VOBRequestGroup@havendetoxnow.com</ccEmails>
        <description>Send Mail To Secondary VOB Requested</description>
        <protected>false</protected>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Secondary_VOB_Requested_Stage</template>
    </alerts>
    <alerts>
        <fullName>Send_Mail_To_VOB_Requested</fullName>
        <ccEmails>VOBRequestGroup@havendetoxnow.com</ccEmails>
        <description>Send Mail To VOB Requested</description>
        <protected>false</protected>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/VOB_Requested_Stage</template>
    </alerts>
    <fieldUpdates>
        <fullName>CTM_S_Haven_Google_1_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Haven Google 1</literalValue>
        <name>CTM S Haven Google 1 - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_S_Haven_Google_1_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Google Ads</literalValue>
        <name>CTM S Haven Google 1 - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_S_Haven_Listing_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Haven Listing</literalValue>
        <name>CTM S Haven Listing - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_S_Haven_Listing_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Organic Search</literalValue>
        <name>CTM S Haven Listing - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_S_Haven_Main_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Haven Main</literalValue>
        <name>CTM S Haven Main - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_S_Haven_Main_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Organic Search</literalValue>
        <name>CTM S Haven Main - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_A_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Campaign A</literalValue>
        <name>CTM Source Campaign A - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_A_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Call Campaigns</literalValue>
        <name>CTM Source Campaign A - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_L_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Campaign L</literalValue>
        <name>CTM Source Campaign L - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_L_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Call Campaigns</literalValue>
        <name>CTM Source Campaign L - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_P_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Campaign P</literalValue>
        <name>CTM Source Campaign P - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_P_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Call Campaigns</literalValue>
        <name>CTM Source Campaign P - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_R_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>Campaign R</literalValue>
        <name>CTM Source Campaign R - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_Campaign_R_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Call Campaigns</literalValue>
        <name>CTM Source Campaign R - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_ICFR_Listing_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>ICFR Listing</literalValue>
        <name>CTM Source ICFR Listing Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_ICFR_Listing_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Organic Search</literalValue>
        <name>CTM Source ICFR Listing Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_ICFR_Main_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>ICFR Main</literalValue>
        <name>CTM Source ICFR Main - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_ICFR_Main_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Organic Search</literalValue>
        <name>CTM Source ICFR Main - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_ICFR_Web_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>ICFR Web</literalValue>
        <name>CTM Source ICFR Web - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_ICFR_Web_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Organic Search</literalValue>
        <name>CTM Source ICFR Web - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_PPCampaign_Mark_Lead_Detail</fullName>
        <field>Lead_Source_Details_Specific__c</field>
        <literalValue>PP Campaign</literalValue>
        <name>CTM Source PPCampaign - Mark Lead Detail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CTM_Source_PPCampaign_Mark_Lead_Source</fullName>
        <field>Marketing_Lead_Source_Specific__c</field>
        <literalValue>Organic Search</literalValue>
        <name>CTM Source PPCampaign - Mark Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CTM Source Campaign A</fullName>
        <actions>
            <name>CTM_Source_Campaign_A_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_Campaign_A_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Campaign A</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source Campaign L</fullName>
        <actions>
            <name>CTM_Source_Campaign_L_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_Campaign_L_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Campaign L</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source Campaign P</fullName>
        <actions>
            <name>CTM_Source_Campaign_P_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_Campaign_P_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Campaign P</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source Campaign R</fullName>
        <actions>
            <name>CTM_Source_Campaign_R_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_Campaign_R_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Campaign R</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source Haven Google 1</fullName>
        <actions>
            <name>CTM_S_Haven_Google_1_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_S_Haven_Google_1_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Haven Google 1</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source Haven Listing</fullName>
        <actions>
            <name>CTM_S_Haven_Listing_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_S_Haven_Listing_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Haven Listing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source Haven Main</fullName>
        <actions>
            <name>CTM_S_Haven_Main_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_S_Haven_Main_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>Haven Main</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source ICFR Listing</fullName>
        <actions>
            <name>CTM_Source_ICFR_Listing_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_ICFR_Listing_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>ICFR Listing</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source ICFR Main</fullName>
        <actions>
            <name>CTM_Source_ICFR_Main_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_ICFR_Main_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>ICFR Main</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source ICFR Web</fullName>
        <actions>
            <name>CTM_Source_ICFR_Web_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_ICFR_Web_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>ICFR Web</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CTM Source PP Campaign</fullName>
        <actions>
            <name>CTM_Source_PPCampaign_Mark_Lead_Detail</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>CTM_Source_PPCampaign_Mark_Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CTM_Source__c</field>
            <operation>equals</operation>
            <value>PP Campaign</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Secondary VOB Requested Alert</fullName>
        <actions>
            <name>Send_Mail_To_Secondary_VOB_Requested</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Secondary_Insurance__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.VOB_Results_Back__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VOB Requested Alert</fullName>
        <actions>
            <name>Send_Mail_To_VOB_Requested</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Secondary_Insurance__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.VOB_Results_Back__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
