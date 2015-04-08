if !(isServer) exitWith {};

// Process playableUnits to equip "ar" and "mmgg" with bipods
[] spawn {
	sleep 1;

	private ["_givebipodz","_givebipodzF3","_getsbipod","_unit","_getsBipod","_bipod"];

	// Give #bipods to units with these strings in their class name
	_givebipodz = ["_ar_","_mg_","_sniper_","_m_"];
	_givebipodzF3 = ["ar","mmgg","sn","dm"]; // F3 assignGear types who get a bipod (no matter their class name)

	{

		// Check if weapon already has bipod
		if ((_x weaponAccessories (primaryWeapon _x) select 3) == "") then {

			// Check for F3 gear types first
			_getsbipod = (toLower(_x getVariable ["f_var_assignGear","false"])) in _givebipodzF3;

			if !(_getsbipod) then {

				// Loop through classes second
				_unit = _x;
				{
					if ([toLower _x,toLower (typeOf _unit)] call BIS_fnc_inString) exitWith {_getsBipod = true};
				} forEach _givebipodz;
			};

			if (_getsbipod) then {
					_bipod = switch (side _x) do {
						case west:{"bipod_01_F_snd"};
						case east:{"bipod_02_F_hex"};
						case resistance:{"bipod_03_F_oli"};
						default {"bipod_01_F_blk"};
					};

				// Add the bipod to the unit where the unit is local
				[[[_x,_bipod],{((_this select 0) addPrimaryWeaponItem (_this select 1))}],"BIS_fnc_Spawn",_x,false,true] call Bis_fnc_MP;
			};
		};
	} forEach playableUnits;
};


