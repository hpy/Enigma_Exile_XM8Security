/*
  	Name: ExileSecurity_CloseSettings.sqf
 	Author: Happydayz - Enigma
    Copyright (c) 2016 Happydayz
    This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
_territorychange = _this select 0;

Slidesettings = false;

Private ["_Settings","_display","_controllist"];

disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];


_controllist = 		[
6000,
6007,
6008,
6009,
6010,
6011,
6012,
6013,
6014,
6015,
6016,
6017,
6018,
6019,
6020
		];

		{
			_Settings = _display displayCtrl _x;
			_Settings ctrlEnable false;
			_Settings ctrlSetFade 1;
			_Settings ctrlCommit 0.25;

		}
		forEach _controllist;

		waitUntil {ctrlCommitted _Settings};

{

	ctrlDelete ((findDisplay 24015) displayCtrl _x);

}forEach _controllist;


if !(isNil "_territorychange") then {

if (_territorychange == 1) then {
[1] spawn ExileSecurity_Territory;
	};
};
