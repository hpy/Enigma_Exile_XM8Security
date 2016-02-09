//ExileSecurity_baseCameras_onCameraDropDownChanged


private["_cameraCombo","_index","_cameraNetId","_camera","_WeaponCombo","_WeaponNetId","_display"];
_cameraCombo = _this select 0;
_index = _this select 1;

CameraIndex = _index;

_display = uiNamespace getVariable ["RscExileCameraView",displayNull];
_WeaponCombo = _display displayCtrl 6003;


_WeaponNetId = (_WeaponCombo lbData Weaponindex);
if!(_WeaponNetId isEqualTo "0")then
{

	_weapon = (objectFromNetId _WeaponNetId);

	{ if !(isPlayer _x) then {
	_weapon deleteVehicleCrew _x};  
	} forEach crew _weapon;

	if (!isNull ExileClientWeaponParentObject) then
	{
	    ExileClientWeaponParentObject setVariable ["ExileCameraInUse", false, true];
	};
};

lbClear _WeaponCombo;




_cameraNetId = (_cameraCombo lbData _index);
if(_cameraNetId isEqualTo "0")then
{
	true call ExileClient_gui_baseCamera_event_toggleCameraScreen;
	if (!isNull ExileClientCameraParentObject) then
	{
	    ExileClientCameraParentObject setVariable ["ExileCameraInUse", false, true];
	};
}
else
{
	_camera = (objectFromNetId _cameraNetId);
	if!(_camera getVariable ["ExileCameraInUse",false])then
	{


		[_camera,isNull ExileClientCameraObject] call ExileSecurity_baseCamera_camAction; 
		ExileClientCameraObject cameraEffect ["internal", "back"];
		ExileCameraViewMouseZFoV = 0.7;
		ExileClientCameraObject camPrepareFOV ExileCameraViewMouseZFoV;
		false call ExileClient_gui_baseCamera_event_toggleCameraScreen;
	}
	else
	{
		["Whoops",["Camera in use. No can do :("]] call ExileClient_gui_notification_event_addNotification;
	};
};
