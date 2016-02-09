//ExileSecurity_baseWeapons_camAction

private["_newCameraPerent","_startPosition","_endPosition"];
_newCameraPerent = _this select 0;
if(!isNull ExileClientWeaponParentObject)then
{
	ExileClientWeaponParentObject setVariable ["ExileCameraInUse",false,true];
};

ExileClientWeaponParentObject = _newCameraPerent;
ExileClientWeaponParentObject setVariable ["ExileCameraInUse",true,true];
_startPosition = ExileClientWeaponParentObject modelToWorld (ExileClientWeaponParentObject selectionPosition "cctv_view_from");
_endPosition = ExileClientWeaponParentObject modelToWorld (ExileClientWeaponParentObject selectionPosition "cctv_view_to");
if (_this select 1) then
{
	ExileClientWeaponObject = "camera" camCreate _startPosition;
};
ExileClientWeaponObject camSetPos _startPosition;
ExileClientWeaponObject camSetTarget _endPosition;
ExileCameraViewMouseZFoV = 1;
ExileClientWeaponObject camPrepareFOV ExileCameraViewMouseZFoV;
ExileClientWeaponObject camCommit 0;
showCinemaBorder false;
ExileClientWeaponObject
