@isTest
private class LeadProcessorTest {
    @isTest
    private static void testLeadProcessor() {
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++) {
            leads.add(
                new Lead(
                    FirstName = 'Jack',
                    LastName = 'Shephard',
                    Company = 'Salesforce'
                )
            );
        }
        
        insert leads;
        
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Database.executeBatch(leadProcessor, 200);
        Test.stopTest();
        
        List<Lead> updatedLeads = [SELECT Id
                                   FROM Lead
                                   WHERE LeadSource = 'Dreamforce'];
        
        System.assertEquals(200, updatedLeads.size(), 'Something went wrong! At least 1 Lead have not been updated correctly!');
    }
}