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
        TypeName : '{i18n>Campaing}',
        TypeNamePlural : '{i18n>Campaigns}',
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
);

