//Create the class
public class OrderItemUtility {
    
    //Create the method that will add free bonus bouquet when order is activated
    public static void addBonusBouquet(List<Order> ordersFromTrigger) {
        
        //TO DO 3.1: Determine if we have a bonus product and get it's ID to add to the order
        
        //TO DO 2.1: Create a list to store any new bouquets we'll insert later
        List<OrderItem> newBouquets = new List<OrderItem>();
        
        //TO DO 2.2: Loop over orders in ordersFromTrigger, for each order (called currentOrder) do something
        for(Order currentOrder : ordersFromTrigger) {
            
            //TO DO 2.3: Verify the order status is 'Activated'
            if(currentOrder.Status == 'Activated') {
                
                //TO DO 2.4: Create a new bouquet and set values
                OrderItem freeBouquet = new OrderItem(
                    OrderId = currentOrder.id, //this is the order we're linking the bouquet to
                    //PricebookEntryId = entry.id,
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
        
        //TO DO 3.3: Close the if section
        
    } //end method
} //end class