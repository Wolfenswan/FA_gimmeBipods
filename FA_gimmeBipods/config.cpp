class CfgPatches 
{
	class FA_gimmeBipods
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"cba_xeh",
      "extended_eventhandlers",
      "cba_extended_eventhandlers"};
		requiredVersion = 0.1;
		author[] = {"Wolfenswan"};
		authorUrl = "wwww.folkarps.com";
	};
};

class Extended_PostInit_EventHandlers
{ 
    FA_F3BipodsInit = "[] execVM 'FA_gimmeBipods\init.sqf';";
};