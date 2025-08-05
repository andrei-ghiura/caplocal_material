using CatalogService as service from '../../../srv/service';

annotate service.Materials with @(
    UI.FieldGroup #TipMaterial  : {
        $Type: 'UI.FieldGroupType',
        Label: 'Material',
        Data : [{$Type: 'UI.DataField',Value: type_ID},
        ]
    },
    UI.FieldGroup #Furnizor  : {
        $Type: 'UI.FieldGroupType',
        Label: 'Furnizor',
        Data : [
            {$Type: 'UI.DataField',Value: supplier_ID    },
            {$Type: 'UI.DataField',Value: supplier.name,   ![@Common.FieldControl]: #ReadOnly   },
            {$Type: 'UI.DataField',Value: supplier.address,![@Common.FieldControl]: #ReadOnly   },
            {$Type: 'UI.DataField',Value: supplier.email,  ![@Common.FieldControl]: #ReadOnly   },
            {$Type: 'UI.DataField',Value: supplier.phone,  ![@Common.FieldControl]: #ReadOnly   },
            ]
    },
    UI.FieldGroup #Observatii: {
        $Type: 'UI.FieldGroupType',
        Label: 'Observatii',
        Data : [{$Type: 'UI.DataField',Value: observatii     }]
    },
    UI.FieldGroup #Dimensiuni: {
        $Type: 'UI.FieldGroupType',
        Label: 'Dimensiuni', 
        Data : [
            {$Type: 'UI.DataField',Value: lungime              ,![@UI.Hidden]:  ((type.ID  <> 'BSTN') and (type.ID <>'BSTF'))},
            {$Type: 'UI.DataField',Value: diametru             ,![@UI.Hidden]:  ((type.ID  <> 'BSTN') and (type.ID <>'BSTF'))},
            {$Type: 'UI.DataField',Value: volum_total          ,![@UI.Hidden]:  ((type.ID  <> 'BSTN') and (type.ID <>'BSTF'))},
            {$Type: 'UI.DataField',Value: volum_placuta_rosie  ,![@UI.Hidden]:  ((type.ID  <> 'BSTN') and (type.ID <>'BSTF'))},
            {$Type: 'UI.DataField',Value: nr_bucati            ,![@UI.Hidden]:  ((type.ID  == 'BSTN') or (type.ID =='BSTF'))},
            {$Type: 'UI.DataField',Value: volum_brut_paletizat ,![@UI.Hidden]:  ((type.ID  == 'BSTN') or (type.ID =='BSTF'))},
            {$Type: 'UI.DataField',Value: volum_net_paletizat  ,![@UI.Hidden]:  ((type.ID  == 'BSTN') or (type.ID =='BSTF'))},
        ]
    },
    UI.FieldGroup #Detalii   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {$Type: 'UI.DataField',Value: nr_placuta_rosie,![@UI.Hidden]:  ((type.ID  <> 'BSTN') and (type.ID <>'BSTF'))   },
            {$Type: 'UI.DataField',Value: cod_unic_aviz      },
            {$Type: 'UI.DataField',Value: specie_ID          },
            {$Type: 'UI.DataField',Value: data               },
            {$Type: 'UI.DataField',Value: apv                },
            {$Type: 'UI.DataField',Value: lat                },
            {$Type: 'UI.DataField',Value: log                },
        ]
    }
)