//ExileSecurity_baseWeapons_event_onLoad.sqf

private["_display","_WeaponsCombo","_range","_Weapons","_index"];
_display = uiNamespace getVariable ["RscExileCameraView",displayNull];
_WeaponsCombo = _display displayCtrl 6003;
_range = ExileCameraSystemBase getVariable ["ExileTerritorySize",0];
_Weapons = ExileCameraSystemBase nearObjects ["I_HMG_01_F",_range];
lbClear _WeaponsCombo;
if(_Weapons isEqualTo [])then
{
	_index = _WeaponsCombo lbAdd "No static HMG's in your base";
	_WeaponsCombo lbSetData [_index,"0"];
	_WeaponsCombo lbSetPictureRight [_index,"\exile_assets\texture\ui\cameraView\camera.paa"];
}
else
{
	_index = _WeaponsCombo lbAdd "Select a static HMG";
	_WeaponsCombo lbSetData [_index,"0"];
	_WeaponsCombo lbSetPictureRight [_index,"\exile_assets\texture\ui\cameraView\camera.paa"];
	{
		_index = _WeaponsCombo lbAdd ("HMG " + (str _forEachIndex));
		_WeaponsCombo lbSetData [_index,netId _x];
		_WeaponsCombo lbSetPicture [_index,"\exile_assets\texture\ui\cameraView\camera.paa"];


		if(_x getVariable ["ExileCameraInUse",false])then
		{

			_WeaponsCombo lbSetColor [_index,[221/255, 38/255, 38/255, 1]];
			_WeaponsCombo lbSetPictureRightColor [_index,[221/255, 38/255, 38/255, 1]];
			_WeaponsCombo lbSetTextRight [_index,"IN USE!"];
			_WeaponsCombo lbSetColorRight [_index,[221/255, 38/255, 38/255, 1]];
		}
		else
		{
			_WeaponsCombo lbSetColor [_index,[160/255, 223/255, 59/255, 1]];
		};
	}
	forEach _Weapons;
};

ExileClientPlayerIsInSecurityCamera = true;
ExileClientPostProcessingColorCorrections ppEffectAdjust [1,1.1,-0.05,[0.4,0.2,0.3,-0.1],[0.5,0.5,0.5,0],[0.5,0.5,0.5,0],[0,0,0,0,0,0,4]];
ExileClientPostProcessingColorCorrections ppEffectCommit 0;
ExileClientPostProcessingColorCorrections ppEffectEnable true;
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectCommit 0;
ExileClientPostProcessingSecurityCameraFilmGrain ppEffectEnable true;
false call ExileClient_gui_hud_toggle;
_WeaponsCombo
