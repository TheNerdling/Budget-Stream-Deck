
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
;#maxthreadsperhotkey 2 ;This allows you to create loops that can be killed by the same hotkey, see the Deja Vu example on my video
#include <CvJoyInterface> ;Allows AutoHotKey to sent commands to vJoy created devices

;---------- Function Prep: sets up things we need for the function to work

vJoyInterface := new CvJoyInterface() ;Creates a class to handle input/outputs to vJoy devices
vJoystick := vJoyInterface.Devices[1] ;Creates global variable to identify which vJoy device to output to (can have up to 16, only 1 used atm)
Folder := "OBS" ;Declares global variable to act as a folder identifier, assigns it the OBS scene folder. I will be using OBS, SoundB, and Extra as my folders
OBSClass := ;Declares a global variable for OBS's ClassNN, so it won't get erased when the If function ends
^+!F12:: MouseGetPos, , , , OBSClass, ;This stores the ClassNN of whatever window the mouse is positioned over into the variable OBSClass
^+!F11:: Msgbox, control %OBSClass% ;This brings up a message box displaying the contents of the control variable, it should be Qt5QWindowIcon##

;---------- HOTKEY FUNCTION: This area has all the specific hotkeys you want to work. 

Global OBSClass ;brings the global variable inside the function, allowing it to read/write to it

NumpadEnter::ControlSend, %OBSClass%, ^!{NumpadEnter}, ahk_exe obs64.exe      ;Start/End Stream
NumpadSub::ControlSend, %OBSClass%, ^!{NumpadSub}, ahk_exe obs64.exe          ;Start/End Recording

;These commands change the value of the Folder variable
NumpadMult::Folder := "OBS" 
NumpadDiv::Folder := "SoundB"
NumpadAdd::Folder := "Extra"

Numlock::ControlSend, %OBSClass%, {U+0093}, ahk_exe obs64.exe

Numpad4::return
Numpad5::return
Numpad6::return
Numpad7::return
Numpad8::return
Numpad9::return

;---------------------------- OBS FOLDER ---------------------------------------------

#if (Folder = "OBS") ;The hotkeys below trigger only when the OBS Folder is active

;Numpad1 & Numpad4::ControlSend, %OBSClass%, {F13}, ahk_exe obs64.exe
Numpad1 & Numpad4::Msgbox, You pressed the 1 & 4 on the numpad while the OBS Folder was selected
Numpad1 & Numpad5::ControlSend, %OBSClass%, {F14}, ahk_exe obs64.exe
Numpad1 & Numpad6::ControlSend, %OBSClass%, {F15}, ahk_exe obs64.exe
Numpad1 & Numpad7::ControlSend, %OBSClass%, {F16}, ahk_exe obs64.exe
Numpad1 & Numpad8::ControlSend, %OBSClass%, {F17}, ahk_exe obs64.exe
Numpad1 & Numpad9::ControlSend, %OBSClass%, {F18}, ahk_exe obs64.exe
Numpad2 & Numpad4::ControlSend, %OBSClass%, {F19}, ahk_exe obs64.exe
Numpad2 & Numpad5::ControlSend, %OBSClass%, {F20}, ahk_exe obs64.exe
Numpad2 & Numpad6::ControlSend, %OBSClass%, {F21}, ahk_exe obs64.exe
Numpad2 & Numpad7::ControlSend, %OBSClass%, {F22}, ahk_exe obs64.exe
Numpad2 & Numpad8::ControlSend, %OBSClass%, {F23}, ahk_exe obs64.exe
Numpad2 & Numpad9::ControlSend, %OBSClass%, {F24}, ahk_exe obs64.exe
Numpad3 & Numpad4::ControlSend, %OBSClass%, {Numpad4}, ahk_exe obs64.exe
Numpad3 & Numpad5::ControlSend, %OBSClass%, {Numpad5}, ahk_exe obs64.exe/
Numpad3 & Numpad6::ControlSend, %OBSClass%, {Numpad6}, ahk_exe obs64.exe
Numpad3 & Numpad7::ControlSend, %OBSClass%, {Numpad7}, ahk_exe obs64.exe
Numpad3 & Numpad8::ControlSend, %OBSClass%, {Numpad8}, ahk_exe obs64.exe
Numpad3 & Numpad9::ControlSend, %OBSClass%, {Numpad9}, ahk_exe obs64.exe

#if ;this ends the if function

;---------------------------- SoundB FOLDER ---------------------------------------------

#if (Folder = "SoundB") ;The hotkeys below trigger only when the SoundB Folder is active

Numpad1 & Numpad4::Msgbox, You pressed the 1 & 4 on the numpad while the SoundB Folder was selected
;Numpad1 & Numpad4::
;    vJoystick.SetBtn(1,128)
;	Sleep, 50
;	vJoystick.SetBtn(0,128)
;	Return
Numpad1 & Numpad5::
    vJoystick.SetBtn(1,127)
	Sleep, 50
	vJoystick.SetBtn(0,127)
	Return
Numpad1 & Numpad6::
    vJoystick.SetBtn(1,126)
	Sleep, 50
	vJoystick.SetBtn(0,126)
	Return
Numpad1 & Numpad7::
    vJoystick.SetBtn(1,125)
	Sleep, 50
	vJoystick.SetBtn(0,125)
	Return
Numpad1 & Numpad8::
    vJoystick.SetBtn(1,124)
	Sleep, 50
	vJoystick.SetBtn(0,124)
	Return
Numpad1 & Numpad9::
    vJoystick.SetBtn(1,123)
	Sleep, 50
	vJoystick.SetBtn(0,123)
	Return
Numpad2 & Numpad4::
    vJoystick.SetBtn(1,122)
	Sleep, 50
	vJoystick.SetBtn(0,122)
	Return
Numpad2 & Numpad5::
    vJoystick.SetBtn(1,121)
	Sleep, 50
	vJoystick.SetBtn(0,121)
	Return
Numpad2 & Numpad6::
    vJoystick.SetBtn(1,120)
	Sleep, 50
	vJoystick.SetBtn(0,120)
	Return
Numpad2 & Numpad7::
    vJoystick.SetBtn(1,119)
	Sleep, 50
	vJoystick.SetBtn(0,119)
	Return
Numpad2 & Numpad8::
    vJoystick.SetBtn(1,118)
	Sleep, 50
	vJoystick.SetBtn(0,118)
	Return
Numpad2 & Numpad9::
    vJoystick.SetBtn(1,117)
	Sleep, 50
	vJoystick.SetBtn(0,117)
	Return
Numpad3 & Numpad4::
    vJoystick.SetBtn(1,116)
	Sleep, 50
	vJoystick.SetBtn(0,116)
	Return
Numpad3 & Numpad5::
    vJoystick.SetBtn(1,115)
	Sleep, 50
	vJoystick.SetBtn(0,115)
	Return
Numpad3 & Numpad6::
    vJoystick.SetBtn(1,114)
	Sleep, 50
	vJoystick.SetBtn(0,114)
	Return
Numpad3 & Numpad7::
    vJoystick.SetBtn(1,113)
	Sleep, 50
	vJoystick.SetBtn(0,113)
	Return
Numpad3 & Numpad8::
    vJoystick.SetBtn(1,112)
	Sleep, 50
	vJoystick.SetBtn(0,112)
	Return
Numpad3 & Numpad9::
    vJoystick.SetBtn(1,111)
	Sleep, 50
	vJoystick.SetBtn(0,111)
	Return

#if ;this ends the if function

;---------------------------- OBS2 FOLDER ---------------------------------------------

#if (Folder = "Extra") ;The hotkeys below trigger only when the Extra Folder is active

Numpad1 & Numpad4::Msgbox, You pressed the 1 & 4 on the Numpad while the Extra Folder was selected
;Numpad1 & Numpad4::
Numpad1 & Numpad5::
Numpad1 & Numpad6::
Numpad1 & Numpad7::
Numpad1 & Numpad8::
Numpad1 & Numpad9::
Numpad2 & Numpad4::
Numpad2 & Numpad5::
Numpad2 & Numpad6::
Numpad2 & Numpad7::
Numpad2 & Numpad8::
Numpad2 & Numpad9::
Numpad3 & Numpad4::
Numpad3 & Numpad5::
Numpad3 & Numpad6::
Numpad3 & Numpad7::
Numpad3 & Numpad8::
Numpad3 & Numpad9::

#if ;this ends the if function