<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Admissions_Alert_Haven</fullName>
        <ccEmails>admissions@havendetoxnow.com</ccEmails>
        <ccEmails>admissionsteam@havendetoxnow.com</ccEmails>
        <ccEmails>allstaff@havendetoxnow.com</ccEmails>
        <ccEmails>ur@havendetoxnow.com</ccEmails>
        <description>Admissions Alert Haven</description>
        <protected>false</protected>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_updated</template>
    </alerts>
    <alerts>
        <fullName>Admissions_Alert_TRT</fullName>
        <ccEmails>admissionsteam@havendetoxnow.com</ccEmails>
        <ccEmails>admissions@havendetoxnow.com</ccEmails>
        <ccEmails>allstaff@recoveryteam.org</ccEmails>
        <description>Admissions Alert TRT</description>
        <protected>false</protected>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_updated</template>
    </alerts>
    <alerts>
        <fullName>Admissions_alert_for_ICFR</fullName>
        <ccEmails>admissionsteam@havendetoxnow.com</ccEmails>
        <ccEmails>admissions@havendetoxnow.com</ccEmails>
        <ccEmails>allstaff@treatmentindiana.com</ccEmails>
        <description>Admissions alert for ICFR</description>
        <protected>false</protected>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admissions_Alert_updated</template>
    </alerts>
    <alerts>
        <fullName>Lead_Alert</fullName>
        <description>Lead Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Admissions_Test</recipient>
            <type>group</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Admission_Alerts_Sent</template>
    </alerts>
    <alerts>
        <fullName>Lead_Refer_out</fullName>
        <ccEmails>referouts@havendetoxnow.com</ccEmails>
        <description>Lead Refer out</description>
        <protected>false</protected>
        <recipients>
            <recipient>Admissions</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lead_Refer_Out</template>
    </alerts>
    <alerts>
        <fullName>Secondary_VOB_Request</fullName>
        <ccEmails>vob@havendetoxnow.com</ccEmails>
        <ccEmails>admissions@havendetoxnow.com</ccEmails>
        <description>Secondary VOB Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Secondary_VOB_Request</template>
    </alerts>
    <alerts>
        <fullName>TRT_Web_Form_Alert</fullName>
        <description>TRT Web Form Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Admissions</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TRT_Web_Form</template>
    </alerts>
    <alerts>
        <fullName>URGENT_VOB_REQUEST</fullName>
        <ccEmails>vob@havendetoxnow.com, admissions@havendetoxnow.com</ccEmails>
        <description>URGENT VOB REQUEST</description>
        <protected>false</protected>
        <recipients>
            <recipient>jrodriguez1@bluebookehr.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mukul.pandey@mirketa.com.newhaven</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/URGENT_VOB_REQUEST</template>
    </alerts>
    <alerts>
        <fullName>VOB_Request_HAVEN</fullName>
        <ccEmails>admissions@havendetoxnow.com</ccEmails>
        <ccEmails>vob@havendetoxnow.com</ccEmails>
        <description>VOB Request HAVEN</description>
        <protected>false</protected>
        <recipients>
            <recipient>jrodriguez1@bluebookehr.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samuel.staples4@unitedbilling.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/VOB_Request</template>
    </alerts>
    <alerts>
        <fullName>VOB_Results_Back</fullName>
        <description>VOB Results Back</description>
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
        <template>unfiled$public/VOB_Results_Returned</template>
    </alerts>
    <rules>
        <fullName>Admissions Alert Haven</fullName>
        <actions>
            <name>Admissions_Alert_Haven</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Admissions_Alert_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Facility_Interest__c</field>
            <operation>includes</operation>
            <value>Haven Detox</value>
        </criteriaItems>
        <description>Admissions Alert Haven</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Admissions Alert ICFR</fullName>
        <actions>
            <name>Admissions_alert_for_ICFR</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Admissions_Alert_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Facility_Interest__c</field>
            <operation>equals</operation>
            <value>Indiana Center for Recovery</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Admissions Alert TRT</fullName>
        <actions>
            <name>Admissions_Alert_TRT</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Admissions_Alert_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Facility_Interest__c</field>
            <operation>equals</operation>
            <value>Recovery Team</value>
        </criteriaItems>
        <description>Admissions Alert</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Secondary VOB Request</fullName>
        <actions>
            <name>Secondary_VOB_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Secondary_VOB_Request__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>URGENT VOB REQUEST</fullName>
        <actions>
            <name>URGENT_VOB_REQUEST</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.URGENT_VOB_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VOB Request HAVEN</fullName>
        <actions>
            <name>VOB_Request_HAVEN</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.VOB_Requested__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VOB Results Back</fullName>
        <actions>
            <name>VOB_Results_Back</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.VOB_Results_Back__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
