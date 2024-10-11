class CfgPatches
{
	class aftb_compat_3as
	{
		author="Dart";
		authors[]=
		{
			"DartRuffian"
		};
		url="$STR_aftb_main_url";
		name="Aim For The Bushes - 3as Compatability";
		requiredVersion=2.1600001;
		requiredAddons[]=
		{
			"aftb_loadorder",
			"3as_Laat"
		};
		units[]={};
		weapons[]={};
		version=1.1;
		versionStr="1.1.1.6";
		versionAr[]={1,1,1,6};
		skipWhenMissingDependencies=1;
	};
};
class CfgVehicles
{
	class Helicopter_Base_H;
	class 3as_laat_Base: Helicopter_Base_H
	{
		aftb_passengerTurrets[]=
		{
			{1},
			{2},
			{3},
			{4},
			{5},
			{6},
			{7},
			{8},
			{9},
			{10},
			{11},
			{12},
			{13},
			{14},
			{15},
			{16},
			{17},
			{18},
			{19},
			{20},
			{21},
			{22},
			{23},
			{24},
			{25},
			{26},
			{27},
			{28},
			{29},
			{30},
			{31},
			{32},
			{33},
			{34}
		};
		aftb_rampAnims[]=
		{
			
			{
				"ramp",
				0,
				1
			}
		};
		aftb_helocast_boatPositions[]=
		{
			{0,-3,0.2}
		};
		aftb_helocast_marker="Chemlight_green";
	};
	class 3as_LAAT_Mk1: 3as_laat_Base
	{
		aftb_staticLine_enabled=1;
		aftb_staticLine_condition="true";
	};
	class 3as_LAAT_Mk1Lights: 3as_laat_Base
	{
		aftb_staticLine_enabled=1;
		aftb_staticLine_condition="true";
	};
	class 3as_LAAT_Mk2: 3as_laat_Base
	{
		aftb_staticLine_enabled=1;
		aftb_staticLine_condition="true";
	};
	class 3as_LAAT_Mk2Lights: 3as_laat_Base
	{
		aftb_staticLine_enabled=1;
		aftb_staticLine_condition="true";
	};
};
