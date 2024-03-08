using main_service as service from '../../../srv/main_service';

/*
SelectionFields
*/
annotate service.Belege with @UI.SelectionFields: [
    ID,
    amount,
    land.code,
    status.code,
];

/*
LineItem
*/
annotate service.Belege with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: ID,
    },
    {
        $Type: 'UI.DataField',
        Value: amount,
    },
    {
        $Type: 'UI.DataField',
        Value: land.code
    },
    {
        $Type: 'UI.DataField',
        Value: status.code,
    },
];

/*
UI
*/
annotate service.Belege with @(
    UI.FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: amount,
            },
            {
                $Type: 'UI.DataField',
                Value: land.code,
            },
            {
                $Type: 'UI.DataField',
                Value: status.code,
            },
        ],

    },

    UI.Facets    : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>AllgemeineInformation}',
            Target: '@UI.FieldGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Positionen.Plural}',
            Target: 'items/@UI.LineItem',
        },
    ]
);


/**
    UI.SelectionVariant
 */
annotate service.Belege with @(
    UI.SelectionVariant          : {
        Text         : 'Alle',
        SelectOptions: [],
    },
    //If more then 3 variants are enabled, they are displayed as a dropdown menu
    UI.SelectionVariant #variant1: {
        Text         : 'variant1 no DE',
        SelectOptions: [{
            PropertyName: land_code,
            Ranges      : [{
                Sign  : #E,
                Option: #EQ,
                Low   : 'DE',
            }, ],
        }, ],
    },
    UI.SelectionVariant #variant2: {
        Text         : 'variant2 DE',
        SelectOptions: [{
            PropertyName: land_code,
            Ranges      : [{
                Sign  : #I,
                Option: #EQ,
                Low   : 'DE',
            }, ],
        }, ],
    },
    UI.SelectionVariant #variant3: {
        Text         : 'variant3 0-14€',
        SelectOptions: [{
            PropertyName: amount,
            Ranges      : [{
                Sign  : #I,
                Option: #BT,
                Low   : 0,
                High  : 14,
            }, ],
        }, ],
    },
    UI.SelectionVariant #variant4: {
        Text         : 'variant4 14-100€',
        SelectOptions: [{
            PropertyName: amount,
            Ranges      : [{
                Sign  : #I,
                Option: #BT,
                Low   : 14,
                High  : 100,
            }, ],
        }, ],
    },
);


/**
    UI.SelectionPresentationVariant
 */
annotate service.Belege with @(
    UI.SelectionPresentationVariant #SPVDefault : {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'Alle',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            ID            : 'PresentationVariantDefault',
            Visualizations: ['@UI.LineItem', ],
            SortOrder     : [],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            ID           : 'SelectionVariantDefault',
            SelectOptions: [],
        },
    },

    UI.SelectionPresentationVariant #SPVvariant1: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'PreVar1 no DE',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            ID            : 'PresentationVariant01',
            Visualizations: ['@UI.LineItem', ],
            SortOrder     : [],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            ID           : 'SelectionVariant01',
            SelectOptions: [{
                PropertyName: land_code,
                Ranges      : [{
                    Sign  : #E,
                    Option: #EQ,
                    Low   : 'DE',
                }, ],
            }, ],
        },
    },

    UI.SelectionPresentationVariant #SPVvariant2: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'PreVar1 DE',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            ID            : 'PresentationVariant02',
            Visualizations: ['@UI.LineItem', ],
            SortOrder     : [],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            ID           : 'SelectionVariant02',
            SelectOptions: [{
                PropertyName: land_code,
                Ranges      : [{
                    Sign  : #I,
                    Option: #EQ,
                    Low   : 'DE',
                }, ],
            }, ],
        },
    },

    UI.SelectionPresentationVariant #SPVvariant3: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'PreVar 30-14€',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            ID            : 'PresentationVariant03',
            Visualizations: ['@UI.LineItem', ],
            SortOrder     : [],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            ID           : 'SelectionVariant03',
            SelectOptions: [{
                PropertyName: amount,
                Ranges      : [{
                    Sign  : #I,
                    Option: #BT,
                    Low   : 0,
                    High  : 14,
                }, ],
            }, ],
        },
    },


    UI.SelectionPresentationVariant #SPVvariant4: {
        $Type              : 'UI.SelectionPresentationVariantType',
        Text               : 'PreVariant4 14-100€',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            ID            : 'PresentationVariant04',
            Visualizations: ['@UI.LineItem', ],
            SortOrder     : [],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            ID           : 'SelectionVariant04',
            SelectOptions: [{
                PropertyName: amount,
                Ranges      : [{
                    Sign  : #I,
                    Option: #BT,
                    Low   : 14,
                    High  : 100,
                }, ],
            }, ],
        },
    },
);
