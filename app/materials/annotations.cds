using CatalogService as service from '../../srv/service';

annotate service.Materials with {
    FURNIZOR @(Common: {
        Label    : 'Furnizor',
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Supplier',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'FURNIZOR_ID',
                ValueListProperty: 'ID',
            }],
        },
    })
}

annotate service.Materials with @(

    UI                    : {

        LineItem      : [
            {
                Value: COD_UNIC_AVIZ,
                Label: 'Cod Unic Aviz'
            },
            {
                Value: SPECIE,
                Label: 'Specie'
            },
            {
                Value: DATA,
                Label: 'Data'
            },
            {
                Value: APV,
                Label: 'APV'
            },
            {
                Value: LAT,
                Label: 'Lat'
            },
            {
                Value: LOG,
                Label: 'Log'
            },
            {
                Value: PLACUTA_ROSIE,
                Label: 'Placuta Rosie'
            },
            {
                Value: LUNGIME,
                Label: 'Lungime'
            },
            {
                Value: DIAMETRU,
                Label: 'Diametru'
            },
            {
                Value: VOLUM_PLACUTA_ROSIE,
                Label: 'Volum Placuta Rosie'
            },
            {
                Value: VOLUM_TOTAL,
                Label: 'Volum Total'
            },
            {
                Value: EDITARE_MODIFICARE,
                Label: 'Editare Modificare'
            },
            {
                Value: OBS,
                Label: 'Observatii'
            }
        ],
        Identification: [
            {
                Value: COD_UNIC_AVIZ,
                Label: 'Cod Unic Aviz'
            },
            {
                Value: SPECIE,
                Label: 'Specie'
            },
            {
                Value: DATA,
                Label: 'Data'
            },
            {
                Value: APV,
                Label: 'APV'
            },
            {
                Value: LAT,
                Label: 'Lat'
            },
            {
                Value: LOG,
                Label: 'Log'
            },
            {
                Value: PLACUTA_ROSIE,
                Label: 'Placuta Rosie'
            }
        ]
    },
    UI.Facets             : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Detalii',
        ID    : 'Detalii',
        Target: '@UI.FieldGroup#Detalii',
    }, ],
    UI.FieldGroup #Detalii: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: COD_UNIC_AVIZ,
                Label: 'Cod Unic Aviz'
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
            },
            {
                $Type: 'UI.DataField',
                Value: FURNIZOR,
                Label: 'FURNIZOR'
            },
            {
                $Type         : 'UI.DataFieldWithIntentBasedNavigation',
                Value         : FURNIZOR_ID,
                Label         : 'Furnizor',
                Mapping       : [{
                    $Type                 : 'Common.SemanticObjectMappingType',
                    LocalProperty         : 'FURNIZOR_ID',
                    SemanticObjectProperty: 'ID',
                }],
                SemanticObject: 'Supplier',
                Action        : 'display',
            },


        ]
    },
);
