using {com.eudr.lumbermill as my} from '../db/schema';

service CatalogService {
    entity Materials    as projection on my.Materials;
    entity Processings  as projection on my.Processings;
    entity Machines     as projection on my.Machines;
    entity Workshop     as projection on my.Workshop;
    entity Supplier     as projection on my.Supplier;
    entity MaterialType as projection on my.MaterialType;
}
