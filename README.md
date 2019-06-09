# Budget Stream Deck 
Documentation, files, and links to set up your own stream deck by converting either a USB numpad, second keyboard, or the numpad on your main keyboard into one. (under construction)

The information here is a resource intended to be used alongside my tutorial video. I will not be going into as much detail here so if you have any questions please watch the video linked below.

VIDEO LINK!


### Table of Contents
- Prerequisites for this to work
- Install Interception
- Install & Configure Intercept
- Install & Configure Autohotkey
- Soundboard /w Joystick & Voice Controls
- Other Helpful Programs/Info
- Credits


### Prerequisites
- Decide first if you want to use a separate keyboard or USB Numpad, or if you want to use the numpad on your main keyboard. 
- If you want to use a second keyboard or USB Numpad, then plug in the device you intend to use and go into Device Manager and make sure under the keyboard tab that there isn't more than 10 HID devices listed. 
- If there are 10 or less, you're good to go. If there are more than 10, then you can't use the second device unless you want to pay ~$2200 for the Interception license (The free version only works with up to 10 HID devices)


### Interception (for second keyboards or USB Numpads, skip if only using your keyboard's numpad)
Download and Install Interception
- Go here https://github.com/oblitum/Interception and click on 'Download Latest Release'
- Click on Interception.Zip at the bottom to download. Unzip the file to any location. 
- Open the unzipped file -> Command Line Installer. You should see a file labeled install-intercept.exe
- Copy the address bar in Windows Explorer
- Bring up the Start Menu and type CMD. Right click on the command prompt item and 'Run as Administrator'
- type <kbd>c</kbd><kbd>d</kbd><kbd>spacebar</kbd> and then CTRL+V to paste the Interception install file location, and hit enter
- Now copy and paste (or type) the following command: `install-interception.exe /install` and hit enter to install Interception
- Make sure to restart your computer once it finishes. 


### Intercept (for second keyboards or USB Numpads, skip if only using your keyboard's numpad)
Download, Install and set up Intercept
- Download the Intercept.zip file included in this GitHub
- Extract the file to wherever you want
- Make sure to set Intercept.exe to run as administrator, and run it
- Hit <kbd>A</kbd> to start adding a new keybind
- The program is now waiting for you to hit whichever key you want to reprogram, so hit a key on your second keyboard/USB Numpad
- The program will show you what key you hit, as well as information about which device you used
- It now wants you to input what keys you want the program to send when the button is hit. Since one of the keys we want aren't on the standard keyboard we've got some trickery to do
- Hold down <kbd>CTRL</kbd> and hit the same button you hit before, then release both buttons and hit <kbd>ESC</kbd> to finish giving insctructions
- Intercept will now ask for a label, so type something that you'll remember for that key, I just use the normal key name but you can do whatever
- It will now show you a breakdown of the label name, what device was used, what key was pressed, and what you want the program to output. If it all looks good, hit <kbd>S</kbd> to save, or <kbd>C</kbd> to cancel
- It's easiest if you repeat the previous steps for ALL the keys on your second keyboard / USB numpad
- After you've made an entry for every key, close out of Intercept and go to the folder it is loaded in, you should see a keyremap.ini file, open it in notepad
- You'll see a bunch of entries like the one below. The first line is the label you made, second line is the device information, third is the triggering key, and fourth is the output combination
```
[Backspace]
device=HID\VID_1A2C&PID_4324&REV_0110&MI_00
trigger=e,0,0
combo=76,0,0|e,0,0|e,0,1|76,0,1
``` 
- The trigger and combo key codes are organized like this: Scancode , Device number , Output type. The Scancode for <kbd>F24</kbd> is 76. I only have one USB numpad, in computer language the first iteration is labeled 0. And a 0 is pressing a key down, 1 is releasing the key. 
- We want to wrap every key press in an <kbd>F24</kbd> button press, currently they are wrapped by <kbd>CTRL</kbd>. The Scancode for <kbd>CTRL</kbd> is 1D and <kbd>F24</kbd> is 76. Using Notepad's find and replace function, simply find every instance of 1D and replace it with 76
- Once that is done then Intercept should be completely set up

Scan Codes - Key Output
64 - F13
65 - F14
66 - F15
67 - F16
68 - F17
69 - F18
6A - F19
6B - F20
6C - F21
6D - F22
6E - F23
76 - F24

### AutoHotKey
Download, Install, and configure AutoHotKey
- Go to https://www.autohotkey.com/
- Download and install the current version
- Autohotkey works by creating scripts in notepad or other text editing software(Don't use Word), and changing them to .ahk files
- Download whichever of my Keybind AHK files included in this Github you would like. Numpad is for using the numpad on your regular keyboard, USB is for a USB Numpad, and Blank just has the starting commands that are useful but allows you to start from scratch creating whatever hotkeys you want. 
- If you want more information about setting up hotkeys within AHK, go watch the Youtube Video I made showing how to set all of this up:

Unicode - Output
{U+0093} - OBS_KEY_MASSYO
{U+0094} - OBS_KEY_TOUROKU

### Soundboard w/ Joystick & Voice Control
Download and Install Voice Attack
- Go to https://voiceattack.com/ 
- Download and install VoiceAttack. This is a soundboard program that by defaul accepts voice, keyboard, and gamepad inputs. 

Download, Install, and configure Vjoy
- Go to https://sourceforge.net/projects/vjoystick/ 
- Download and install vJoy. This program allows you to create a virtual (aka fake) Joystick that your computer thinks is real
- Go to where you installed vJoy (C:/Program Files/vJoy) by default. in the x64 folder are two programs you want to familiarize yourself with
- vJoyConf.exe and vJoyConfig.exe do the same thing, and let you configure the specifics of your fake joystick. For our purposes, We only want 1 device, with 0 Axes & POV Hats(aka directional pad), no effects, and 128 buttons. When that is done click Apply. You'll hear the device disconnect/reconnect sound, which is the computer thinking the default vJoy device was disconnected, and the new one was connected. 
- JoyMonitor.exe opens a screen that shows the current vJoy devices, and indicates when an axis/button/hat is pressed, which is crucial for making sure the autohotkey script you make runs correctly
- Go into VoiceAttack, in the bottom right is a wrench icon, click on that. Under the general tab is a Joystick Options button. Click it and make sure to Assign vJoy to the Joystick 1 option. This makes VoiceAttack look for inputs on the fake device. 

Configure AutoHotKey to output vJoy commands
- Autohotkey by default is unable to do any joystick output. But with the right addon's to AHK we can.
- Go to https://github.com/evilC/AHK-CvJoyInterface and download the github
- What we want is the file called CvJoyInterface.ahk. This needs to be moved to the library folder within the AutoHotKey installation so that it is easy to link to. Copy the file, then navigate to AutoHotKey's install location (default location is `C:/Program Files/AutoHotKey`). Open the Lib folder and paste the file there. Now with a simple command we can add this library to any AHK script. 
- In your AHK script, add `#include <CvJoyInterface>` near the beginning to link the library
- Create a vJoy class with `vJoyInterface := new CvJoyInterface()` and now add the vJoy device on the next line with `vJoystick := vJoyInterface.Devices[1]`
- Use the following code to ouput a button down then button up event
```
vJoystick.SetBtn(1,128) ;the 1 means press, 128 is the number of the button to be pressed
Sleep, 50
vJoystick.SetBtn(0,128) ;the 0 means release the button, and again the 128 is the number of the button to be released
```
- Congrats! You have installed a sound board program, virtual joystick, and modified AutoHotKey to output button presses of the virtual joystick and can now use it as hotkeys within the soundboard program


### Other Helpful Programs/Info

Soundswitch
- https://soundswitch.aaflalo.me/
- Allows you to set up what speaker/microphone devices you use, and assign a hotkey to swap between them. I use it so that I never have to swap my headphones and speakers as the default output device

Borderless Gaming
- https://github.com/Codeusa/Borderless-Gaming/releases
- Lets you run any program in windowed borderless. This includes those that don't by default have that functionality. Underneath the download graphic is an Assets section, click on the .exe to download. 

Scan Codes
 - http://www.quadibloc.com/comp/scan.htm
 - I couldn't find a definitive list of scan codes that includes everything from ABC to F24 that worked and was recognized 100% by Intercept/AHK/OBS, but this breakdown had a bunch of different lists, specifically the one near the end of the page, that were instrumental in figuring out what scancodes to use in Intercept and that would be recognized.



### Credits

###### TaranVH - https://www.youtube.com/watch?v=y3e_ri-vOIo
This is where I learned about Intercept/Interception from, he has great tutorials about how to set things up, as well as further methods for making multiple keyboards work cheaply and easily. My focus was on streaming where his was more on just hotkeys for specific programs, so there was a lot of tinkering and figuring out the best way to make things work how I wanted, but the bulk of the initial setup is due entirely to him.

###### Kamaz - https://www.orbiter-forum.com/showthread.php?t=30829
The man, the myth, the one who makes this entire thing possible. This is the person that developped Intercept and released it for free. The only reason I include a download for Intercept myself instead of just linking to the post above is because it requires you to log into a forum site for a game most people might now have or be interested in. Full props to this amazing guy.

###### AutoHotKey Forum People
There are too many to name or link to, but 99% of the issues I ran into while writing and figuring out the AHK code were solved by other peoples questions and answers on forum posts. I can't say enough thank you's to the people that donate their time on those forums to help others. 
