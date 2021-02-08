trigger LeadConvert on Lead (after insert, after update) {

    if(trigger.isAfter && trigger.isUpdate){
        if(!System.Isbatch() && !system.isFuture()){
            CreateVobTriggerHelper.VOBfrmLead(trigger.new);
        }
        
    }
}