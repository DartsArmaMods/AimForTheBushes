// Global toggles for caching/logging
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_MODE_FULL
#define DEBUG_SYNCHRONOUS

#include "\x\cba\addons\main\script_macros_common.hpp"

#define QQUOTE(var1) QUOTE(QUOTE(var1))

// QPATHTOF but without a leading slash
#define PATHTOF2(var1) MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\var1
#define QPATHTOF2(var1) QUOTE(PATHTOF2(var1))

#ifdef SUBCOMPONENT
    #define SUBADDON DOUBLES(ADDON,SUBCOMPONENT)

    // Update PATHTO macros to point to subaddon instead
    #undef PATHTO
    #define PATHTO(var1) \MAINPREFIX\PREFIX\SUBPREFIX\DOUBLES(COMPONENT,SUBCOMPONENT)\var1.sqf
    #undef PATHTOF
    #define PATHTOF(var1) \MAINPREFIX\PREFIX\SUBPREFIX\DOUBLES(COMPONENT,SUBCOMPONENT)\var1
    #undef PATHTO2
    #define PATHTO2(var1) MAINPREFIX\PREFIX\SUBPREFIX\DOUBLES(COMPONENT,SUBCOMPONENT)\var1.sqf
    #undef PATHTOF2
    #define PATHTOF2(var1) MAINPREFIX\PREFIX\SUBPREFIX\DOUBLES(COMPONENT,SUBCOMPONENT)\var1
#endif

#undef PREP
#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {_this call FUNC(x)}
    #define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
    #define PREP_RECOMPILE_START    if (isNil "MOD_PREFIX_fnc_recompile") then {MOD_PREFIX_recompiles = []; MOD_PREFIX_fnc_recompile = {{call _x} forEach MOD_PREFIX_recompiles;}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; MOD_PREFIX_recompiles pushBack _recomp;
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
    #define PREP_RECOMPILE_START ; /* disabled */
    #define PREP_RECOMPILE_END ; /* disabled */
#endif

#define WEAP_XX(WEAP, COUNT) class DOUBLES(_xx,WEAP) { \
    weapon = QUOTE(WEAP); \
    count = COUNT; \
}

#define MAG_XX(MAG, COUNT) class DOUBLES(_xx,MAG) { \
    magazine = QUOTE(MAG); \
    count = COUNT; \
}

#define ITEM_XX(ITEM, COUNT) class DOUBLES(_xx,ITEM) { \
    name = QUOTE(ITEM); \
    count = COUNT; \
}

// ACE Cargo
#define CARGO_XX(ITEM, COUNT) class ITEM { \
    type = QUOTE(ITEM); \
    amount = COUNT; \
}

#define MAG_CSW(var1,var2) class DOUBLES(var1,csw): var1 { \
    scope = var2; \
    type = TYPE_MAGAZINE_PRIMARY_AND_THROW; \
}

// Debug textures, mainly for testing hiddenSelections
#define DBUG_TEX_RED "#(rgb,8,8,3)color(1,0,0,1)"
#define DBUG_TEX_GRN "#(rgb,8,8,3)color(0,1,0,1)"
#define DBUG_TEX_BLU "#(rgb,8,8,3)color(0,0,1,1)"
#define DBUG_TEX_PUR "#(rgb,8,8,3)color(1,0,1,1)"
#define DBUG_TEX_YEL "#(rgb,8,8,3)color(1,1,0,1)"

// Statements and conditions
#define CLAMP(var1,lower,upper) (lower max (var1 min upper))

// weapon types
#define TYPE_WEAPON_PRIMARY 1
#define TYPE_WEAPON_HANDGUN 2
#define TYPE_WEAPON_SECONDARY 4
// magazine types
#define TYPE_MAGAZINE_HANDGUN_AND_GL 16 // mainly
#define TYPE_MAGAZINE_PRIMARY_AND_THROW 256
#define TYPE_MAGAZINE_SECONDARY_AND_PUT 512 // mainly
#define TYPE_MAGAZINE_MISSILE 768
// more types
#define TYPE_BINOCULAR_AND_NVG 4096
#define TYPE_WEAPON_VEHICLE 65536
#define TYPE_ITEM 131072
// item types
#define TYPE_DEFAULT 0
#define TYPE_MUZZLE 101
#define TYPE_OPTICS 201
#define TYPE_FLASHLIGHT 301
#define TYPE_BIPOD 302
#define TYPE_FIRST_AID_KIT 401
#define TYPE_FINS 501 // not implemented
#define TYPE_BREATHING_BOMB 601 // not implemented
#define TYPE_NVG 602
#define TYPE_GOGGLE 603
#define TYPE_SCUBA 604 // not implemented
#define TYPE_HEADGEAR 605
#define TYPE_FACTOR 607
#define TYPE_MAP 608
#define TYPE_COMPASS 609
#define TYPE_WATCH 610
#define TYPE_RADIO 611
#define TYPE_GPS 612
#define TYPE_HMD 616
#define TYPE_BINOCULAR 617
#define TYPE_MEDIKIT 619
#define TYPE_TOOLKIT 620
#define TYPE_UAV_TERMINAL 621
#define TYPE_VEST 701
#define TYPE_UNIFORM 801
#define TYPE_BACKPACK 901