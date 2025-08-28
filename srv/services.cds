using {org.luxhotel as hotel} from '../db/schema';

@impl: '/srv/admin.service.js'
service admin {
  entity Rooms     as projection on hotel.Rooms;
  entity Campaigns as projection on hotel.Campaigns;

  entity Tariffs   as projection on hotel.Tariffs;
}

service reception {
  @readonly
  entity Rooms     as projection on hotel.Rooms;

  @readonly
  entity Campaigns as projection on hotel.Campaigns;

  @readonly
  entity Tariffs   as projection on hotel.Tariffs;

}
