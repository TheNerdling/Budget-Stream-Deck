# Budget Stream Deck 
Documentation, files, and links to set up your own stream deck by converting either a USB numpad, second keyboard, or the numpad on your main keyboard into one. (under construction)

The information here is a resource intended to be used alongside this my tutorial video. I will not be going into as much detail here so if you have any questions please watch the video linked below.

VIDEO LINK!


### Table of Contents
- Prerequisites for this to work
- Install Interception
- [Install & Configure Intercept](intercept)
- Install & Configure Autohotkey
- Soundboard /w Joystick & Voice Controls
- [Other Helpful Programs](table-of-contents)

### Prerequisites
- Decide first if you want to use a separate keyboard or USB Numpad, or if you want to use the numpad on your main keyboard. 
- If you want to use a second keyboard or USB Numpad, then plug in your preferred device and go into Device Manager and make sure under the keyboard tab that there isn't more than 10 HID devices listed. 
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
- Make sure to set Intercept.exe to run as administrator
- Hit <kbd>A</kbd> to start adding a new keybind
- The program is now waiting for you to hit whichever key you want to reprogram, so hit a key on your second keyboard/USB Numpad
- The program will show you what key you hit, as well as information about which device you used
- It now wants you to input what keys you want the program to send when the button is hit. Since one of the keys we want aren't on the standard keyboard we've got some trickery to do
- Hold down <kbd>CTRL</kbd> and hit the same button again, then release <kbd>CTRL</kbd> and hit <kbd>ESC</kbd> to finish giving inputs
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

### AutoHotKey
Download, Install, and configure AutoHotKey
- Go to https://www.autohotkey.com/ and download the current version
- You'll get a setup.exe, run it to install autohotkey on your computer
- 








