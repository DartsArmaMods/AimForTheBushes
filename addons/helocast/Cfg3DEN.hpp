class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls;
        };
        class Combo: Title {
            class Controls: Controls {
                class Title;
                class Value;
            };
        };

        class GVAR(boatTypes): Combo {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    onLoad = QUOTE(call (uiNamespace getVariable QQFUNC(boatTypesOnLoad)));
                };
            };
        };
    };

    class Object {
        class AttributeCategories {
            class PREFIX {
                displayName = QUOTE(MOD_NAME);
                collapsed = 0;
                class Attributes {
                    class GVAR(boatType) {
                        displayName = CSTRING(boatType_displayName);
                        tooltip = CSTRING(boatType_tooltip);
                        property = QGVAR(boatTypeID);

                        control = QGVAR(boatTypes);
                        defaultValue = "";
                        typeName = "STRING";

                        condition = "objectVehicle";
                        expression = "";
                    };
                };
            };
        };
    };
};