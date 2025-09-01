using admin as service from '../../srv/services';
using from '../../db/schema';

annotate service.Campaigns with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Starts',
                Value : StartDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Ends',
                Value : EndDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : to_Status.name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Campaign',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Starts',
            Value : StartDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Ends',
            Value : EndDate,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Status.name,
            Label : 'Status',
        },
    ],
    UI.SelectionFields : [
        to_Status_code,
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Campaign Details',
            ID : 'CampaignDetails',
            Target : '@UI.FieldGroup#CampaignDetails',
        },
    ],
    UI.FieldGroup #CampaignDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : to_Status.name,
                Label : 'Status',
            },
            {
                $Type : 'UI.DataField',
                Value : StartDate,
                Label : 'Starts',
            },
            {
                $Type : 'UI.DataField',
                Value : EndDate,
                Label : 'Ends',
            },
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Name,
        },
        TypeName : '{i18n>Campaign}',
        TypeNamePlural : '{i18n>Campaigns}',
    },
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Campaigns',
    },
);

annotate service.CampaignStatus with {
    name @(
        Common.Text : code,
        Common.Label : 'Status',
        )
};

annotate service.CampaignStatus with {
    code @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CampaignStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'name',
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true,
        Common.Label : 'Status',
)};

annotate service.Campaigns with {
    to_Status @(
        Common.Label : 'Status',
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Tariffs with @(
    UI.Facets : [
        
    ],
    UI.FieldGroup #Test : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : to_Campaign.to_Tariffs.GuestsNum,
                Label : 'GuestsNum',
            },
            {
                $Type : 'UI.DataField',
                Value : to_Campaign.to_Tariffs.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : to_Campaign.to_Tariffs.PerNight,
                Label : 'PerNight',
            },
            {
                $Type : 'UI.DataField',
                Value : to_Campaign.to_Tariffs.Room_ID,
                Label : 'Room_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : to_Campaign.to_Tariffs.to_Campaign_ID,
                Label : 'to_Campaign_ID',
            },
        ],
    },
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : Room.to_Floor.name,
            Label : 'Floor',
        },
        {
            $Type : 'UI.DataField',
            Value : Room.Number,
            Label : 'Room #',
        },
        {
            $Type : 'UI.DataField',
            Value : GuestsNum,
            Label : 'Guests',
        },
        {
            $Type : 'UI.DataField',
            Value : Room.to_Type.name,
            Label : 'Room Type',
        },
        {
            $Type : 'UI.DataField',
            Value : Room.to_View.name,
            Label : 'View',
        },
        {
            $Type : 'UI.DataField',
            Value : PerNight,
            Label : 'Tariff Per Night',
        },
    ],
);

annotate service.Rooms with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : to_Floor.name,
            Label : 'Floor',
        },
        {
            $Type : 'UI.DataField',
            Value : Number,
            Label : 'Room #',
        },
        {
            $Type : 'UI.DataField',
            Value : to_Type.name,
            Label : 'Room Type',
        },
        {
            $Type : 'UI.DataField',
            Value : to_View.name,
            Label : 'View',
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Rooms',
    },
);

