using CatalogService as service from '../../../srv/service';

annotate service.Materials with {
    diametru            @Measures.Unit   : 'cm';
    lungime             @Measures.Unit   : 'cm';
    volum_total         @Measures.Unit   : 'm3';
    volum_placuta_rosie @Measures.Unit   : 'm3';
    observatii          @UI.MultiLineText: true;
    type                @(Common: {
        ExternalID              : type.name,
        FieldControl            : #Mandatory,
        Label                   : 'Categorie Material',
        ValueListWithFixedValues: true,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'MaterialType',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: 'type_ID',
                ValueListProperty: 'ID',
            }],
        },
    });
    supplier            @(Common: {
        Label       : 'Furnizor',
        ExternalID  : supplier.name,
        FieldControl: #Mandatory,
        ValueList   : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Supplier',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: 'supplier_ID',
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'address',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'email',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'phone',
                },
            ],
        },
    });

}

annotate service.Materials with @(
    UI                       : {LineItem: [
        {
            $Type: 'UI.DataField',
            Value: cod_unic_aviz,
            Label: 'Cod Unic Aviz'
        },
        {
            $Type: 'UI.DataField',
            Value: type_ID,
            Label: 'Categorie Material',
        },
        {
            $Type: 'UI.DataField',
            Value: specie_ID,
            Label: 'Specie'
        },
        {
            $Type: 'UI.DataField',
            Value: data,
            Label: 'Data'
        },
        {
            $Type: 'UI.DataField',
            Value: apv,
            Label: 'APV'
        },
        {
            $Type: 'UI.DataField',
            Value: lat,
            Label: 'Lat'
        },
        {
            $Type: 'UI.DataField',
            Value: log,
            Label: 'Log'
        },
        {
            $Type: 'UI.DataField',
            Value: nr_placuta_rosie,
            Label: 'Placuta Rosie'
        },
        {
            $Type: 'UI.DataField',
            Value: lungime,
            Label: 'Lungime'
        },
        {
            $Type: 'UI.DataField',
            Value: diametru,
            Label: 'Diametru'
        },
        {
            $Type: 'UI.DataField',
            Value: volum_placuta_rosie,
            Label: 'Volum Placuta Rosie'
        },
        {
            $Type: 'UI.DataField',
            Value: volum_total,
            Label: 'Volum Total'
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
            $Type        : 'UI.ReferenceFacet',
            Label        : 'Dimensiuni',
            ID           : 'Dimensiuni',
            Target       : '@UI.FieldGroup#Dimensiuni',
            ![@UI.Hidden]: (type.name=='Buștean'),

        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Furnizor',
            ID    : 'Furnizor',
            Target: '@UI.FieldGroup#Furnizor',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Observatii',
            ID    : 'Observatii',
            Target: '@UI.FieldGroup#Observatii',
        }
    ],
    UI.FieldGroup #Furnizor  : {
        $Type: 'UI.FieldGroupType',
        Label: 'Furnizor',
        Data : [{
            $Type: 'UI.DataField',
            Value: supplier_ID,
            Label: 'Furnizor',
        }]
    },
    UI.FieldGroup #Observatii: {
        $Type: 'UI.FieldGroupType',
        Label: 'Observatii',
        Data : [{
            $Type: 'UI.DataField',
            Value: observatii,
            Label: 'Observatii'
        }]
    },
    UI.FieldGroup #Dimensiuni: {
        $Type: 'UI.FieldGroupType',
        Label: 'Dimensiuni',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: lungime,
                Label: 'Lungime'
            },
            {
                $Type: 'UI.DataField',
                Value: diametru,
                Label: 'Diametru'
            },
            {
                $Type: 'UI.DataField',
                Value: volum_placuta_rosie,
                Label: 'Volum Placuta Rosie'
            },
            {
                $Type: 'UI.DataField',
                Value: volum_total,
                Label: 'Volum Total'
            }
        ]
    },
    UI.FieldGroup #Detalii   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: cod_unic_aviz,
                Label: 'Cod Unic Aviz'
            },
            {
                $Type: 'UI.DataField',
                Value: type_ID,
                Label: 'Categorie Material',
            },
            {
                $Type: 'UI.DataField',
                Value: specie_ID,
                Label: 'Specie'
            },
            {
                $Type: 'UI.DataField',
                Value: data,
                Label: 'Data'
            },
            {
                $Type: 'UI.DataField',
                Value: apv,
                Label: 'APV'
            },
            {
                $Type: 'UI.DataField',
                Value: lat,
                Label: 'Lat'
            },
            {
                $Type: 'UI.DataField',
                Value: log,
                Label: 'Log'
            },
            {
                $Type: 'UI.DataField',
                Value: nr_placuta_rosie,
                Label: 'Placuta Rosie'
            },


            {
                $Type: 'UI.DataField',
                Value: observatii,
                Label: 'Observatii'
            }


        ]
    },
);
