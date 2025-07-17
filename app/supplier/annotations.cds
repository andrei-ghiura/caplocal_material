using CatalogService as service from '../../srv/service';

annotate service.Supplier with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'contact_person',
                Value: contact_person,
            },
            {
                $Type: 'UI.DataField',
                Label: 'email',
                Value: email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'phone',
                Value: phone,
            },
            {
                $Type: 'UI.DataField',
                Label: 'address',
                Value: address,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'contact_person',
            Value: contact_person,
        },
        {
            $Type: 'UI.DataField',
            Label: 'email',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Label: 'phone',
            Value: phone,
        },
    ],
);
