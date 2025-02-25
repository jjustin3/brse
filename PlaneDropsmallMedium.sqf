_myDropPlane = _this select 0;
if (count _myDropPlane > 0) then { _myDropPlane = _myDropPlane select 0; };

_PlayersDropCount = 8;
switch (BRSEAICount) do {
	case 0: { _PlayersDropCount = 8; };
	case 1: { _PlayersDropCount = 8; };
	case 2: { _PlayersDropCount = 8; };
	case 3: { _PlayersDropCount = 7; };
	case 4: { _PlayersDropCount = 7; };
	case 5: { _PlayersDropCount = 4; };
};

_realHumaninDropPlane1 = count (crew _myDropPlane);
dropCount = dropCount +1;

{
	if (_PlayersDropCount < 1) exitWith {};

	_PlayersDropCount = _PlayersDropCount - 1;
	_rolemy = (assignedVehicleRole _x);
	
	if (count _rolemy > 0) then {
		_role = _rolemy select 0;
		isDrop = floor random(100);

		if (_role isEqualTo 'cargo' && { _x != player } && { isDrop > 30 }) then {
			sleep 0.3;

			0 = [_x] spawn {
				_x = _this select 0;
				_posxh = getPosWorld _x;
				_posxhm = _posxh;
				_rxp = 0;
				_rxm = 0;
				_rym = 0;
				_ryp = 0;
				_dirDir = 0; 
				_Hvelocity = velocity _x;
				_posxh set [0, (_posxh select 0) + 1500];

				if (surfaceIsWater _posxh) then { _rxp = 0 } else { _rxp = floor random (250); };

				_posxh = _posxhm;
				_posxh set [0,(_posxh select 0)-1500];

				if (surfaceIsWater _posxh) then { _rxm = 0 } else { _rxm = floor random (250); };
				
				_posxh = _posxhm;
				_posxh set [1, (_posxh select 1) + 1500];

				if (surfaceIsWater _posxh) then { _ryp = 0 } else { _ryp = floor random (250); };
				
				_posxh = _posxhm;
				_posxh set [1, (_posxh select 1) - 1500];

				if (surfaceIsWater _posxh) then { _rym = 0 } else { _rym = floor random (250); };
				
				_dirDir = floor random (360);
				_x addBackPack "B_parachute";
				unassignVehicle _x;
				moveOut _x;
				sleep 1.2;

				_x setVelocity [
					_rxp - _rxm, 
					_ryp - _rym, 
					(_Hvelocity select 2)
				];

				_x setDir _dirDir;
				sleep 3;
				_x call SummXandY;	
			};
		};
	};
} forEach (crew _myDropPlane);
