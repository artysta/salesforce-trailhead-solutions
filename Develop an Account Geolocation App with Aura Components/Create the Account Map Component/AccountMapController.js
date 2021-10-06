({
    onAccountsLoaded: function (component, event, helper) {
        var mapMarkers = [];
        var accounts = event.getParam('accounts');
        for (var i = 0; i < accounts.length; i++) {
            var account = accounts[i];
            var marker = {
                'location': {
                    'Street': account.BillingStreet,
                    'City': account.BillingCity,
                    'PostalCode': account.BillingPostalCode
                },
                'title': account.Name,
                'description': (
                    'Phone: ' + account.Phone +
                    ' ' +
                    'Website: ' + account.Website
                ),
                'icon': 'standard:location'
            };
            mapMarkers.push(marker);
        }
        component.set('v.mapMarkers', mapMarkers);
    }
})