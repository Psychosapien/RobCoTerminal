# Psychosapien's Rubbish RobCo Terminal Theme

This Windows Terminal theme is designed to provide an authentic RobCo experience, minus the radiation.

## How to use this theme

To set up the profile,simply do the following:

- Copy PipBoy.png and RobCo.png into the root of your OneDrive Folder (or wherever you want).
  - If you do copy the images somewhere else, make sure to amend lines 5 and 21 in the Settings.json before copyikng to your Terminal settings file.
- Copy profile-RobCo.ps1 into your Windows Powershell folder.
  - The default is mapped to One Drive but if you don't want to do that, edit Line 10, col 48 of the settings.json to reflect your desired path for the script.
- Open Settings.json and copy the profile section into your Windows Terminal settings.json file, then copy the Theme section into the themes section of your Terminal settings.json file.
  - You can access your Teminal Settings.json file by open settings in terminal, and then clicking "Open JSON file" at the bottom of the screen.
- Profit.

## Great, what's the point?

I made this because I was avoiding work.

I use this primarily as a fun way to open an ssh session to a server, but you can do whatever the heck you want with it. Just add some code into profile-RobCo.ps1 after line 212.

## How do I work out the password!?

The password is chosen at random from all words longer than 8 characters in the big old horrible password output. I am rubbish and it does scoop up some unicode chars so your best bet is double clicking a word to select it and then pasting it into the password field.
