({
    doInit: function (component, event, helper) {
        var action = component.get("c.getBookRecommendations");
        action.setCallback(this, function (data) {
            component.set("v.Recommendations", data.getReturnValue());
            console.log(data.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})