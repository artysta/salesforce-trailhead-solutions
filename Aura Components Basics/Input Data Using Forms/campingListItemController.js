({
    packItem: function (component, event, helper) {
        let item = component.get("v.item", true);
        item.Packed__c = true;
        component.set("v.item", item);
        let button = event.getSource();
        button.set("v.disabled", true);
    }
})