
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

;---------- Function Prep: sets up things we need for the function to work

OBSClass := ;Declares a global variable, so it won't get erased when the If function ends
F22:: MouseGetPos, , , , OBSClass, ;This stores the ClassNN of whatever window the mouse is positioned over into the variable OBSClass
F21:: Msgbox, control %OBSClass% ;This brings up a message box displaying the contents of the control variable, it should be Qt5QWindowIcon##

;---------- HOTKEY FUNCTION: This area has all the specific hotkeys you want to work. 

Numpad1 & Numpad4::ControlSend, %OBSClass%, {F13}, ahk_exe obs64.exe
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
Numpad3 & Numpad5::ControlSend, %OBSClass%, {Numpad5}, ahk_exe obs64.exe
Numpad3 & Numpad6::ControlSend, %OBSClass%, {Numpad6}, ahk_exe obs64.exe
Numpad3 & Numpad7::ControlSend, %OBSClass%, {Numpad7}, ahk_exe obs64.exe
Numpad3 & Numpad8::ControlSend, %OBSClass%, {Numpad8}, ahk_exe obs64.exe
Numpad3 & Numpad9::ControlSend, %OBSClass%, {Numpad9}, ahk_exe obs64.exe

Numpad4::
Numpad5::
Numpad6::
Numpad7::
Numpad8::
Numpad9::

