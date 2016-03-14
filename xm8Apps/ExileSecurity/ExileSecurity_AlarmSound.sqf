/*
  	Name: ExileSecurity_AlarmSound.sqf
 	Author: Happydayz - Enigma
    Copyright (c) 2016 Happydayz
    This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

_alarmsource = _this select 0;


if !(alarmlightson) exitWith {};
if (isNil "ExileClientCameraParentObject") exitWith {};


for "_i" from 1 to 20 step 1 do {
if !(alarmlightson) exitWith {};
  _soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
  _soundToPlay = _soundPath + "xm8apps\ExileSecurity\sounds\Siren.ogg";
  playSound3D [_soundToPlay, player, false, _alarmsource, 50, 1, 200];
      uisleep 3.55;
};
  alarmlightson = false;
Alarmspamprotection = false;
