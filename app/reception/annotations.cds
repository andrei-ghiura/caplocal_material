using CatalogService as service from '../../srv/service';
annotate service.Materials with {
    source_processing @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Processings',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : source_processing_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Materials with {
    destination_processing @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Processings',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : destination_processing_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

