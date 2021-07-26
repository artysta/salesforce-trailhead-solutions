@isTest
private class TestOpportunityChangeTrigger {
    @isTest
    static void testCreateAndUpdateOpportunity() {
        Test.enableChangeDataCapture();
        
        Opportunity opportunity = new Opportunity(
            Name = 'Sell 100 Widgets',
            StageName = 'Prospecting',
            CloseDate = Date.today().addMonths(3)
        );
        
        Test.getEventBus().deliver();
        
        Opportunity[] opportunities = [SELECT Id, StageName FROM Opportunity];
        Opportunity opp = opportunities[0];
        opp.StageName = 'Closed Won';
        
        update opp;
        
        Test.getEventBus().deliver();
        
        Task[] tasks = [SELECT Id, Subject FROM Task];
        
        System.assertEquals(1, tasks.size(), 'The change event trigger did not create the expected task.');
    }
}