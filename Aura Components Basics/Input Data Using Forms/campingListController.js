({
    clickCreateItem: function (component, event, helper) {
        var validCampingItem = component.find('campingitemform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if (validCampingItem) {
            var newCampingItem = component.get("v.newItem");
            var campingItems = component.get("v.items");
            var campingItem = JSON.parse(JSON.stringify(newCampingItem));

            campingItems.push(campingItem);

            component.set("v.items", campingItems);
            component.set("v.newItem", {
                'sobjectType': 'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false
            });
        }
    }
})
