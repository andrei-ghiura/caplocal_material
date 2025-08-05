using CatalogService as service from '../../srv/service';


annotate service.Supplier with
{
name                     @Common.Label: '{i18n>name}';
contact_person           @Common.Label: '{i18n>contact_person}';
email                    @Common.Label: '{i18n>email}';
phone                    @Common.Label: '{i18n>phone}';
address                  @Common.Label: '{i18n>address}';

}
annotate service.Supplier with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {$Type: 'UI.DataField',Value: name},
            {$Type: 'UI.DataField',Value: contact_person},
            {$Type: 'UI.DataField',Value: email},
            {$Type: 'UI.DataField',Value: phone},
            {$Type: 'UI.DataField',Value: address},
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {$Type: 'UI.DataField',Label: 'ID',Value: ID},
        {$Type: 'UI.DataField',Label: 'name',Value: name},
        {$Type: 'UI.DataField',Label: 'contact_person',Value: contact_person},
        {$Type: 'UI.DataField',Label: 'email',Value: email},
        {$Type: 'UI.DataField',Label: 'phone',Value: phone},
    ],
);
