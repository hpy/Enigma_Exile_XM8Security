
private ["_display","_MainCaptureArea"];


disableSerialization;
_display = uiNamespace getVariable ["RscExileCameraView",displayNull];



ctrlShow [4005, false];
ctrlShow [4004, false];


_Titlebar = _display ctrlCreate ["RscStructuredText", 6001];
_Titlebar ctrlSetPosition [0.3625 * safezoneW + safezoneX, 0.029 * safezoneH + safezoneY,0.275 * safezoneW,0.11 * safezoneH];
_Titlebar ctrlCommit 0;
_Titlebar ctrlSetStructuredText parseText "<t align='center' font='PuristaBold' size='1.1'>XM8 Security v0.1</t>";

_CameraDropDown = _display ctrlCreate ["RscCombo", 6002, _display displayCtrl 20023];
_CameraDropDown ctrlSetPosition [0.318125 * safezoneW + safezoneX, 0.069 * safezoneH + safezoneY,0.1588540909090909 * safezoneW,0.022 * safezoneH]; //center top positions
_CameraDropDown ctrlCommit 0;

_CameraDropDown ctrlSetEventHandler ["LBSelChanged", "_this call ExileSecurity_baseCameras_onCameraDropDownChanged;"];
_CameraDropDown ctrlSetEventHandler ["MouseButtonClick", "_this call ExileSecurity_baseCamera_event_onLoad;"];

_HMGDropDown = _display ctrlCreate ["RscCombo", 6003, _display displayCtrl 20023];
_HMGDropDown ctrlSetPosition [0.524 * safezoneW + safezoneX, 0.069 * safezoneH + safezoneY,0.1588540909090909 * safezoneW,0.022 * safezoneH]; //center top positions
_HMGDropDown ctrlCommit 0;
_HMGDropDown ctrlSetEventHandler ["LBSelChanged", "_this call ExileSecurity_baseWeapons_onCameraDropDownChanged;"];
_HMGDropDown ctrlSetEventHandler ["MouseButtonClick", "_this call ExileSecurity_baseWeapons_event_onLoad;"];


(findDisplay 20023) displayRemoveEventHandler  ["Unload", _display]; 
(findDisplay 20023) displayAddEventHandler ["Unload","uiNamespace setVariable ['RscExileCameraView', displayNull];	_this call ExileSecurity_onUnload;"];


_MainCaptureArea = _display displayCtrl 4009;
_MainCaptureArea ctrlRemoveEventHandler ["MouseButtonDown", _MainCaptureArea];
_MainCaptureArea ctrlRemoveEventHandler ["MouseButtonUp", _MainCaptureArea];
_MainCaptureArea ctrlRemoveEventHandler ["MouseZChanged", _MainCaptureArea];
_MainCaptureArea ctrlRemoveEventHandler ["MouseMoving", _MainCaptureArea]; 

_MainCaptureArea ctrlAddEventHandler ["MouseMoving","_this call ExileSecurity_onMouseMoving;"];
_MainCaptureArea ctrlAddEventHandler ["MouseButtonDown","_this call ExileSecurity_onMouseButtonDown;"];
_MainCaptureArea ctrlAddEventHandler ["MouseButtonUp","_this call ExileSecurity_onMouseButtonUp;"];
_MainCaptureArea ctrlAddEventHandler ["MouseZChanged","_this call ExileSecurity_onMouseZChanged;"];


