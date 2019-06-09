
;---------- Basic Necessities: each of these are necessary modifiers to the program that improve 
;                              functionality, responsiveness, and prevent certain bugs

SetWorkingDir %A_ScriptDir% ; Forces the script to use the files location as working directory regardless of how launched, improves consistency
#NoEnv  ;Makes the script skip empty variables
SetKeyDelay, 30, 30 ;Adds a delay between keypresses before they are released, allows more time for key presses to be recognized
SendMode Input ;Sets the default method any commands will be sent. Overwritten by ControlSend commands but good to have to prevent issues when tinkering in the future
#InstallKeybdHook ;Makes the script monitor keystrokes for hotkeys not supported by default windows registry, improves responsiveness
#UseHook On ;Forces script to use keyboard hook for all hotkeys
#SingleInstance force ;Makes sure you don't accidentally have multiple versions of this script running at one time
#MaxHotkeysPerInterval 20 ;Prevents infinite loops from locking up the computer
#HotkeyModifierTimeout 60 ;Amount of time to wait before assuming a modifier key was released
#KeyHistory 200 ;how many events the key history will record, useful for debugging
#MenuMaskKey vk07 ;Menu masking may unintentionally send additional keystrokes when using Alt as a modifier, this prevents that
#WinActivateForce ;prevent taskbar flashing.
#maxthreadsperhotkey 2 ;This allows you to create loops that can be killed by the same hotkey, see the Deja Vu example on my video
#include <CvJoyInterface> ;Allows AutoHotKey to sent commands to vJoy created devices

;---------- Function Prep: sets up things we need for the function to work

vJoyInterface := new CvJoyInterface() ;Creates a class to handle input/outputs to vJoy devices
vJoystick := vJoyInterface.Devices[1] ;Creates global variable to identify which vJoy device to output to (can have up to 16, only 1 used atm)
Folder := "OBS" ;Declares global variable to act as a folder identifier, assigns it the OBS scene folder. I will be using OBS, SoundB, Extra1, and Extra2 as my folders
OBSClass := ;Declares a global variable for OBS's ClassNN, so it won't get erased when the If function ends
^+!F12:: MouseGetPos, , , , OBSClass, ;Ctrl+Shift+Alt+F12 - This stores the ClassNN of whatever window the mouse is positioned over into the variable OBSClass
^+!F11:: Msgbox, control %OBSClass% ;Ctrl+Shift+Alt+F11 brings up a message box displaying the contents of the control variable, it should be Qt5QWindowIcon##

;---------- HOTKEY FUNCTION: This area has all the specific hotkeys you want to work. 

#if (getKeyState("F24", "P")) ;This identifies when the wrapping button is pressed, and triggers hotkeys
;                              defined below, the keys defined here activate regardless of folder selected. 
F24::return ;without this the function won't work correctly

Global OBSClass ;brings the global variable inside the function, allowing it to read/write to it
Global Folder ;same as above.

NumpadEnter::ControlSend, %OBSClass%, ^!{NumpadEnter}, ahk_exe obs64.exe      ;Start/End Stream
BS::ControlSend, %OBSClass%, ^!{BS}, ahk_exe obs64.exe                        ;Start/End Recording

;These commands change the value of the Folder variable
NumpadMult::Folder := "OBS" 
/::Folder := "SoundB"
NumpadSub::Folder := "Extra1"
NumpadAdd::Folder := "Extra2"

Numlock::ControlSend, %OBSClass%, {U+0093}, ahk_exe obs64.exe

#if ;this ends the if function

;---------------------------- OBS FOLDER ---------------------------------------------

#if (getKeyState("F24", "P")) and if (Folder = "OBS") ;The hotkeys below trigger only when the OBS Folder is active
F24::return ;without this the function won't work correctly

Global OBSClass ;brings the global variable inside the function, allowing it to read/write to it

Numpad1::ControlSend, %OBSClass%, {F13}, ahk_exe obs64.exe
Numpad2::ControlSend, %OBSClass%, {F14}, ahk_exe obs64.exe
Numpad3::ControlSend, %OBSClass%, {F15}, ahk_exe obs64.exe
Numpad4::
ControlSend, %OBSClass%, {F16}, ahk_exe obs64.exe 
SVUBool := !SVUBool ;Create boolean variable, set it to true
   while, SVUBool ;While variable = true
    {
      Sleep 2500 ; Wait for 2.5 seconds
	  if SVUBool ;Check to see if SVU was turned off, if it was, do nothing. 
		{
		ControlSend, %OBSClass%, {F16}, ahk_exe obs64.exe ;Turn off the SVU Filter
		SVUBool := !SVUBool ;Set the variable to false to break the loop
		}
	}
return ; end of subroutine
;Numpad5::ControlSend, %OBSClass%, {F17}, ahk_exe obs64.exe
Numpad5::Msgbox, You pressed the 5 on the USB numpad, which was wrapped by F23, while the OBS Folder was selected
Numpad6::ControlSend, %OBSClass%, {F18}, ahk_exe obs64.exe
Numpad7::
ControlSend, %OBSClass%, {F19}, ahk_exe obs64.exe ;send the command to OBS to turn on Deja Vu filter
DejaVuBool := !DejaVuBool ;Create boolean variable, set it to true
   while, DejaVuBool ;While variable = true
    {
      Sleep 6500 ; Wait for 6 and a half seconds
	  if DejaVuBool ;Check to see if Dejavu was turned off, if it was, do nothing. 
		{
		ControlSend, %OBSClass%, {F19}, ahk_exe obs64.exe ;Turn off the Deja Vu filter 
		DejaVuBool := !DejaVuBool ;Set the variable to false to break the loop
		}
	}
return ; end of subroutine
Numpad8::
ControlSend, %OBSClass%, {F20}, ahk_exe obs64.exe
Sleep 5700 ; Wait for 5 seconds
ControlSend, %OBSClass%, {F21}, ahk_exe obs64.exe ;Change back to the gaming screen
return ; end of subroutine
Numpad9::ControlSend, %OBSClass%, {F21}, ahk_exe obs64.exe
Numpad0::ControlSend, %OBSClass%, {F22}, ahk_exe obs64.exe
NumpadDot::ControlSend, %OBSClass%, {F23}, ahk_exe obs64.exe

#if ;this ends the if function


;---------------------------- SOUNDB FOLDER ---------------------------------------------

#if (getKeyState("F24", "P")) and if (Folder = "SoundB") ;The hotkeys below trigger only when the SoundB Folder is active
F24::return ;without this the function won't work correctly

Global vJoystick ;brings the global variable inside the function, allowing it to read/write to it

Numpad1::
	vJoystick.SetBtn(1,128)
	Sleep, 50
	vJoystick.SetBtn(0,128)
	Return
Numpad2::
	vJoystick.SetBtn(1,127)
	Sleep, 50
	vJoystick.SetBtn(0,127)
	Return
Numpad3::
	vJoystick.SetBtn(1,126)
	Sleep, 50
	vJoystick.SetBtn(0,126)
	Return
Numpad4::
	vJoystick.SetBtn(1,125)
	Sleep, 50
	vJoystick.SetBtn(0,125)
	Return
Numpad5::
	vJoystick.SetBtn(1,124)
	Sleep, 50
	vJoystick.SetBtn(0,124)
	Return
;Numpad5::Msgbox, You pressed the 5 on the USB numpad, which was wrapped by F23, while the SoundB Folder was selected
Numpad6::
	vJoystick.SetBtn(1,123)
	Sleep, 50
	vJoystick.SetBtn(0,123)
	Return
Numpad7::
	vJoystick.SetBtn(1,122)
	Sleep, 50
	vJoystick.SetBtn(0,122)
	Return
Numpad8::
	vJoystick.SetBtn(1,121)
	Sleep, 50
	vJoystick.SetBtn(0,121)
	Return
Numpad9::
	vJoystick.SetBtn(1,120)
	Sleep, 50
	vJoystick.SetBtn(0,120)
	Return
Numpad0::
	vJoystick.SetBtn(1,119)
	Sleep, 50
	vJoystick.SetBtn(0,119)
	Return
NumpadDot::
	vJoystick.SetBtn(1,118)
	Sleep, 50
	vJoystick.SetBtn(0,118)
	Return

#if ;this ends the if function

;---------------------------- EXTRA1 FOLDER ---------------------------------------------

#if (getKeyState("F24", "P")) and if (Folder = "Extra1") ;The hotkeys below trigger only when the Extra1 Folder is active
F24::return ;without this the function won't work correctly

Global OBSClass ;brings the global variable inside the function, allowing it to read/write to it

Numpad1::
Numpad2::
Numpad3::
Numpad4::
;Numpad5::
Numpad5::Msgbox, You pressed the 5 on the USB numpad, which was wrapped by F23, while the Extra1 Folder was selected
Numpad6::
Numpad7::
Numpad8::
Numpad9::
Numpad0::
NumpadDot::

#if ;this ends the if function

;---------------------------- EXTRA2 FOLDER ---------------------------------------------

#if (getKeyState("F24", "P")) and if (Folder = "Extra2") ;The hotkeys below trigger only when the Extra2 Folder is active
F24::return ;without this the function won't work correctly

Global OBSClass ;brings the global variable inside the function, allowing it to read/write to it

Numpad1::
Numpad2::
Numpad3::
Numpad4::
;Numpad5::
Numpad5::Msgbox, You pressed the 5 on the USB numpad, which was wrapped by F23, while the Extra2 Folder was selected
Numpad6::
Numpad7::
Numpad8::
Numpad9::
Numpad0::
NumpadDot::

#if ;this ends the if function