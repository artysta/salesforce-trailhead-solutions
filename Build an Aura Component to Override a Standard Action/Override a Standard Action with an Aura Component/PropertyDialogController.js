({
    doInit: function (component, event, helper) {
        component.find("forceRecord").getNewRecord(
            "Property__c",
            null,
            false,
            $A.getCallback(function () {
                var rec = component.get("v.propertyRecord");
                var error = component.get("v.recordError");
                if (error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                    return;
                }
            })
        );
    },
    saveRecord: function (component, event, helper) {
        var propBeds = parseInt(component.find('propBeds').get("v.value"), 10);
        var propBaths = parseInt(component.find('propBaths').get("v.value"), 10);
        var propPrice = parseInt(component.find('propPrice').get("v.value"), 10);
        component.set("v.propertyRecord.Name", component.find('propName').get("v.value"));
        component.set("v.propertyRecord.Beds__c", propBeds);
        component.set("v.propertyRecord.Baths__c", propBaths);
        component.set("v.propertyRecord.Price__c", propPrice);
        component.set("v.propertyRecord.Status__c", component.find('propStatus').get("v.value"));
        var tempRec = component.find("forceRecord");
        tempRec.saveRecord($A.getCallback(function (result) {
            console.log(result.state);
            var resultsToast = $A.get("e.force:showToast");
            if (result.state === "SUCCESS") {
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                resultsToast.fire();
            } else if (result.state === "ERROR") {
                console.log('Error: ' + JSON.stringify(result.error));
                resultsToast.setParams({
                    "title": "Error",
                    "message": "There was an error saving the record: " + JSON.stringify(result.error)
                });
                resultsToast.fire();
                var recId = result.recordId;
                helper.navigateTo(component, recId);
            } else {
                console.log('Unknown problem, state: ' + result.state + ', error: ' + JSON.stringify(result.error));
            }
        }));
    },
    cancelDialog: function (component, helper) {
        var homeEvt = $A.get("e.force:navigateToObjectHome");
        homeEvt.setParams({
            "scope": "Property__c"
        });
        homeEvt.fire();
    }
})