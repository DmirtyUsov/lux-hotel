using admin as service from '../../srv/services';
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
                Label : 'StartDate',
                Value : StartDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EndDate',
                Value : EndDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'to_Status_code',
                Value : to_Status_code,
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
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'StartDate',
            Value : StartDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'EndDate',
            Value : EndDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'to_Status_code',
            Value : to_Status_code,
        },
    ],
);

