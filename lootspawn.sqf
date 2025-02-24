#include "constants\items.sqf"
// WEAPONS_PRIMARY, WEAPONS_SECONDARY, PACKS, VESTS, UNIFORMS, HELMETS, ATTACHMENTS, CONSUMABLES

_buildingPosition = _This select 0;

// Create the ammo box (you can substitute an RHS container if desired)
_ammobox = createVehicle ["BOX_NATO_AmmoOrd_F", _buildingPosition, [], 0, "NONE"];

clearweaponcargo _ammobox;
clearmagazinecargo _ammobox;
clearItemCargo _ammobox;
clearBackpackCargo _ammobox;

_myprimary = selectRandom WEAPONS_PRIMARY;
_myprimary = selectRandom WEAPONS_PRIMARY;
_ammobox addWeaponCargo [_myprimary, 1];
_magazinearray = getArray (configFile >> "CfgWeapons" >> _myprimary >> "magazines");
_mymagazine = _magazinearray select 0;
_randmagazine = floor (random [1,2,8]);	// random between 1 and 8, weighted towards mid of 2
if (_randmagazine > 0) then {
	_ammobox addMagazineCargo [_mymagazine, _randmagazine];
};


_mysecondary = selectRandom WEAPONS_SECONDARY;
_mysecondary = selectRandom WEAPONS_SECONDARY;
_ammobox addWeaponCargo [_mysecondary, 1];
_magazinearray = getArray (configFile >> "CfgWeapons" >> _mysecondary >> "magazines");
_mymagazine = _magazinearray select 0;
_randmagazine = floor (random [1,2,8]);	// random between 1 and 8, weighted towards mid of 2
if (_randmagazine > 0) then {
	_ammobox addMagazineCargo [_mymagazine, _randmagazine];
};


_mybackpack = selectRandom PACKS;
_ammobox addBackpackCargo [_mybackpack, 1];


_myvest = selectRandom VESTS;
_ammobox addItemCargo [_myvest, 1];


_myuniform = selectRandom UNIFORMS;
_ammobox addItemCargo [_myuniform, 1];


_myhelmet = selectRandom HELMETS;
_ammobox addItemCargo [_myhelmet, 1];


_myattachment = selectRandom ATTACHMENTS;
_ammobox addItemCargo [_myattachment, 1];


_myconsumable = selectRandom CONSUMABLES;
_ammobox addItemCargo [_myconsumable, 1];



/*
// ─── Primary Weapon Switch (72 cases) ─────────────────────────────────────────
_myweapon = "1";
_weaponR = floor random 72;
switch(_weaponR) do {
    case 0: {_myweapon = "rhs_weap_mk18_m320";};                     // compact carbine with M320
    case 1: {_myweapon = "rhs_weap_mk18_eotech_sup";};                 // Mk18 with EOTech
    case 2: {_myweapon = "rhs_weap_m27iar";};                          // replaces Katiba-style rifle
    case 3: {_myweapon = "rhs_weap_m16a4";};                           // replaces Mk20C variant
    case 4: {_myweapon = "rhs_weap_aks74u";};                          // close-quarters AK variant (replacing TRG21)
    case 5: {_myweapon = "rhs_weap_m4a1_m320";};                       // M4A1 with M320 grenade launcher
    case 6: {_myweapon = "rhs_weap_ak103_1";};
    case 7: {_myweapon = "rhs_weap_ak104_zenitco01_afg";};
    case 8: {_myweapon = "rhs_weap_ak105_pgs64";};
    case 9: {_myweapon = "rhs_weap_ak74";};
    case 10: {_myweapon = "rhs_weap_ak74m";};
    case 11: {_myweapon = "rhs_weap_ak74m_2mag_camo";};
    case 12: {_myweapon = "rhs_weap_ak74mr_gp25";};
    case 13: {_myweapon = "rhs_weap_ak74n";};
    case 14: {_myweapon = "rhs_weap_akms";};
    case 15: {_myweapon = "rhs_weap_aks74u_sup";};
    // Cases 16–18: Replace CUP AK variants with RHS equivalents
    case 16: {_myweapon = "rhs_weap_ak107_kobra";};
    case 17: {_myweapon = "rhs_weap_ak47";};                          // approximate replacement for CUP AK47
    case 18: {_myweapon = "rhs_weap_aks_gold";};                      // replacement for CUP AKS_Gold
    case 19: {_myweapon = "rhs_weap_m16a4_acog_usmc";};
    case 20: {_myweapon = "rhs_weap_m16a4_bipod";};
    case 21: {_myweapon = "rhs_weap_m16a4_carryhandle_M203";};
    case 22: {_myweapon = "rhs_weap_m4_carryhandle_grip2";};
    case 23: {_myweapon = "rhs_weap_m4_grip3";};
    case 24: {_myweapon = "rhs_weap_m40a5_wd";};
    case 25: {_myweapon = "rhs_weap_m4a1_carryhandle_mstock_grip";};
    case 26: {_myweapon = "rhs_weap_m4a1_m203";};
    case 27: {_myweapon = "rhs_weap_m4a1_m320";};
    case 28: {_myweapon = "rhs_weap_m4a1_wd";};
    case 29: {_myweapon = "rhs_weap_m4a1_wd_mstock_grip3";};
    case 30: {_myweapon = "rhs_weap_hk416d10_LMT_d";};
    case 31: {_myweapon = "rhs_weap_hk416d10_LMT_wd_grip2";};
    case 32: {_myweapon = "rhs_weap_hk416d145_wd_2_grip2";};
    // Cases 33–35: Replace CUP CZ805 entries with RHS M16A4 variants
    case 33: {_myweapon = "rhs_weap_m16a4_vfg";};
    case 34: {_myweapon = "rhs_weap_m16a4_eotech";};
    case 35: {_myweapon = "rhs_weap_m16a4_m320";};
    case 36: {_myweapon = "rhs_weap_fnfal";};                          // FN FAL (RHS version)
    case 37: {_myweapon = "rhs_weap_ak103";};                          
    case 38: {_myweapon = "rhs_weap_m4a1";};                           // plain M4A1 for mid-range
    case 39: {_myweapon = "rhs_weap_m16a4_carryhandle";};              
    case 40: {_myweapon = "rhs_weap_m4a1_m203";};                      
    case 41: {_myweapon = "rhs_weap_m4a1";};                           
    case 42: {_myweapon = "rhs_weap_m4a1_wd";};                        
    case 43: {_myweapon = "rhs_weap_m16a4_snds";};                     
    case 44: {_myweapon = "rhs_weap_m16a4_vfg";};                      
    case 45: {_myweapon = "rhs_weap_M590_8RD";};
    // Cases 46–48: Replace CUP shotguns with RHS equivalents
    case 46: {_myweapon = "rhs_weap_aa12";};                           // AA-12 shotgun
    case 47: {_myweapon = "rhs_weap_m1014";};                          
    case 48: {_myweapon = "rhs_weap_saiga12k";};
    case 49: {_myweapon = "rhs_weap_pm63";};
    // Cases 50–52: Replace CUP light machine guns with RHS
    case 50: {_myweapon = "rhs_weap_pkm";}; // rhs_weap_rpk74m
	case 51: {_myweapon = "rhs_weap_pkm";};
    //case 51: {_myweapon = "rhs_weap_rpk74";}; // rhs_weap_rpk74
    case 52: {_myweapon = "rhs_weap_m249";};                          
    case 53: {_myweapon = "rhs_weap_m249_pip_S";};
    case 54: {_myweapon = "rhs_weap_pkp";};
    // Cases 55–56: Replace CUP SMGs with RHS alternatives
    case 55: {_myweapon = "rhs_weap_ump45";};                          
    case 56: {_myweapon = "rhs_weap_mp7a1";};
    case 57: {_myweapon = "rhsusf_weap_MP7A1_desert";};
    case 58: {_myweapon = "rhs_weap_asval_grip";};
    case 59: {_myweapon = "rhs_weap_vss_grip";};
    // Cases 60–61: Designated marksman / sniper rifles
    case 60: {_myweapon = "rhs_weap_m24sws";};
    case 61: {_myweapon = "rhs_weap_m40a5_wd";};
    // Cases 62–64: Replace CUP srifles with RHS sniper/DMR rifles
    case 62: {_myweapon = "rhs_weap_sr25";};
    case 63: {_myweapon = "rhs_weap_m14ebrri";};
    case 64: {_myweapon = "rhs_weap_svdp";};                          
    // Cases 65–67: More high-end sniper options
    case 65: {_myweapon = "rhs_weap_sr25";};                          
    case 66: {_myweapon = "rhs_weap_m107";};
    case 67: {_myweapon = "rhs_weap_m14ebrri";};
    // Cases 68–71: Additional high-power options
    case 68: {_myweapon = "rhs_weap_m107";};
    case 69: {_myweapon = "rhs_weap_m14ebrri";};
    case 70: {_myweapon = "rhs_weap_leeenfield";};                     // bolt-action Lee-Enfield
    case 71: {_myweapon = "rhs_weap_sr25";};
    default {};
};
if (_weaponR < 72) then {
    _ammobox addWeaponCargo [_myweapon, 1];
    _magazinearray = getArray (configFile >> "CfgWeapons" >> _myweapon >> "magazines");
    _mymagazine = _magazinearray select 0;
    _randmagazine = floor (random [1,2,8]);	// random between 1 and 8, weighted towards mid of 2
    if (_randmagazine > 0) then {
        _ammobox addMagazineCargo [_mymagazine, _randmagazine];
    };
};

// ─── Pistol Switch (13 cases) ─────────────────────────────────────────────
_mypistol = "1";
_pistolR = floor random 13;
switch(_pistolR) do {
    case 0: {_mypistol = "rhsusf_weap_m9";};
    case 1: {_mypistol = "rhs_weap_makarov_pmm";};
    case 2: {_mypistol = "rhsusf_weap_m1911a1";};
    case 3: {_mypistol = "rhsusf_weap_m9";};
    case 4: {_mypistol = "rhs_weap_makarov_pmm";};
    case 5: {_mypistol = "rhsusf_weap_m1911a1";};
    case 6: {_mypistol = "rhs_weap_pya";};
    case 7: {_mypistol = "rhs_weap_M320";};                     // if using M320 as a grenade launcher variant sidearm
    case 8: {_mypistol = "rhs_weap_rsp30_red";};
    case 9: {_mypistol = "rhsusf_weap_p226";};                    // alternative RHS pistol
    case 10: {_mypistol = "rhsusf_weap_m9";};
    case 11: {_mypistol = "rhsusf_weap_m9";};
    case 12: {_mypistol = "rhsusf_weap_p226";};
    default {};
};
if (_pistolR < 13) then {
    _ammobox addWeaponCargo [_mypistol, 1];
    _magazinearray = getArray (configFile >> "CfgWeapons" >> _mypistol >> "magazines");
    _mymagazine = _magazinearray select 0;
    _randmagazine = floor (random [1,2,8]);
    if (_randmagazine > 0) then {
        _ammobox addMagazineCargo [_mymagazine, _randmagazine];
    };
};

// ─── Backpack Switch (19 cases) ────────────────────────────────────────────
_mybackpack = "1";
_backpackR = floor random 19;
switch(_backpackR) do {
    case 0: {_mybackpack = "rhsusf_assault_eagleaiii_ucp";};
    case 1: {_mybackpack = "rhsusf_assault_eagleaiii_ucp";};       // duplicate for increased chance
    case 2: {_mybackpack = "rhsusf_falconii_mc";};
    case 3: {_mybackpack = "rhs_sidor";};
    case 4: {_mybackpack = "rhs_assault_umbts";};
    case 5: {_mybackpack = "rhsusf_assault_eagleaiii_coy";};
    case 6: {_mybackpack = "rhsusf_coyotePack";};
    case 7: {_mybackpack = "rhsusf_assault_pack";};
    case 8: {_mybackpack = "rhsusf_falconii";};
    case 9: {_mybackpack = "rhsusf_dvid_Backpack";};
    case 10: {_mybackpack = "rhsusf_assault_pack_blk";};
    case 11: {_mybackpack = "rhsusf_assault_pack_ucp";};
    case 12: {_mybackpack = "rhsusf_falconii_coyote";};
    case 13: {_mybackpack = "rhsusf_falconii_m81";};
    case 14: {_mybackpack = "rhsusf_coyote";};
    case 15: {_mybackpack = "rhsusf_backpack";};
    case 16: {_mybackpack = "rhsusf_sidor_variant";};
    case 17: {_mybackpack = "rhsusf_assault_eagleaiii_d";};
    case 18: {_mybackpack = "rhsusf_assault_eagleaiii_wd";};
    default {};
};
if (_backpackR < 19) then {
    _ammobox addBackPackCargo [_mybackpack, 1];
};

// ─── Gear / Vest Switch (49 cases) ──────────────────────────────────────────
_myvest = "1";
_vestR = floor random 49;
switch(_vestR) do {
    case 0: {_myvest = "rhs_6b13_emr_6sh92_radio";};             // RHS radio remains
    case 1: {_myvest = "rhsusf_chestrig_ucp";};                     // replacement for chestrig
    case 2: {_myvest = "rhsusf_platecarrier_mc";};                  // RHS plate carrier
    case 3: {_myvest = "rhsusf_platecarrier_ocp";};                 // alternate plate carrier
    case 4: {_myvest = "rhsusf_tacvest";};                          
    case 5: {_myvest = "rhsusf_platecarrier_lx";};                  
    case 6: {_myvest = "rhs_6b13_6sh92_headset_mapcase";};          
    case 7: {_myvest = "rhs_6b23_6sh116_vog";};                     
    case 8: {_myvest = "rhs_6b23_6sh92_vog";};                      
    case 9: {_myvest = "rhs_6b23_digi_6sh92_Spetsnaz";};            
    case 10: {_myvest = "rhs_6b23_ML_6sh92_vog";};                  
    case 11: {_myvest = "rhs_6b26_ess";};                           
    case 12: {_myvest = "rhs_6b27m_digi_ess_bala";};                
    case 13: {_myvest = "rhs_6b28_flora";};                         
    case 14: {_myvest = "rhs_6sh92_digi_headset";};                 
    case 15: {_myvest = "rhs_6sh92_vsr_radio";};                    
    case 16: {_myvest = "rhsusf_mbav";};                            
    case 17: {_myvest = "rhsusf_mbav_rifleman";};                   
    case 18: {_myvest = "rhsusf_iotv_ocp_Teamleader";};            
    case 19: {_myvest = "rhsusf_iotv_ocp_Rifleman";};               
    case 20: {_myvest = "rhsusf_iotv_ucp_Rifleman";};               
    case 21: {_myvest = "rhsusf_spc";};                             
    case 22: {_myvest = "rhsusf_spc_marksman";};                    
    case 23: {_myvest = "rhsusf_spcs_ocp";};                        
    case 24: {_myvest = "rhsusf_spcs_ucp_rifleman";};               
    // Cases 25–48: Additional RHS vest/armour options to round out the array
    case 25: {_myvest = "rhsusf_platecarrier_m81";};
    case 26: {_myvest = "rhsusf_platecarrier_m81";};
    case 27: {_myvest = "rhsusf_chestrig_grn";};
    case 28: {_myvest = "rhsusf_chestrig_od";};
    case 29: {_myvest = "rhsusf_mbarmor_plate";};
    case 30: {_myvest = "rhsusf_mbarmor";};
    case 31: {_myvest = "rhsusf_spc_coy";};
    case 32: {_myvest = "rhsusf_spc_d";};
    case 33: {_myvest = "rhsusf_assault_vest";};
    case 34: {_myvest = "rhsusf_assault_vest";};
    case 35: {_myvest = "rhsusf_field_vest";};
    case 36: {_myvest = "rhsusf_leather_vest";};
    case 37: {_myvest = "rhsusf_harness";};
    case 38: {_myvest = "rhsusf_harness_2";};
    case 39: {_myvest = "rhsusf_platecarrier_rifleman";};
    case 40: {_myvest = "rhsusf_platecarrier_medic";};
    case 41: {_myvest = "rhsusf_platecarrier_specialist";};
    case 42: {_myvest = "rhsusf_chestrig";};
    case 43: {_myvest = "rhsusf_chestrig2";};
    case 44: {_myvest = "rhsusf_platecarrier_light";};
    case 45: {_myvest = "rhsusf_vest_light";};
    case 46: {_myvest = "rhsusf_vest_heavy";};
    case 47: {_myvest = "rhsusf_platecarrier_heavy";};
    case 48: {_myvest = "rhsusf_chestrig_ucp";};
    default {};
};
if (_vestR < 49) then {
    _ammobox addItemCargo [_myvest, 1];
};

// ─── Uniform Switch (80 cases) ─────────────────────────────────────────────
_myunif = "1";
_unifR = floor random 80;
switch(_unifR) do {
    case 0: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 1: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 2: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 3: {_myunif = "rhs_uniform_FROG01_d";};
    case 4: {_myunif = "rhs_uniform_g3_mc";};
    case 5: {_myunif = "rhs_uniform_m88_patchless";};
    case 6: {_myunif = "rhs_uniform_msv_emr";};
    case 7: {_myunif = "rhs_uniform_vdv_emr";};
    case 8: {_myunif = "rhs_uniform_vdv_flora";};
    case 9: {_myunif = "rhs_uniform_olive";};                // additional RHS uniform
    case 10: {_myunif = "rhs_uniform_gorka_3";};
    case 11: {_myunif = "rhs_uniform_FROG01_d";};
    case 12: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 13: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 14: {_myunif = "rhs_uniform_m88_patchless";};
    case 15: {_myunif = "rhs_uniform_vdv_flora";};
    case 16: {_myunif = "rhs_uniform_vdv_emr";};
    case 17: {_myunif = "rhs_uniform_msv_emr";};
    case 18: {_myunif = "rhs_uniform_g3_mc";};
    case 19: {_myunif = "rhs_uniform_FROG01_d";};
    // Cases 20–79: Duplicate or mix in other RHS uniform variants as desired.
    // (For brevity, these are filled with repeats of the above; feel free to expand.)
    case 20: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 21: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 22: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 23: {_myunif = "rhs_uniform_FROG01_d";};
    case 24: {_myunif = "rhs_uniform_g3_mc";};
    case 25: {_myunif = "rhs_uniform_m88_patchless";};
    case 26: {_myunif = "rhs_uniform_msv_emr";};
    case 27: {_myunif = "rhs_uniform_vdv_emr";};
    case 28: {_myunif = "rhs_uniform_vdv_flora";};
    case 29: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 30: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 31: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 32: {_myunif = "rhs_uniform_FROG01_d";};
    case 33: {_myunif = "rhs_uniform_g3_mc";};
    case 34: {_myunif = "rhs_uniform_m88_patchless";};
    case 35: {_myunif = "rhs_uniform_msv_emr";};
    case 36: {_myunif = "rhs_uniform_vdv_emr";};
    case 37: {_myunif = "rhs_uniform_vdv_flora";};
    case 38: {_myunif = "rhs_uniform_gorka_3";};
    case 39: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 40: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 41: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 42: {_myunif = "rhs_uniform_FROG01_d";};
    case 43: {_myunif = "rhs_uniform_g3_mc";};
    case 44: {_myunif = "rhs_uniform_m88_patchless";};
    case 45: {_myunif = "rhs_uniform_msv_emr";};
    case 46: {_myunif = "rhs_uniform_vdv_emr";};
    case 47: {_myunif = "rhs_uniform_vdv_flora";};
    case 48: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 49: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 50: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 51: {_myunif = "rhs_uniform_FROG01_d";};
    case 52: {_myunif = "rhs_uniform_g3_mc";};
    case 53: {_myunif = "rhs_uniform_m88_patchless";};
    case 54: {_myunif = "rhs_uniform_msv_emr";};
    case 55: {_myunif = "rhs_uniform_vdv_emr";};
    case 56: {_myunif = "rhs_uniform_vdv_flora";};
    case 57: {_myunif = "rhs_uniform_gorka_3";};
    case 58: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 59: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 60: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 61: {_myunif = "rhs_uniform_FROG01_d";};
    case 62: {_myunif = "rhs_uniform_g3_mc";};
    case 63: {_myunif = "rhs_uniform_m88_patchless";};
    case 64: {_myunif = "rhs_uniform_msv_emr";};
    case 65: {_myunif = "rhs_uniform_vdv_emr";};
    case 66: {_myunif = "rhs_uniform_vdv_flora";};
    case 67: {_myunif = "rhs_uniform_gorka_3";};
    case 68: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 69: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 70: {_myunif = "rhs_uniform_emr_des_patchless";};
    case 71: {_myunif = "rhs_uniform_FROG01_d";};
    case 72: {_myunif = "rhs_uniform_g3_mc";};
    case 73: {_myunif = "rhs_uniform_m88_patchless";};
    case 74: {_myunif = "rhs_uniform_msv_emr";};
    case 75: {_myunif = "rhs_uniform_vdv_emr";};
    case 76: {_myunif = "rhs_uniform_vdv_flora";};
    case 77: {_myunif = "rhs_uniform_cu_ocp_101st";};
    case 78: {_myunif = "rhs_uniform_cu_ucp_10th";};
    case 79: {_myunif = "rhs_uniform_emr_des_patchless";};
    default {};
};
if (_unifR < 80) then {
    _ammobox addItemCargo [_myunif, 1];
};

// ─── Helmet Switch (60 cases) ─────────────────────────────────────────────
_myhelm = "1";
_helmR = floor random 60;
switch(_helmR) do {
    case 0: {_myhelm = "rhsusf_hgu56p_mask_skull";};           
    case 1: {_myhelm = "rhs_6b47";};
    case 2: {_myhelm = "rhs_6b47_ess_bala";};
    case 3: {_myhelm = "rhs_6b7_1m_bala2_emr";};
    case 4: {_myhelm = "rhs_6b7_1m_ess_bala";};
    case 5: {_myhelm = "rhsusf_ach_bare_des_headset";};
    case 6: {_myhelm = "rhsusf_ach_bare_semi_headset";};
    case 7: {_myhelm = "rhsusf_ach_bare_wood";};
    case 8: {_myhelm = "rhs_altyn_novisor_ess_bala";};
    case 9: {_myhelm = "rhs_altyn_visordown";};
    case 10: {_myhelm = "rhs_beret_vdv1";};
    case 11: {_myhelm = "rhs_beret_mp1";};
    case 12: {_myhelm = "rhs_fieldcap_ml";};
    case 13: {_myhelm = "rhsusf_opscore_aor2_pelt";};
    case 14: {_myhelm = "rhsusf_opscore_fg";};
    case 15: {_myhelm = "rhsusf_opscore_mc_cover_pelt";};
    case 16: {_myhelm = "rhsusf_opscore_paint_pelt_nsw_cam";};
    case 17: {_myhelm = "rhsusf_opscore_bk_pelt";};
    case 18: {_myhelm = "rhsusf_hgu56p_usa";};
    case 19: {_myhelm = "rhsusf_hgu56p_visor_mask_black";};
    case 20: {_myhelm = "rhsusf_hgu56p_visor_pink";};
    case 21: {_myhelm = "rhs_zsh7a_mike_alt";};
    // Cases 22–29: Duplicate a high-quality RHS crew helmet for increased chance.
    case 22: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 23: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 24: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 25: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 26: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 27: {_myhelm = "rhsusf_shemagh_od";};
    case 28: {_myhelm = "rhsusf_shemagh_tan";};
    case 29: {_myhelm = "rhsusf_shemagh2_tan";};
    case 30: {_myhelm = "rhsusf_shemagh2_od";};
    case 31: {_myhelm = "rhsusf_hgu56p_mask_skull";};
    case 32: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 33: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 34: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 35: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 36: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 37: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 38: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 39: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 40: {_myhelm = "rhsusf_hgu56p_mask_skull";};
    case 41: {_myhelm = "rhsusf_hgu56p_usa";};
    case 42: {_myhelm = "rhsusf_hgu56p_visor_mask_black";};
    case 43: {_myhelm = "rhsusf_hgu56p_visor_pink";};
    case 44: {_myhelm = "rhs_zsh7a_mike_alt";};
    case 45: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 46: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 47: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 48: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 49: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 50: {_myhelm = "rhsusf_shemagh_od";};
    case 51: {_myhelm = "rhsusf_shemagh_tan";};
    case 52: {_myhelm = "rhsusf_shemagh2_tan";};
    case 53: {_myhelm = "rhsusf_shemagh2_od";};
    case 54: {_myhelm = "rhsusf_hgu56p_mask_skull";};
    case 55: {_myhelm = "rhsusf_hgu56p_visor_mask_black";};
    case 56: {_myhelm = "rhsusf_hgu56p_visor_pink";};
    case 57: {_myhelm = "rhs_zsh7a_mike_alt";};
    case 58: {_myhelm = "rhs_H_HelmetCrew_O";};
    case 59: {_myhelm = "rhs_H_HelmetCrew_O";};
};
if (_helmR < 60) then {
    _ammobox addItemCargo [_myhelm, 1];
};

// ─── Attachment / Misc Switch (74 cases) ─────────────────────────────────────
_myitem = "1";
_itemR = floor random 74;
switch(_itemR) do {
    case 0: {_myitem = "ItemGPS";};
    case 1: {_myitem = "ItemRadio";};
    case 2: {_myitem = "NVGoggles";};
    case 3: {_myitem = "muzzle_snds_H";};
    case 4: {_myitem = "optic_Arco";};
    case 5: {_myitem = "optic_SOS";};
    case 6: {_myitem = "acc_flashlight";};
    case 7: {_myitem = "optic_NVS";};
    case 8: {_myitem = "optic_Nightstalker";};
    case 9: {_myitem = "optic_tws";};
    case 10: {_myitem = "optic_LRPS";};
    case 11: {_myitem = "optic_Holosight";};
    case 12: {_myitem = "NVGoggles_INDEP";};
    case 13: {_myitem = "Chemlight_green";};
    case 14: {_myitem = "Chemlight_red";};
    case 15: {_myitem = "Chemlight_yellow";};
    case 16: {_myitem = "Chemlight_blue";};
    case 17: {_myitem = "3Rnd_HE_Grenade_shell";};
    case 18: {_myitem = "1Rnd_SmokePurple_Grenade_shell";};
    case 19: {_myitem = "HandGrenade";};
    case 20: {_myitem = "optic_Hamr";};
    case 21: {_myitem = "optic_Aco";};
    case 22: {_myitem = "optic_Aco_smg";};
    case 23: {_myitem = "optic_Holosight_smg";};
    case 24: {_myitem = "optic_MRCO";};
    case 25: {_myitem = "optic_DMS";};
    case 26: {_myitem = "muzzle_snds_338_black";};
    case 27: {_myitem = "bipod_01_F_blk";};
    case 28: {_myitem = "Binocular";};
    case 29: {_myitem = "Rangefinder";};
    case 30: {_myitem = "Laserdesignator";};
    case 31: {_myitem = "rhs_acc_1p29";};
    case 32: {_myitem = "rhs_acc_1p29_asval";};
    case 33: {_myitem = "rhs_acc_1p78";};
    case 34: {_myitem = "rhs_acc_1pn34";};
    case 35: {_myitem = "rhs_acc_1pn93_2";};
    case 36: {_myitem = "rhs_acc_2dpZenit";};
    case 37: {_myitem = "rhs_acc_dtk";};
    case 38: {_myitem = "rhs_acc_dtk3";};
    case 39: {_myitem = "rhs_acc_ekp8_02";};
    case 40: {_myitem = "rhs_acc_ekp8_18c";};
    case 41: {_myitem = "rhs_acc_perst1ik";};
    case 42: {_myitem = "rhs_acc_pgo7v_asval";};
    case 43: {_myitem = "rhs_acc_pgo7v";};
    case 44: {_myitem = "rhs_acc_pkas";};
    case 45: {_myitem = "rhs_acc_pso1m21";};
    case 46: {_myitem = "rhs_acc_pso1m21_svd";};
    case 47: {_myitem = "rhsusf_acc_ACOG";};
    case 48: {_myitem = "rhsusf_acc_ACOG_d_3d";};
    case 49: {_myitem = "rhsusf_acc_ACOG_RMR";};
    case 50: {_myitem = "rhsusf_acc_ACOG2";};
    case 51: {_myitem = "rhsusf_acc_anpeq15";};
    case 52: {_myitem = "rhsusf_acc_anpeq15_light_h";};
    case 53: {_myitem = "rhsusf_acc_ELCAN";};
    case 54: {_myitem = "rhsusf_acc_EOTECH";};
    case 55: {_myitem = "rhsusf_acc_g33_T1";};
    case 56: {_myitem = "rhsusf_acc_grip2";};
    case 57: {_myitem = "rhsusf_acc_grip4";};
    case 58: {_myitem = "rhsusf_acc_LEUPOLDMK4";};
    case 59: {_myitem = "rhsusf_acc_M2010S_d";};
    case 60: {_myitem = "rhsusf_acc_M2A1";};
    case 61: {_myitem = "rhsusf_acc_M8541_low_d";};
    case 62: {_myitem = "rhsusf_acc_nt4_tan";};
    case 63: {_myitem = "rhsusf_acc_rotex_mp7_desert";};
    case 64: {_myitem = "rhsusf_acc_SpecterDR_A_3d";};
    case 65: {_myitem = "rhsusf_acc_SpecterDR_D_3D";};
    case 66: {_myitem = "rhsusf_acc_SR25S";};
    case 67: {_myitem = "rhsusf_acc_T1_high";};
    case 68: {_myitem = "rhsusf_acc_T1_low_fwd";};
    case 69: {_myitem = "rhsusf_acc_Flashlight";};      // RHS flashlight
    case 70: {_myitem = "rhsusf_acc_ANPEQ_2";};           // RHS AN/PEQ-2
    case 71: {_myitem = "rhsusf_acc_sffh";};               // RHS SFFH
    case 72: {_myitem = "rhsusf_lerca1200_black";};
    case 73: {_myitem = "rhsusf_vector21";};
    default {};
};
if (_itemR < 74) then {
    _ammobox addItemCargo [_myitem, 1];
};

// ─── Ammo / Consumable Switch (14 cases) ────────────────────────────────────
_myconsum = "1";
_rConsum = floor random 14;
switch(_rConsum) do {
    case 0: {_myconsum = "FirstAidKit";};
    case 1: {_myconsum = "30Rnd_65x39_caseless_mag";};
    case 2: {_myconsum = "20Rnd_762x51_Mag";};
    case 3: {_myconsum = "30Rnd_9x21_Mag";};
    case 4: {_myconsum = "30Rnd_556x45_Stanag";};
    case 5: {_myconsum = "HandGrenade";}; 
    case 6: {_myconsum = "SmokeShell";}; 
    case 7: {_myconsum = "SmokeShellGreen";}; 
    case 8: {_myconsum = "FirstAidKit";};
    case 9: {_myconsum = "MineDetector";};
};
if (_rConsum < 10) then {
    _ammobox addItemCargo [_myconsum, 1];
};

// If gear, weapon, and backpack selections are too “high-end,” delete the box.
if ((_vestR > 35) && (_weaponR > 38) && (_backpackR > 9)) then {
    deleteVehicle _ammobox;
};
*/
