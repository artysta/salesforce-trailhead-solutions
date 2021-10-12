public class Accounts extends fflib_SObjectDomain {
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }
    
    public override void onApplyDefaults() {
        for (Account account : (List<Account>) records) {
            account.Description = 'Domain classes rock!';
        }
    }
    
    public override void onBeforeUpdate(Map<Id,sObject> existingRecords) {        
        List<Account> accountsToUpdate = new List<Account>();
        
        for(Account account : (List<Account>) records) {                  
            account.AnnualRevenue = 'Domain classes rock!'.getLevenshteinDistance(account.Description);
            accountsToUpdate.add(account);
        }
        
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Account.SObjectType });
        uow.registerDirty(accountsToUpdate);
    }
}