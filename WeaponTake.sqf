#include "constants\items.sqf"
// WEAPONS_PRIMARY, WEAPONS_SECONDARY, PACKS, VESTS, UNIFORMS, HELMETS, ATTACHMENTS, CONSUMABLES

0 = [_this] spawn { 
	_myharr = _this select 0;
	_myhuman = _myharr select 0; 
	_ifItemArifle = -1;
	_ifItemSrifle = -1;
	_ifrhsWeap = -1;
	_ifCUPWeap = -1;
	_ifItemhgun = -1;
	_ifm9 = -1;
	_ifItemSMG = -1;
	_secselweap = -1;
	_selweap = -1;
	_ifItemM320= -1;
	_ifItemRSP30= -1;
	_ifItemPYA= -1;
	_ifItemM911A1= -1;
	_ifMakarovPmm= -1;
	_IfRhsusf_weap= -1;
	_mySym = "";
	_backpackcargo = -1;
	_backpack = -1;

	_mycargo = nearestObjects [position _myhuman, ["BOX_NATO_AmmoOrd_F"], 65];  
	
	if (count _mycargo != 0) then {
		_mycargo = _mycargo select 0;
		_wcargo = getWeaponCargo _mycargo;
		_backpackcargo = getBackpackCargo _mycargo;
		_backpack = _backpackcargo select 0;
		_wcargo = _wcargo select 0;

		{
			if (_x in WEAPONS_SECONDARY) then {
				_secselweap = _x;
			};
			if (_x in WEAPONS_PRIMARY) then {
				_selweap = _x;
			};
		} foreach _wcargo;

		diag_log format ["_SELWEAP: %1", _selweap];
		diag_log format ["_SECSELWEAP: %1", _secselweap];

		_myitemCargo = (getItemCargo _mycargo) select 0;
		_myitemCargo pushBack (_backpack select 0);

		_mymagazinearray = [];
		if (_selWeap != -1) then {
			_mymagazinearray = getArray (configFile >> 'CfgWeapons'>> _selweap >> 'magazines');
		}

		_mysecondarymagazinearray = [];
		if (_selWeap != -1) then {
			_mysecondarymagazinearray = getArray (configFile >> 'CfgWeapons'>> _secselweap >> 'magazines');
		}
		
		if((count _myitemCargo) > 0) then {
			{
				_mySym = _x select [0,9];
				switch(_mySym) do {
					case "rhsusf_mb";
					case "rhsusf_sp";
					case "rhsusf_io": {_myhuman addVest _x;};
					case "rhs_unifo";
					case "U_": {_myhuman addUniform _x;};
					case "rhsusf_op";
					case "rhsusf_hg";
					case "rhs_zsh7a";
					case "rhs_altyn";
					case "rhs_beret"; 
					case "rhsusf_ac";
					case "rhs_6b47_";
					case "rhs_field";
					case "rhs_6b7_1";
					case "H_": {_myhuman addHeadgear _x;};
					case "rhsusf_fa";
					case "rhsusf_as": {_myhuman addBackpack  _x;};
					case "rhsusf_sh";
					case "G_": {_myhuman addGoggles _x;};
					default {};
				};

				_mySym = _x select [0,8];
				switch(_mySym) do {
					case "rhs_6b13";
					case "rhs_6b23";
					case "rhs_6b26";
					case "rhs_6b27";
					case "rhs_6b28";
					case "rhs_6sh9": {_myhuman addVest _x;};
					case "U_": {_myhuman addUniform _x;};
					case "rhs_6b47";
					case "H_": {_myhuman addHeadgear _x;};
					case "B_": {_myhuman addBackpack  _x;};
					case "G_": {_myhuman addGoggles _x;};
					default {};
				};

				_mySym = _x select [0,6];
				switch(_mySym) do {
					case "CUP_V_": {_myhuman addVest _x;};
					case "CUP_U_": {_myhuman addUniform _x;};
					case "CUP_H_";
					case "H_": {_myhuman addHeadgear _x;};
					case "rhs_si";
					case "rhs_as";
					case "CUP_B_";
					case "B_": {_myhuman addBackpack  _x;};
					case "G_": {_myhuman addGoggles _x;};
					default {};
				};

				_mySym = _x select [0,2];
				switch(_mySym) do {
					case "V_": {_myhuman addVest _x;};
					case "U_": {_myhuman addUniform _x;};
					case "H_": {_myhuman addHeadgear _x;};
					case "B_": {_myhuman addBackpack  _x;};
					case "G_": {_myhuman addGoggles _x;};
					default {_myhuman addItem _x};
				};

			} foreach _myitemCargo;
		};
	
		sleep 0.5;
	
		if((count _mymagazinearray) > 0) then {
			_mymagazine = _mymagazinearray select 0;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
		} else {};
	
		if((count _mysecondarymagazinearray) > 0) then {
			_mymagazine = _mysecondarymagazinearray select 0;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
			_myhuman addMagazine _mymagazine;
		} else {};
	
		if (isNil _selweap) then {
			_myhuman addWeapon _selweap;
		} else {};

		if (isNil _secselweap) then {
			_myhuman addWeapon _secselweap;
		} else {};

		sleep 0.3;
	
		clearweaponcargo _mycargo;
		clearmagazinecargo _mycargo;
		clearItemCargo _mycargo;
		clearBackpackCargo _mycargo;
		deleteVehicle _mycargo;
	} else {};

	_grp =  group _myhuman;
	deleteWaypoint ((waypoints _grp) select 0);
}