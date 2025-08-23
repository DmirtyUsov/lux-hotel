using {
  cuid,
  managed,
  sap.common.CodeList
} from '@sap/cds/common';

namespace org.luxhotel;

entity Rooms : cuid {
  @assert.unique: {Number: [Number]}
  Number   : String(3)                                @mandatory;
  to_Floor : Association to Floor default 'First'     @mandatory;
  to_View  : Association to RoomView default 'Forest' @mandatory;
  to_Type  : Association to RoomType                  @mandatory;
  Tariffs  : Association to many Tariffs
               on Tariffs.to_Room = $self;
}

entity Campaigns : cuid, managed {
  Name      : String                                    @mandatory;
  StartDate : Date                                      @mandatory;
  EndDate   : Date                                      @mandatory;
  to_Status : Association to CampaignStatus default 'D' @mandatory;
//Tariffs: Association to
}

entity Tariffs : cuid, managed {
  to_Room     : Association to Rooms;
  to_Campaign : Association to many Campaigns @mandatory;
  GuestsNum   : Integer                       @mandatory;
  PerNight    : Decimal                       @mandatory;
}

//
//  Code Lists
//

type RoomViewCode : String(8) enum {
  Forest = 'Forest';
  Mountain = 'Mountain';
};

entity RoomView : CodeList {
  key code : RoomViewCode
};

type RoomTypeCode : String(1) enum {
  Twin = 'T';
  Double = 'D';
  Suite = 'S';
};

entity RoomType : CodeList {
  key code : RoomTypeCode
};

entity Floor : CodeList {
  key code : Integer enum {
        First = 1;
        Second = 2;
        Third = 3;
      }
};

entity CampaignStatus : CodeList {
  key code : String(1) enum {
        Draft = 'D';
        Active = 'A';
        Canceled = 'X';
        Finished = 'F'
      }
}
