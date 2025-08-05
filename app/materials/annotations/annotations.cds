using CatalogService as service from '../../../srv/service';

using from './FieldGroup.annotations';
using from './LineItem.annotations';

annotate service.Materials with
{
    cod_unic_aviz          @Common.Label: 'Cod Unic Aviz';
    data                   @Common.Label: 'Data';
    apv                    @Common.Label: 'APV';
    lat                    @Common.Label: 'Latitudine'                @Measures.Unit   : '°';
    log                    @Common.Label: 'Longitudine'  @Measures.Unit   : '°';
    nr_placuta_rosie       @Common.Label: 'Nr. Placuță Rosie';
    nr_bucati              @Common.Label: 'Nr. Bucăți'                @Measures.Unit   : 'buc';
    source_processing      @Common.Label: 'Sursa Procesare';
    destination_processing @Common.Label: 'Destinația Procesare';
    volum_net_paletizat    @Common.Label: 'Volum Net Paletizat'       @Measures.Unit   : 'm³';
    volum_brut_paletizat   @Common.Label: 'Volum Brut Paletizat'      @Measures.Unit   : 'm³';
    diametru               @Common.Label: 'Diametru'                  @Measures.Unit   : 'cm';
    lungime                @Common.Label: 'Lungime'                   @Measures.Unit   : 'cm';
    volum_total            @Common.Label: 'Volum Total'               @Measures.Unit   : 'm³';
    volum_placuta_rosie    @Common.Label: 'Volum Placuță Rosie'       @Measures.Unit   : 'm³';
    observatii             @Common.Label: 'Observații'                @UI.MultiLineText: true;
    specie                 @(Common:
    {
        ExternalID              : specie.name,
        FieldControl            : #Mandatory,
        Label                   : 'Specie lemnoasă',
        ValueListWithFixedValues: true,
        ValueList               :
        {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'WoodSpecies',
            Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: 'specie_ID',
                ValueListProperty: 'ID',
            }],
        },
    });
    type                @(Common:
    {
        ExternalID              : type.name,
        FieldControl            : #Mandatory,
        Label                   : 'Categorie Material',
        ValueListWithFixedValues: true,
        ValueList               :
        {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'MaterialType',
            Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: 'type_ID',
                ValueListProperty: 'ID',
            }],
        },
    });
    supplier            @(Common:
    {
        Label       : 'Furnizor',
        ExternalID  : supplier.name,
        FieldControl: #Mandatory,
        ValueList   :
        {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Supplier',
            Parameters    : [
                {$Type: 'Common.ValueListParameterOut',LocalDataProperty: 'supplier_ID',ValueListProperty: 'ID',},
                {$Type: 'Common.ValueListParameterDisplayOnly',                         ValueListProperty: 'name',},
                {$Type: 'Common.ValueListParameterDisplayOnly',                         ValueListProperty: 'address',},
                {$Type: 'Common.ValueListParameterDisplayOnly',                         ValueListProperty: 'email',},
                {$Type: 'Common.ValueListParameterDisplayOnly',                         ValueListProperty: 'phone',},
            ],
        },
    });

}

annotate service.Materials with @(UI.Facets: [
    {$Type : 'UI.ReferenceFacet',Label : 'Tip Material', ID: 'TipMaterial',  Target: '@UI.FieldGroup#TipMaterial'                                      },
    {$Type : 'UI.ReferenceFacet',Label : 'Detalii',      ID: 'Detalii',      Target: '@UI.FieldGroup#Detalii'},
    {$Type : 'UI.ReferenceFacet',Label : 'Dimensiuni',   ID: 'Dimensiuni',   Target: '@UI.FieldGroup#Dimensiuni' },
    {$Type : 'UI.ReferenceFacet',Label : 'Furnizor',     ID: 'Furnizor',     Target: '@UI.FieldGroup#Furnizor'                                         },
    {$Type : 'UI.ReferenceFacet',Label : 'Observatii',   ID: 'Observatii',   Target: '@UI.FieldGroup#Observatii'                                       }
],

);
