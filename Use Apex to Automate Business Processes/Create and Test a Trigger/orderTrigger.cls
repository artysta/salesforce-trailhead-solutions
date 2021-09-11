trigger orderTrigger on Order(before update) {
    OrderItemUtility.addBonusBouquet(Trigger.new);
}