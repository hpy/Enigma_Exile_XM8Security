/*
  	Name: ExileSecurity_AlarmTimer.sqf
 	Author: Happydayz - Enigma
    Copyright (c) 2016 Happydayz
    This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

for "_i" from 1 to 20 step 1 do {
if !(alarmlightson) exitWith {};
      uisleep 3.55;
};
  alarmlightson = false;
Alarmspamprotection = false;
