//ExileSecurity_handleTerritorySelection


private["_display","_territoryDropDown","_territorySelected","_index","_flagNetID","_flagObject","_basecameras"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_territoryDropDown = _display displayCtrl 5002;
_territorySelected = lbCurSel _territoryDropDown;

_flagNetID = _territoryDropDown lbData _territorySelected;

_flagObject = objectFromNetId _flagNetID; 

_basecameras = 0;
_basecameras = (getpos _flagObject) nearobjects ["Exile_Construction_BaseCamera_Static" ,160];
_basecameras = count _basecameras;


if !(SecurityDebug) then {

if !(_basecameras >= 1) exitWith {systemChat "You have no security camera's installed!"}; 

if (isNull _flagObject) exitWith {systemChat "Please Select a Territory First!"}; 

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "xm8apps\ExileSecurity\sounds\connect.ogg";
playSound3D [_soundToPlay, player, false, getPos player, 2, 1, 50];  // 2 decibels and fades out at 50m

};


ExileCameraSystemBase = _flagObject;
createDialog "RscExileCameraView";

false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;

call ExileSecurity_onConnectLoad;
