//Create the class
public class OrderItemUtility {
    
    //Create the method that will add free bonus bouquet when order is activated
    public static void addBonusBouquet(List<Order> ordersFromTrigger) {
        
        //TO DO 3.1: Determine if we have a bonus product and get it's ID to add to the order
        // Use SOQL to get the ID of the bonus bouquet and store it in an sObject variable called bonusProduct
        List<Product2> bonusProductList = [SELECT Id, ProductCode FROM Product2 WHERE ProductCode = 'BOT-BB-12'];
        Product2 bonusProduct = new Product2();
        if(bonusProductList.size() > 0) {
            bonusProduct = bonusProductList[0];
            
            // Use SOQL to get the price book entry ID associated with the bonusProduct and store it in an sObject variable called entry
            // Every Product has an assosiated PricebookEntry
            List<PricebookEntry> entryList = [SELECT Id, Product2Id FROM PricebookEntry WHERE Product2Id = :bonusProduct.Id];
            PricebookEntry entry = new PricebookEntry();
            if(entryList.size() > 0) {
                entry = entryList[0];
            }
            
            //TO DO 2.1: Create a list to store any new bouquets we'll insert later
            List<OrderItem> newBouquets = new List<OrderItem>();
            
            //TO DO 2.2: Loop over orders in ordersFromTrigger, for each order (called currentOrder) do something
            for(Order currentOrder : ordersFromTrigger) {
                
                //TO DO 2.3: Verify the order status is 'Activated'
                if(currentOrder.Status == 'Activated') {
                    
                    //TO DO 2.4: Create a new bouquet and set values
                    OrderItem freeBouquet = new OrderItem(
                        OrderId = currentOrder.id, //this is the order we're linking the bouquet to
                        PricebookEntryId = entry.id,
                        numberOfFlowers__c = 3,
                        description = 'FREE Bouquet',
                        Quantity = 1,
                        colorTheme__c = 'Spectacular Sunset',
                        percentOfOpening__c = 0,
                        UnitPrice = 0.00
                    );
                    
                    //TO DO 2.5: Add the freeBouquet sObject to your list
                    newBouquets.add(freeBouquet);
                    
                    //TO DO 2.6: Close the "if" and "for loop" sections
                } //end if
            } //end for loop
            
            //TO DO 3.2: Use DML to add the new bouquet to the Order
            insert newBouquets;
            
            //TO DO 3.3: Close the if section
        } //end if
    } //end method
} //end class