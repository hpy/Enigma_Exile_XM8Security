//ExileClient_gui_baseCamera_event_main_onMouseButtonUp

 
private["_control","_rightClick","_positionX","_positionY","_inScreen","_leftClick"];
_control = _this select 0;
_rightClick = if((_this select 1) isEqualTo 1)then{true}else{false};
_leftClick = if((_this select 1) isEqualTo 0)then{true}else{false};
_positionX = _this select 2;
_positionY = _this select 3;
_inScreen = [_positionX,_positionY] call ExileClient_util_display_mouseControl_inLimit;

	Firebuttondown = false; 
	
if(_inScreen)then
{

	if(_leftClick)then
	{
		ExileWeaponRightClickDown = false;
	};



	if(_rightClick)then
	{
		ExileCameraRightClickDown = false;
	};
};
true