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
;#include <CvJoyInterface> ;Allows AutoHotKey to sent commands to vJoy created devices

;---------- Function Prep: sets up things we need for the function to work

;vJoyInterface := new CvJoyInterface() ;Creates a class to handle input/outputs to vJoy devices
;vJoystick := vJoyInterface.Devices[1] ;Creates global variable to identify which vJoy device to output to (can have up to 16, only 1 used atm)
OBSClass := ;Declares a global variable for OBS's ClassNN, so it won't get erased when the If function ends
^+!F12:: MouseGetPos, , , , OBSClass, ;This stores the ClassNN of whatever window the mouse is positioned over into the variable OBSClass
^+!F11:: Msgbox, control %OBSClass% ;This brings up a message box displaying the contents of the control variable, it should be Qt5QWindowIcon##