

//ExileSecurity_onMouseZChanged


 
private["_scroll"];
_scroll = _this select 1;




if(_scroll > 0)then
{
	ExileCameraViewMouseZFoV = (((ExileCameraViewMouseZFoV - 0.05)min 1)max 0.05);	
}
else
{
	ExileCameraViewMouseZFoV = (((ExileCameraViewMouseZFoV + 0.05)min 1)max 0.05);
};
ExileClientCameraObject camSetFov ExileCameraViewMouseZFoV;
ExileClientCameraObject camCommit 0;
