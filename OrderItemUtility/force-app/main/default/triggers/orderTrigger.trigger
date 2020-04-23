trigger orderTrigger on Order (before update) {
    OrderItemUtility.addBonusBouquet(trigger.new);
}