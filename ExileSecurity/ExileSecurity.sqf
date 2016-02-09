
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Exile Security//////////////////////////////////////////////////////////


private["_display","_territoryDropDown","_playerUID","_flag","_buildRights","_size","_level","_index","_TerritoryDropDown","_ConnectButtonText","_ConnectButton","_TerritoryLabel"];


disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

  _AppsArray = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, true];
  } forEach _AppsArray;

  uiSleep 0.25;

  _ctrlArray = [4007,4060,4040,4120,4080,4070,4090,4100,4110,4130,4030];

  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 0;
      _ctrl ctrlCommit 0;
      ctrlEnable [_x, true];
  } forEach _ctrlArray;

  {
      ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _AppsArray;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Fade Titlebar///////////////////////////////////////////////////////////


      _titlebar = (_display displayCtrl 4004);
      _titlebar ctrlSetFade 1;
      _titlebar ctrlCommit 0.25;

uisleep 0.25;

      _titlebar ctrlSetFade 0;
      _titlebar ctrlCommit 0.25;
	  _titlebar ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>XM8 Security v0.1</t>"]));



ctrlShow [4092, false];
_esc = (findDisplay 24015) displayAddEventHandler ["KeyDown", "if(_this select 1 == 1)then{ExileClientXM8CurrentSlide = 'apps';};"];





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Actions////////////////////////////////////////////////////////////////

_backButtonText = "Home";

GoBack_action = {



  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
  _AppsArray = [5001,5002,5003,5004,5005,5006];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, true];
  } forEach _AppsArray;

{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _AppsArray;

execVM'xm8Apps\XM8Apps_Init.sqf';



};



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////MenuText////////////////////////////////////////////////////////////////


_Fadein = [];
_Fadein = [0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0];

_Labeltext = "Choose your home security system:";
_TerritoryLabel = _display ctrlCreate ["RscText",5001];
_TerritoryLabel ctrlSetPosition  [12.5 * (0.025) + (0), 4.8 * (0.04) + (0),19 * (0.025),1 * (0.04)]; //center top positions
_TerritoryLabel ctrlCommit 0;
_TerritoryLabel ctrlSetFade 1;
_TerritoryLabel ctrlCommit 0;
{
_TerritoryLabel ctrlSetFade _x;
_TerritoryLabel ctrlCommit 1;
}foreach _Fadein;
_TerritoryLabel ctrlSetText _Labeltext;




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////BackButton//////////////////////////////////////////////////////////////


_BackText = "Logout";

_prevButton = _display ctrlCreate ["RscExileXM8AppButton1x1", 5005];
_prevButton ctrlSetPosition [(34 - 3) * (0.025), (20.5 - 2) * (0.04),4.9 * (0.025),1.8 * (0.04)];
_prevButton ctrlCommit 0;
_prevButton ctrlSetFade 1;
_prevButton ctrlCommit 0;
{
_prevButton ctrlSetFade _x;
_prevButton ctrlCommit 1;
}foreach _Fadein;
_prevButton ctrlAddEventHandler ["MouseButtonUp", {call GoBack_action;}];


_prevButtonText = _display ctrlCreate ["RscText",5006];
_prevButtonText ctrlSetPosition [(35 - 3) * (0.025), (21 - 2) * (0.04)];
_prevButtonText ctrlCommit 0;
_prevButtonText ctrlSetText _BackText;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////DropDown////////////////////////////////////////////////////////////////

_TerritoryDropDown = _display ctrlCreate ["RscCombo", 5002];
_TerritoryDropDown ctrlSetPosition [10.5 * (0.025) + (0), 6.5 * (0.04) + (0),19 * (0.025),1 * (0.04)]; //center top positions


_TerritoryDropDown ctrlCommit 0;
_TerritoryDropDown ctrlSetFade 1;
_TerritoryDropDown ctrlCommit 0;
{
_TerritoryDropDown ctrlSetFade _x;
_TerritoryDropDown ctrlCommit 1;
}foreach _Fadein;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Connect////////////////////////////////////////////////////////////////


_ConnectText = "Connect";
_ConnectLogo = "xm8Apps\images\home.paa";



_ConnectButton = _display ctrlCreate ["RscExileXM8AppButton1x1", 5003];
_ConnectButton ctrlSetPosition [17.8 * (0.025) + (0), 11 * (0.04) + (0), 2.75 * (0.04), 2.75 * (0.04)];
_ConnectButton ctrlCommit 0;
_ConnectButton ctrlSetFade 1;
_ConnectButton ctrlCommit 0;
{
_ConnectButton ctrlSetFade _x;
_ConnectButton ctrlCommit 1;
}foreach _Fadein;
_ConnectButton ctrlSetEventHandler ["ButtonClick", "_this spawn ExileSecurity_onConnectButtonClick;"];




_ConnectButtonText = _display ctrlCreate ["RscText",5004];
_ConnectButtonText ctrlSetPosition [18.1 * (0.025) + (0), 11 * (0.04) + (0), 2.75 * (0.04), 2.75 * (0.04)];
_ConnectButtonText ctrlCommit 0;
_ConnectButtonText ctrlSetFade 1;
_ConnectButtonText ctrlCommit 0;
{
_ConnectButtonText ctrlSetFade _x;
_ConnectButtonText ctrlCommit 1;
}foreach _Fadein;
_ConnectButtonText ctrlSetText _ConnectText;






//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Post Fade////////////////////////////////////////////////////////////////



lbClear _TerritoryDropDown;
_playerUID = getPlayerUID player;
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if (_playerUID in _buildRights) then
	{
		_name = _flag getVariable ["ExileTerritoryName", ""];
		_size = _flag getVariable ["ExileTerritorySize", 0];
		_level = _flag getVariable ["ExileTerritoryLevel", 0];
		_index = _territoryDropDown lbAdd (format ["%1 (Level: %2, Radius: %3m)",_name, _level, _size]);
		_TerritoryDropDown lbSetData [_index, netId _flag];
	};
}
forEach (allMissionObjects "Exile_Construction_Flag_Static");


true
