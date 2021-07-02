global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext context) {
        List<Lead> leads = [SELECT Id
                            FROM Lead
                            WHERE LeadSource = ''
                            LIMIT 200];
        
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        
        update leads;
    }
}