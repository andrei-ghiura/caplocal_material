using CatalogService as service from '../../../srv/service';

annotate service.Materials with @(UI: {LineItem: [
    {$Type: 'UI.DataField',Value: type_ID             },
    {$Type: 'UI.DataField',Value: specie_ID           },
    {$Type: 'UI.DataField',Value: cod_unic_aviz       },
    {$Type: 'UI.DataField',Value: nr_placuta_rosie    },
    {$Type: 'UI.DataField',Value: data                },
    {$Type: 'UI.DataField',Value: apv                 },
    {$Type: 'UI.DataField',Value: lat                 },
    {$Type: 'UI.DataField',Value: log                 },
    {$Type: 'UI.DataField',Value: lungime             },
    {$Type: 'UI.DataField',Value: diametru            },
    {$Type: 'UI.DataField',Value: volum_placuta_rosie },
    {$Type: 'UI.DataField',Value: volum_total         }
]})
