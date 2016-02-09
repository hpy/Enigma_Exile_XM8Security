
 //* ExileSecurity_onMouseButtonDown


private["_control","_rightClick","_positionX","_positionY","_inScreen","_WeaponNetId","_leftClick","_WeaponCombo","_display"];
_control = _this select 0;
_rightClick = if((_this select 1) isEqualTo 1)then{true}else{false};
_leftClick = if((_this select 1) isEqualTo 0)then{true}else{false}; 
_positionX = _this select 2;
_positionY = _this select 3;
_inScreen = [_positionX,_positionY] call ExileClient_util_display_mouseControl_inLimit;



_display = uiNamespace getVariable ["RscExileCameraView",displayNull];
_WeaponCombo = _display displayCtrl 6003;
_WeaponNetId = (_WeaponCombo lbData Weaponindex);


if(_inScreen)then
{
	if(_rightClick) then
	{

	if (!(_WeaponNetId isEqualTo "0") && !(isNull _WeaponNetId)) then { 

		Firebuttondown = false;
		ExileCameraRightClickDown = false;
		ExileWeaponRightClickDown = true;

	} else {
		ExileCameraRightClickDown = true;
		ExileWeaponRightClickDown = false;
		};
	};



	if(_leftClick && !(_WeaponNetId isEqualTo "0")) then 
	{

	Firebuttondown = true; 

[] spawn { while {Firebuttondown} do {
		GhostGunner fireAtTarget [objNull];
		sleep 0.1;
			};
		 };

	};


};


ExileClientDisplayResetFocus = true;
true
