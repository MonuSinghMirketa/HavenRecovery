global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> lList = [SELECT Id, Status FROM Lead WHERE Status NOT IN ('Lost', 'No Ins or Payment', 'Converted') AND IsConverted = False AND LastModifiedDate != LAST_N_DAYS:7];
        
        if(!lList.isEmpty()) {
            for(Lead l: lList) {
                l.Status = 'Lost';
            }
            update lList;
        }
    }
}