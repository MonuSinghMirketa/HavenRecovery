<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Ins_Co_Name</fullName>
        <field>Hidden_Insurance_Co__c</field>
        <formula>Primary_Insurance_Company__c</formula>
        <name>Update Ins Co Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Ins_ID</fullName>
        <field>Hidden_Insurance_ID__c</field>
        <formula>Member_ID__c</formula>
        <name>Update Ins ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Ins Co Name</fullName>
        <actions>
            <name>Update_Ins_Co_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Insurance_Verification__c.Primary_Insurance_Company__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Ins ID</fullName>
        <actions>
            <name>Update_Ins_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Insurance_Verification__c.Primary_Insurance_Company__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
