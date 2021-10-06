({
    onAccountsLoaded: function (component, event, helper) {
        var cols = [
            {
                'label': 'Name',
                'fieldName': 'Name',
                'type': 'text'
            },
            {
                'label': 'Phone',
                'fieldName': 'Phone',
                'type': 'phone'
            },
            {
                'label': 'Website',
                'fieldName': 'Website',
                'type': 'url'
            },
            {
                'label': 'Action',
                'type': 'button',
                'typeAttributes': {
                    'label': 'View details',
                    'name': 'view_details'
                }
            }
        ];
        component.set('v.cols', cols);
        component.set('v.rows', event.getParam('accounts'));
    },
    onRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        if (action.name == 'view_details') {
            var navigation = component.find('navigation');
            navigation.navigate({
                'type': 'standard__recordPage',
                'attributes': {
                    'objectApiName': 'Account',
                    'recordId': row.Id,
                    'actionName': 'view'
                }
            });
        }
    }
})