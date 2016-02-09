//ExileSecurity_baseWeapons_onCameraDropDownChanged





private["_WeaponCombo","_index","_WeaponNetId","_weapon","_dir"];
_WeaponCombo = _this select 0;
_index = _this select 1;



Weaponindex = _index;

_display = uiNamespace getVariable ["RscExileCameraView",displayNull];
_CamerasCombo = _display displayCtrl 6002;

_CameraNetId = (_CamerasCombo lbData Cameraindex);
if !(_CameraNetId isEqualTo "0")then
{

	if (!isNull ExileClientCameraParentObject) then
	{
	    ExileClientCameraParentObject setVariable ["ExileCameraInUse", false, true];
	};
};

lbClear _CamerasCombo;

_WeaponNetId = (_WeaponCombo lbData _index);
_weapon = (objectFromNetId _WeaponNetId);

{ if !(isPlayer _x) then {
_weapon deleteVehicleCrew _x}; 
} forEach crew _weapon;



if(_WeaponNetId isEqualTo "0") then
{
	true call ExileClient_gui_baseCamera_event_toggleCameraScreen;
	if (!isNull ExileClientWeaponParentObject) then
	{
	    ExileClientWeaponParentObject setVariable ["ExileCameraInUse", false, true];
};

} else {

	if!(_weapon getVariable ["ExileCameraInUse",false])then
	{


titleText ["Currently Remote Control HMG's are non functional", "PLAIN"];


/*
disabled at this time!


				_location = getPosATL _weapon;


				_group = grpNull;
				_group = createGroup independent;
				GhostGunner = _group createUnit["Exile_Unit_Player", _location, [], 0, "CAN_COLLIDE"];
				GhostGunner allowDammage false;
				GhostGunner disableAI "FSM";
				GhostGunner disableAI "MOVE";
				GhostGunner disableAI "AUTOTARGET";
				GhostGunner disableAI "TARGET";
				GhostGunner disableAI "CHECKVISIBLE";
				GhostGunner setPosATL _location;
				GhostGunner assignAsGunner _weapon;
				[GhostGunner] orderGetIn true;
				GhostGunner moveInGunner _weapon;

*/


				//hideObjectGlobal GhostGunner; //must be called by server or he is visible!!!



_startPosition = [0,0,0];
ExileClientWeaponObject = "camera" camCreate _startPosition;
ExileClientWeaponObject camSetPos _startPosition;

ExileClientWeaponObject camSetTarget _endPosition;


ExileClientWeaponObject cameraEffect ["External", "Back"];

ExileClientWeaponObject attachTo [_weapon, [0,0,0], "PiP_pos"];

ExileClientWeaponObject camSetFov 0.1;


ExileClientWeaponParentObject = _weapon;

ExileClientWeaponParentObject setVariable ["ExileCameraInUse",true,true];


showCinemaBorder false;

false call ExileClient_gui_baseCamera_event_toggleCameraScreen; 


	}
	else
	{
		{ if !(isPlayer _x) then {
		_weapon deleteVehicleCrew _x}; 
		} forEach crew _weapon;

		["Whoops",["Static HMG in use. No can do :("]] call ExileClient_gui_notification_event_addNotification;

	};
};
