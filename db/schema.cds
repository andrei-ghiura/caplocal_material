using {
    managed,
    cuid,
    temporal
} from '@sap/cds/common';

namespace com.eudr.lumbermill;

@odata.draft.enabled
entity Materials : managed, cuid {
    type                   : Association to MaterialType;
    COD_UNIC_AVIZ          : String(20);
    SPECIE                 : String(50);
    DATA                   : Date;
    APV                    : String(20);
    LAT                    : String(20);
    LOG                    : String(20);
    PLACUTA_ROSIE          : Int16;
    LUNGIME                : Double;
    DIAMETRU               : Double;
    VOLUM_PLACUTA_ROSIE    : Double;
    VOLUM_TOTAL            : Double;
    EDITARE_MODIFICARE     : String(20);
    OBS                    : String(20);
    FURNIZOR               : Association to Supplier;
    source_processing      : Association to Processings;
    destination_processing : Association to Processings;
}

entity MaterialType : managed, cuid {
    name      : String(255);
    materials : Association to many Materials
                    on materials.type = $self;
}

annotate Materials with @Capabilities: {
    Insertable,
    Updatable,
    Deletable
};

annotate Supplier with @Capabilities: {
    Insertable,
    Updatable,
    Deletable
};


entity Supplier : managed, cuid {
    name           : String(255);
    contact_person : String(255);
    email          : String(255);
    phone          : String(20);
    address        : String(255);
    materials      : Association to many Materials
                         on materials.FURNIZOR = $self
}

entity Processings : managed {
    key ID               : Integer;
        name             : String(255);
        input_materials  : Association to many Materials
                               on input_materials.destination_processing = $self;
        output_materials : Association to many Materials
                               on output_materials.source_processing = $self;
}

entity Machines : managed {
    key ID       : Integer;
        name     : String(255);
        workshop : Association to Workshop;
}

entity Workshop : managed {
    key ID       : Integer;
        name     : String(255);
        machines : Association to many Machines
                       on machines.workshop = $self;
}

// /** Hierarchically organized Code List for Genres */
// entity Genres : sap.common.CodeList {
//   key ID   : Integer;
//   parent   : Association to Genres;
//   children : Composition of many Genres on children.parent = $self;
// }
