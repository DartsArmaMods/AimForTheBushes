class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class PREFIX {
                displayName = QUOTE(MOD_NAME);
                collapsed = 0;
                class Attributes {
                    class GVAR(isJumpMaster) {
                        displayName = CSTRING(jumpMaster_displayName);
                        tooltip = CSTRING(jumpMaster_tooltip);
                        property = QGVAR(isJumpMasterID);
                        control = "Checkbox";
                        defaultValue = "false";
                        condition = "objectBrain";
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(isJumpMaster),_value,true)]);
                    };
                };
            };
        };
    };
};
