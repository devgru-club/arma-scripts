class CfgPatches
{
	class Shemaghs
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]={};
	};
};
class CfgGlasses
{
	class None;
	class L_shemagh_white: None
	{
		displayname="(L) Shemagh - White";
		model="\NeckLoose\LooseShemagh.p3d";
		picture="\NeckLoose\UI\tempUI.paa";
		identityTypes[]=
		{
			"NoGlasses",
			0,
			"G_NATO_default",
			0,
			"G_NATO_casual",
			0,
			"G_NATO_pilot",
			0,
			"G_NATO_recon",
			0,
			"G_NATO_SF",
			0,
			"G_NATO_sniper",
			0,
			"G_NATO_diver",
			0,
			"G_IRAN_default",
			0,
			"G_IRAN_diver",
			0,
			"G_GUERIL_default",
			0,
			"G_HAF_default",
			0,
			"G_CIVIL_female",
			0,
			"G_CIVIL_male",
			0
		};
	};
	class L_Shemagh_OD: L_shemagh_white
	{
		displayname="(L) Shemagh - OD";
		model="\NeckLoose\LooseShemaghOD.p3d";
	};
	class L_Shemagh_Tan: L_shemagh_white
	{
		displayname="(L) Shemagh - Tan";
		model="\NeckLoose\LooseShemaghTan.p3d";
	};
	class L_Shemagh_Red: L_shemagh_white
	{
		displayname="(L) Shemagh - Red";
		model="\NeckLoose\LooseShemaghRed.p3d";
	};
	class L_Shemagh_Gry: L_shemagh_white
	{
		displayname="(L) Shemagh - Gry";
		model="\NeckLoose\LooseShemaghGry.p3d";
	};
	class LCG_Shemagh_Tan: L_shemagh_white
	{
		displayname="(LCG) Shemagh - Tan";
		model="\NeckLoose\LCGLooseTan.p3d";
	};
	class LBG_Shemagh_Tan: L_shemagh_white
	{
		displayname="(LBG) Shemagh - Tan";
		model="\NeckLoose\LBGLooseTan.p3d";
	};
	class LOG_Shemagh_Tan: L_shemagh_white
	{
		displayname="(LOG) Shemagh - Tan";
		model="\NeckLoose\LOGLooseTan.p3d";
	};
	class LCG_Shemagh_OD: L_shemagh_white
	{
		displayname="(LCG) Shemagh - OD";
		model="\NeckLoose\LCGLooseOD.p3d";
	};
	class LOG_Shemagh_OD: L_shemagh_white
	{
		displayname="(LOG) Shemagh - OD";
		model="\NeckLoose\LOGLooseOD.p3d";
	};
	class LBG_Shemagh_OD: L_shemagh_white
	{
		displayname="(LBG) Shemagh - OD";
		model="\NeckLoose\LBGLooseOD.p3d";
	};
	class LBG_Shemagh_Gry: L_shemagh_white
	{
		displayname="(LBG) Shemagh - Gry";
		model="\NeckLoose\LBGLooseGry.p3d";
	};
	class LOG_Shemagh_Gry: L_shemagh_white
	{
		displayname="(LOG) Shemagh - Gry";
		model="\NeckLoose\LOGLooseGry.p3d";
	};
	class LCG_Shemagh_Gry: L_shemagh_white
	{
		displayname="(LCG) Shemagh - Gry";
		model="\NeckLoose\LCGLooseGry.p3d";
	};
	class LCG_Shemagh_White: L_shemagh_white
	{
		displayname="(LCG) Shemagh - White";
		model="\NeckLoose\LCGLooseWhite.p3d";
	};
	class LOG_Shemagh_White: L_shemagh_white
	{
		displayname="(LOG) Shemagh - Gry";
		model="\NeckLoose\LOGLooseWhite.p3d";
	};
	class LBG_Shemagh_White: L_shemagh_white
	{
		displayname="(LBG) Shemagh - White";
		model="\NeckLoose\LBGLooseWhite.p3d";
	};
};
