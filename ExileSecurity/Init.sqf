
SecurityDebug = false; 

ExileClientWeaponParentObject = objNull;


private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[




	['ExileSecurity', 'xm8Apps\ExileSecurity\ExileSecurity.sqf'],
  ['ExileSecurity_baseCameras_onCameraDropDownChanged', 'xm8Apps\ExileSecurity\ExileSecurity_baseCameras_onCameraDropDownChanged.sqf'],

	['ExileSecurity_handleTerritorySelection', 'xm8Apps\ExileSecurity\ExileSecurity_handleTerritorySelection.sqf'],
	['ExileSecurity_baseWeapons_onCameraDropDownChanged', 'xm8Apps\ExileSecurity\ExileSecurity_baseWeapons_onCameraDropDownChanged.sqf'],

	['ExileSecurity_baseCamera_event_onLoad', 'xm8Apps\ExileSecurity\ExileSecurity_baseCamera_event_onLoad.sqf'],
	['ExileSecurity_baseWeapons_event_onLoad', 'xm8Apps\ExileSecurity\ExileSecurity_baseWeapons_event_onLoad.sqf'],
	['ExileSecurity_onConnectButtonClick', 'xm8Apps\ExileSecurity\ExileSecurity_onConnectButtonClick.sqf'],
	['ExileSecurity_onConnectLoad', 'xm8Apps\ExileSecurity\ExileSecurity_onConnectLoad.sqf'],
	['ExileSecurity_onMouseMoving', 'xm8Apps\ExileSecurity\ExileSecurity_onMouseMoving.sqf'],
	['ExileSecurity_onMouseButtonDown', 'xm8Apps\ExileSecurity\ExileSecurity_onMouseButtonDown.sqf'],
	['ExileSecurity_onMouseZChanged', 'xm8Apps\ExileSecurity\ExileSecurity_onMouseZChanged.sqf'],
	['ExileSecurity_onMouseButtonUp', 'xm8Apps\ExileSecurity\ExileSecurity_onMouseButtonUp.sqf'],
	['ExileSecurity_onUnload', 'xm8Apps\ExileSecurity\ExileSecurity_onUnload.sqf'],


	['ExileSecurity_baseCamera_camAction', 'xm8Apps\ExileSecurity\ExileSecurity_baseCamera_camAction.sqf'],

	['ExileSecurity_onLoadInfo', 'xm8Apps\ExileSecurity\ExileSecurity_onLoadInfo.sqf'],
	['ExileSecurity_baseWeapons_camAction', 'xm8Apps\ExileSecurity\ExileSecurity_baseWeapons_camAction.sqf'],
	['ExileSecurity_mouseControl_buildlimits', 'xm8Apps\ExileSecurity\ExileSecurity_mouseControl_buildlimits.sqf']


	];
