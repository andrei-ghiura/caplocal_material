using {
    managed,
    cuid
} from '@sap/cds/common';

namespace com.eudr.lumbermill;

@odata.draft.enabled
entity Materials : managed, cuid {
    type                   : Association to MaterialType;
    cod_unic_aviz          : String(40);
    specie                 : Association to WoodSpecies;
    data                   : Date;
    apv                    : String(40);
    lat                    : Decimal(9, 6);
    log                    : Decimal(9, 6);
    nr_placuta_rosie       : Int16;
    lungime                : Double;
    diametru               : Double;
    volum_placuta_rosie    : Double;
    volum_total            : Double;
    volum_net_paletizat    : Double;
    volum_brut_paletizat   : Double;
    nr_bucati              : Int16;
    observatii             : String(20);
    supplier               : Association to Supplier;
    source_processing      : Association to Processings;
    destination_processing : Association to Processings;
}

entity MaterialType : managed {
    key ID        : String;
        name      : localized String;
        fieldGroup: String;
        materials : Association to many Materials
                        on materials.type = $self;
}

entity WoodSpecies : managed {
    key ID        : String;
    name      : String(255);
    materials : Association to many Materials
                    on materials.specie = $self;
}

entity UsersModel : managed, cuid {
    key email      : String;
        password   : String(255);
        created_at : DateTime @default: current_timestamp;
        updated_at : DateTime @default: current_timestamp;
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
                         on materials.supplier = $self
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
