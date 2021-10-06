({
    // code in the helper is reusable by both
    // the controller.js and helper.js files
    handleSearch: function (component, searchTerm) {
        var action = component.get("c.searchAccounts");
        action.setParams({
            searchTerm: searchTerm
        });
        action.setCallback(this, function (response) {
            var event = $A.get("e.c:AccountsLoaded");
            event.setParams({
                "accounts": response.getReturnValue()
            });
            event.fire();
        });
        $A.enqueueAction(action);
    }
})