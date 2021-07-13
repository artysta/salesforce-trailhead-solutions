trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account account : Trigger.New) {
        if (account.Match_Billing_Address__c == true) {
            account.ShippingPostalCOde = account.BillingPostalCode;
        }
    }
}