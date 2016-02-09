# Enigma_Exile_XM8Security
Exile XM8 Security App


This is a very early preview of my XM8 entry

This is not designed for non testing servers at this time.

Lots of the code has been disabled or is doing very little due to me disabling the remote control HMG stuff as I work on it.

If you want to install it then you probably already know how:




in your xm8 app:

//App 1
_app1Text = "XM8Security";
_app1Logo = "xm8Apps\ExileSecurity\Images\ExileSecurity.paa";
app1_action = {

[] spawn {call ExileSecurity};  

};



in your init.sqf:

[] execVm "xm8Apps\ExileSecurity\Init.sqf";	

