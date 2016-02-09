/*

ExileSecurity_onUnload.sqf

 */
Private ["_Weapons"];

_range = ExileCameraSystemBase getVariable ["ExileTerritorySize",0];
_Weapons = ExileCameraSystemBase nearObjects ["I_HMG_01_F",_range];

	{ if !(isPlayer _x) then {
	_Weapons deleteVehicleCrew _x}; 
	} forEach crew _Weapons;


ExileCameraSystemBase = objNull;
ExileClientCameraRightClickDown = false;
if!(isNull ExileClientCameraObject)then
{
	ExileClientCameraObject cameraEffect ["terminate", "back"];
	camDestroy ExileClientCameraObject;
	ExileClientCameraObject = objNull;
	ExileClientCameraParentObject setVariable ["ExileCameraInUse",false,true];
	ExileClientCameraParentObject = objNull;
	ExileClientWeaponParentObject = objNull;
};

if!(isNull ExileClientWeaponObject)then
{
	ExileClientWeaponObject cameraEffect ["terminate", "back"];
	camDestroy ExileClientWeaponObject;
	ExileClientWeaponObject = objNull;
	ExileClientWeaponParentObject setVariable ["ExileCameraInUse",false,true];
	ExileClientWeaponParentObject = objNull;
};




ExileClientCameraNVG = false;
ExileClientPlayerIsInSecurityCamera = false;
ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1.1, -0.05, [0.4, 0.2, 0.3, -0.1], [0.79, 0.72, 0.62, 1], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]];
ExileClientPostProcessingColorCorrections ppEffectCommit 0;
ExileClientPostProcessingColorCorrections ppEffectEnable true;
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectCommit 0;
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectEnable false;
true call ExileClient_gui_hud_toggle;
true


