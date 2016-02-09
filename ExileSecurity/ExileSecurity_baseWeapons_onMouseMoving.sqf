/**
 * ExileSecurity_baseWeapons_onMouseMoving
 */


private["_control","_xAxis","_yAxis","_display","_currentPosition","_inScreen","_deflectionHorisontal","_deflectionVertical","_currentAnimationYaw","_currentAnimationPitch","_newAnimYaw","_newAnimPitch","_startPosition","_endPosition","_excludedControls","_backgroundControls","_ctrlClassname"];
_control = _this select 0;
_xAxis = _this select 1;
_yAxis = _this select 2;
_display = uiNamespace getVariable ["RscExileCameraView",displayNull];
_currentPosition = [_xAxis,_yAxis];
_inScreen = _currentPosition  call ExileClient_util_display_mouseControl_inLimit;
if(_inScreen)then
{
	if(isNil "ExileCameraMousePrevious")exitWith{ExileCameraMousePrevious = _currentPosition;};
	if(ExileCameraRightClickDown)then
	{
		if(!isNull ExileClientWeaponParentObject)then
		{
			if!(_currentPosition isEqualTo ExileCameraMousePrevious)then
			{
				_deflectionHorisontal = (_currentPosition select 0) - (ExileCameraMousePrevious select 0);
				_deflectionVertical = (_currentPosition select 1) - (ExileCameraMousePrevious select 1);


				_currentAnimationYaw = ExileClientWeaponParentObject animationPhase "ExileCctvYaw";
				_currentAnimationPitch = ExileClientWeaponParentObject animationPhase "ExileCctvPitch";

				_newAnimYaw = ((((_deflectionHorisontal * 3) + _currentAnimationYaw) min 1) max 0);
				_newAnimPitch = ((((_deflectionVertical * 2) + _currentAnimationPitch) min 1) max 0);

				ExileClientWeaponParentObject animate ["ExileCctvYaw",_newAnimYaw,true];
				ExileClientWeaponParentObject animate ["ExileCctvPitch",_newAnimPitch,true];

				_startPosition = ExileClientWeaponParentObject modelToWorld (ExileClientWeaponParentObject selectionPosition "cctv_view_from");
				_endPosition = ExileClientWeaponParentObject modelToWorld (ExileClientWeaponParentObject selectionPosition "cctv_view_to");
				ExileClientWeaponObject camSetPos _startPosition;
				ExileClientWeaponObject camSetTarget _endPosition;
				ExileClientWeaponObject camCommit 0;


			};
		};
	};
	ExileCameraMousePrevious = _currentPosition;
}
else
{
	if(ExileClientDisplayResetFocus)then
	{
		_excludedControls = getArray(configFile >> "RscExileCameraView" >> "hideControls");
		_excludedControls pushBack (ctrlClassName _control);
		_backgroundControls = "true" configClasses (configFile >> "RscExileCameraView" >> "controlsBackground");
		_excludedControls append _backgroundControls;
		{
			_ctrlClassname = (ctrlClassName _x);
			if!(_ctrlClassname in _excludedControls)then
			{
				ctrlSetFocus _x;
			};
		}
		forEach allControls _display;
		ExileClientDisplayResetFocus = false;
	};
	ExileCameraRightClickDown = false;
};
