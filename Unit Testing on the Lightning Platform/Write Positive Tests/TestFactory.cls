public class TestFactory {
    public static List<Opportunity> generateOppsForAccount(Id accountId, Decimal opportunityAmount, Integer amount) {
        List<Opportunity> opportunities = new List<Opportunity>();
        
        for (Integer i = 0; i < amount; i++) {
            opportunities.add(
                new Opportunity(
                    Name = 'Test Name ' + i,
                    StageName = 'Prospecting',
                    CloseDate = Date.today().addDays(14),
                    Amount = opportunityAmount,
                    AccountId = accountId
                )
            );
        }
        
        return opportunities;
    }
}