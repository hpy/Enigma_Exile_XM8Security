# Enigma_Exile_XM8Security
Exile XM8 Security App


Changelog:

14/03/16 - V1.0 Released 
- Known client RPT bug.... If you know a solution contact me!
- Sometimes the camera will not respond to you moving it. Reopen xm8.




////////////////////////////////////////////////////////////////////

First install xm8Apps by Shix -- http://www.exilemod.com/topic/9040-xm8-apps/

////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////

Then go inside the xm8Apps folder and open -- XM8Apps_Init.sqf

////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////

Next o to one of the apps buttons - This example uses App 1!
Make it look like it does below: 

////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////

(NOTE: If you are NOT using App 1 remember to change the _app1Text 
and _app1Logo and app1_action variable names!)

////////////////////////////////////////////////////////////////////



//App 1
_app1Text = "XM8Security";
_app1Logo = "xm8Apps\ExileSecurity\Images\ExileSecurity.paa";
app1_action = {[] spawn {call ExileSecurity}};




////////////////////////////////////////////////////////////////////

Next go to your mission files init.sqf (if you have one) and add

////////////////////////////////////////////////////////////////////

[] execVm "xm8Apps\ExileSecurity\Init.sqf";	


////////////////////////////////////////////////////////////////////

If you DO NOT have an init.sqf then use the one inside the download
and place it in the root of your mission file!

////////////////////////////////////////////////////////////////////



Vanilla Exile (No Infistar)

////////////////////////////////////////////////////////////////////

Go to your Description.ext and find:

////////////////////////////////////////////////////////////////////


class CfgRemoteExec
{
    class Functions
{
        mode = 1;
        jip = 0;
        class ExileServer_system_network_dispatchIncomingMessage     { allowedTargets=2; };
    };
    class Commands
    {
		mode=0;
		jip=0;
    };
};


////////////////////////////////////////////////////////////////////

Change it to read:

////////////////////////////////////////////////////////////////////

class CfgRemoteExec
{
    class Functions
{
        mode = 1;
        jip = 0;
        class ExileServer_system_network_dispatchIncomingMessage     { allowedTargets=2; };
		class ExileSecurity_AlarmLights { allowedTargets=1; };		
    };
    class Commands
    {
		mode=0;
		jip=0;
    };
};



////////////////////////////////////////////////////////////////////

If you DONOT use Infistar then your installation is complete!

////////////////////////////////////////////////////////////////////






Exile WITH Infistar:

////////////////////////////////////////////////////////////////////

Locate inside your mission file: CfgRemoteExec.hpp
Inside it will show:

////////////////////////////////////////////////////////////////////


class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class fnc_AdminReq { allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage { allowedTargets=2; };
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};



////////////////////////////////////////////////////////////////////

Change it to read:

////////////////////////////////////////////////////////////////////


class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class fnc_AdminReq { allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage { allowedTargets=2; };
		class ExileSecurity_AlarmLights { allowedTargets=1; };			
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};



////////////////////////////////////////////////////////////////////

Now go to your Infistar EXILE_AHAT_CONFIG.hpp!
Find the linfes:

////////////////////////////////////////////////////////////////////

/* Use IDD White-List ? */ UDW = true;
/* allowedIDDs: Insert IDDs here to prevent them from being closed! */
allowedIDDs[] =
{
	/* default idds */
	0,4,5,6,8,12,18,24,49,54,55,70,160,174,999,131,

	/* exile idds */
	63,301,602,20016,20017,20018,20019,20020,20021,20023,20024,24000,24001,24002,24004,
	24005,24006,24007,24008,24010,24011,24012,24014,24015,24025,24026,24027,



	
////////////////////////////////////////////////////////////////////

(followed by a much longer list of idds)

////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////

If you have ------ UDW = true; -------- then u must add my ID's to this list:

////////////////////////////////////////////////////////////////////

	/* XM8 Security App */
	5007,7000,7001,6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,6013,
	6014,6015,6016,6017,6018,6019,6020,6021,6022,6023,6024,6025,6026,6027,6028,6029,




////////////////////////////////////////////////////////////////////

It should now look something like this:

////////////////////////////////////////////////////////////////////

/* Use IDD White-List ? */ UDW = true;
/* allowedIDDs: Insert IDDs here to prevent them from being closed! */
allowedIDDs[] =
{
	/* default idds */
	0,4,5,6,8,12,18,24,49,54,55,70,160,174,999,131,

	/* exile idds */
	63,301,602,20016,20017,20018,20019,20020,20021,20023,20024,24000,24001,24002,24004,
	24005,24006,24007,24008,24010,24011,24012,24014,24015,24025,24026,24027,
	
	/* XM8 Security App */
	5007,7000,7001,6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,6013,
	6014,6015,6016,6017,6018,6019,6020,6021,6022,6023,6024,6025,6026,6027,6028,6029,
	
////////////////////////////////////////////////////////////////////
	
	//Followed by lots more IDs
	
////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////

Your Install is now complete!

////////////////////////////////////////////////////////////////////



