@isTest
private class DailyLeadProcessorTest {
    static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
	@isTest
    static void testScheduleJob() {
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++) {
            leads.add(
                new Lead(
                    LeadSource = '',
                    LastName = 'Test Company Name ' + i,
                    Company = 'Test Company ' + i
                )
            );
        }
        
        insert leads;
        
        Test.startTest();
        String jobId = System.schedule('Update Lead LeadSource to Dreamforce.', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        List<Lead> modifiedLeads = [SELECT Id
                                    FROM Lead
                                    WHERE LeadSource = 'Dreamforce'];
        
        System.assertEquals(200, modifiedLeads.size());
    }
}