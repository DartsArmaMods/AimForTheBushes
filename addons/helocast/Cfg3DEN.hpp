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
                    onLoad = QUOTE(call (uiNamespace getVariable QQFUNC(3DEN_boatTypesOnLoad)));
                };
            };
        };

        class GVAR(boatCount): Combo {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    onLoad = QUOTE(call (uiNamespace getVariable QQFUNC(3DEN_boatCountOnLoad)));
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
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(boatType),_value,true)]);
                    };

                    class GVAR(boatCount): GVAR(boatType) {
                        displayName = CSTRING(boatCount_displayName);
                        tooltip = CSTRING(boatCount_tooltip);
                        property = QGVAR(boatCountID);

                        control = QGVAR(boatCount);
                        defaultValue = "0";
                        typeName = "STRING";
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(boatCount),_value,true)]);
                    };
                };
            };
        };
    };
};