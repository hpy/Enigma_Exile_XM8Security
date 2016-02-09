/*

ExileSecurity_baseCamera_camAction

 */
 
private["_newCameraPerent","_startPosition","_endPosition"];
_newCameraPerent = _this select 0;



[
"conFile",format ["ExileSecurity_baseCamera_camAction we have called with a newcameraparent : %1",_newCameraPerent]
] call diaglog;


if(!isNull ExileClientCameraParentObject)then
{
	ExileClientCameraParentObject setVariable ["ExileCameraInUse",false,true];	
};


ExileClientCameraParentObject = _newCameraPerent;

ExileClientCameraParentObject setVariable ["ExileCameraInUse",true,true];	
_startPosition = ExileClientCameraParentObject modelToWorld (ExileClientCameraParentObject selectionPosition "cctv_view_from");
_endPosition = ExileClientCameraParentObject modelToWorld (ExileClientCameraParentObject selectionPosition "cctv_view_to");
if (_this select 1) then
{
	ExileClientCameraObject = "camera" camCreate _startPosition;
};
ExileClientCameraObject camSetPos _startPosition;
ExileClientCameraObject camSetTarget _endPosition;
ExileCameraViewMouseZFoV = 1;
ExileClientCameraObject camPrepareFOV ExileCameraViewMouseZFoV;
ExileClientCameraObject camCommit 0;
showCinemaBorder false;
ExileClientCameraObject