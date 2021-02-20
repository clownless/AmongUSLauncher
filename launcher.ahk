; AmongUS Launcher
; Copyright (C) 2021 clownless
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program. If not, see <http://www.gnu.org/licenses/>.
;
;
;@Ahk2Exe-SetName               AmongUS Launcher
;@Ahk2Exe-SetCopyright          Copyright (C) 2021 clownless
;@Ahk2Exe-SetCompanyName        clownless
;@Ahk2Exe-SetProductVersion     1.0.0.0
;@Ahk2Exe-SetVersion            1.0.0.0
;@Ahk2Exe-UpdateManifest        1

global script := "AmongUS Launcher"
global version := "v1.0.0"

#Include Lib\Logging.ahk
#Include Lib\native_zip.ahk
#SingleInstance, force


Logging(1,"started " script " " version)
Gui, Add, Edit, x33 y19 w300 h20 vpath Disabled, C:\Among Us
Gui, Add, Text, x133 y49 w100 h20 +Center, 258 MB
Gui, Add, Button, x31 y79 w100 h30 ginstall, Install
Gui, Add, Button, x233 y79 w100 h30 gselectFolder, Select folder
Gui, Show, w370 h140, %script% %version%
return


install:
{
    Msgbox, The installation process has started, please wait.
    Logging(1,"start installing")
    Gui, Submit, NoHide
    zip := path . "\amongus.zip"
    Logging(1,"downloading among us to " path "\amongus.zip")
    UrlDownloadToFile, https://files.cocksuckers.fun/other/amongus.zip, %path%\amongus.zip
    Logging(1, "errorlevel after downloading " ErrorLevel)
    if (ErrorLevel = 1)
    {
        Msgbox, 16, %script%, The specified disk does not exist, or you do not have an internet connection.
    }
    Unz(zip,path)
    Logging(1, "unzipped")
    FileDelete, %zip%
    FileCreateShortcut, %path%\Among Us.exe, %A_Desktop%\Among Us.lnk
    Logging(1,"created shortcut")
    Msgbox, 64, %script%, Among Us successfully installed    
}
return


selectFolder:
FileSelectFolder, folder
GuiControl,, path, %folder%
return


GuiClose:
ExitApp
