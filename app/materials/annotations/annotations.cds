using CatalogService as service from '../../../srv/service';

annotate service.Materials with {
    type     @(Common: {
        Label    : 'Categorie Material',
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'MaterialType',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: 'type_ID',
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
            ],
        },
    });
    FURNIZOR @(Common: {
        Label    : 'Furnizor',
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Supplier',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: 'FURNIZOR_ID',
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
            ],
        },
    });

}

annotate service.Materials with @(
    UI                       : {LineItem: [
        {
            $Type: 'UI.DataField',
            Value: COD_UNIC_AVIZ,
            Label: 'Cod Unic Aviz'
        },
        {
            $Type: 'UI.DataField',
            Value: type_ID,
            Label: 'Categorie Material',
        },
        {
            $Type: 'UI.DataField',
            Value: SPECIE,
            Label: 'Specie'
        },
        {
            $Type: 'UI.DataField',
            Value: DATA,
            Label: 'Data'
        },
        {
            $Type: 'UI.DataField',
            Value: APV,
            Label: 'APV'
        },
        {
            $Type: 'UI.DataField',
            Value: LAT,
            Label: 'Lat'
        },
        {
            $Type: 'UI.DataField',
            Value: LOG,
            Label: 'Log'
        },
        {
            $Type: 'UI.DataField',
            Value: PLACUTA_ROSIE,
            Label: 'Placuta Rosie'
        },
        {
            $Type: 'UI.DataField',
            Value: LUNGIME,
            Label: 'Lungime'
        },
        {
            $Type: 'UI.DataField',
            Value: DIAMETRU,
            Label: 'Diametru'
        },
        {
            $Type: 'UI.DataField',
            Value: VOLUM_PLACUTA_ROSIE,
            Label: 'Volum Placuta Rosie'
        },
        {
            $Type: 'UI.DataField',
            Value: VOLUM_TOTAL,
            Label: 'Volum Total'
        },
        {
            $Type: 'UI.DataField',
            Value: EDITARE_MODIFICARE,
            Label: 'Editare Modificare'
        },
        {
            $Type: 'UI.DataField',
            Value: OBS,
            Label: 'Observatii'
        }
    ]},
    UI.Facets                : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Detalii',
            ID    : 'Detalii',
            Target: '@UI.FieldGroup#Detalii',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Dimensiuni',
            ID    : 'Dimensiuni',
            Target: '@UI.FieldGroup#Dimensiuni',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Furnizor',
            ID    : 'Furnizor',
            Target: '@UI.FieldGroup#Furnizor',
        }
    ],
    UI.FieldGroup #Furnizor  : {
        $Type: 'UI.FieldGroupType',
        Label: 'Furnizor',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: FURNIZOR_ID,
                Label: 'Furnizor',
            },
            {
                $Type: 'UI.DataField',
                Value: FURNIZOR.name,
                Label: 'Furnizor'
            },
        ]
    },
    UI.FieldGroup #Dimensiuni: {
        $Type: 'UI.FieldGroupType',
        Label: 'Dimensiuni',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: LUNGIME,
                Label: 'Lungime'
            },
            {
                $Type: 'UI.DataField',
                Value: DIAMETRU,
                Label: 'Diametru'
            },
            {
                $Type: 'UI.DataField',
                Value: VOLUM_PLACUTA_ROSIE,
                Label: 'Volum Placuta Rosie'
            },
            {
                $Type: 'UI.DataField',
                Value: VOLUM_TOTAL,
                Label: 'Volum Total'
            }
        ]
    },
    UI.FieldGroup #Detalii   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: COD_UNIC_AVIZ,
                Label: 'Cod Unic Aviz'
            },
            {
                $Type: 'UI.DataField',
                Value: type_ID,
                Label: 'Categorie Material',
            },
            {
                $Type: 'UI.DataField',
                Value: SPECIE,
                Label: 'Specie'
            },
            {
                $Type: 'UI.DataField',
                Value: DATA,
                Label: 'Data'
            },
            {
                $Type: 'UI.DataField',
                Value: APV,
                Label: 'APV'
            },
            {
                $Type: 'UI.DataField',
                Value: LAT,
                Label: 'Lat'
            },
            {
                $Type: 'UI.DataField',
                Value: LOG,
                Label: 'Log'
            },
            {
                $Type: 'UI.DataField',
                Value: PLACUTA_ROSIE,
                Label: 'Placuta Rosie'
            },

            {
                $Type: 'UI.DataField',
                Value: EDITARE_MODIFICARE,
                Label: 'Editare Modificare'
            },
            {
                $Type: 'UI.DataField',
                Value: OBS,
                Label: 'Observatii'
            }


        ]
    },
);
