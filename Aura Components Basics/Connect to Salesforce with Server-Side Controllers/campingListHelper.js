({
    validateFields: function (component, field) {
        let campingItemName = field.get("v.value");

        if ($A.util.isEmpty(campingItemName)) {
            component.set("v.error", true);
            field.set("v.errors", [{ message: "Name field cannot be empty!" }]);
        } else {
            field.set("v.errors", null);
        }
    },

    createItem: function (component, Item) {
        let action = component.get("c.saveItem");
        action.setParams({ "item": Item });

        action.setCallback(this, function (response) {
            let state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                let campingItems = component.get("v.items");
                campingItems.push(response.getReturnValue());
                component.set("v.items", campingItems);
            }
        });

        $A.enqueueAction(action);
    }
})