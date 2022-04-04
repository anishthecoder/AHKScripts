; Phrases that are intended to be auto-completed within coding environments.

; Globals
lineDelay := 150

; Add code editing environments below.
GroupAdd, CodeEditors, Eclipse
GroupAdd, CodeEditors, Notepad
GroupAdd, CodeEditors, Code
GroupAdd, CodeEditors, ahk_exe phpstorm64.exe
GroupAdd, CodeEditors, Obsidian


; Match window titles where any part of the search phrase is available in the 
; window title.
SetTitleMatchMode, 2

; Phrases ----------------------------------------------------------------------
#IfWinActive ahk_group CodeEditors

<^<+PrintScreen::
  InputBox, command, Enter command, Enter command:
  if (RegExMatch(command, "^addrevline:") > 0)
  {
    semvarLvl := SubStr(command, StrLen("addrevline:" + 1))
    addRevisionHistoryLine(semvarLvl)
  }
  else 
  {
    MsgBox, Command not recognized.
  }
return

::#authorme::@author Anish V. Abraham &lt;anish@asterotechnologies.com&gt;

::#backtotopmd::
  Send {Backspace}
  SendRaw [Back to top](#top){:class="btn btn-sm btn-mod btn-outline-primary"}
  Send {Enter}
  SendRaw {:class="text-right smooth-scroll"}
return

::#badgedangermd::
  Send {Backspace}
  SendRaw {:class="badge badge-danger"}
return
::#badgedark::
  Send {Backspace}
  SendRaw {:class="badge badge-dark"}
return
::#badgeinfomd::
  Send {Backspace}
  SendRaw {:class="badge badge-info"}
return
::#badgelightmd::
  Send {Backspace}
  SendRaw {:class="badge badge-light"}
return
::#badgeprimary::
  Send {Backspace}
  SendRaw {:class="badge badge-primary"}
return
::#badgesecondary::
  Send {Backspace}
  SendRaw {:class="badge badge-secondary"}
return
::#badgewarning::
  Send {Backspace}
  SendRaw {:class="badge badge-warning"}
return

::#date::
  sendDate()
return 
  
::#datetime::
  FormatTime, CurrentDateTime,, yyyy-MM-dd hh:mm
  SendInput %CurrentDateTime%,
return

::#fulldate::
  FormatTime, CurrentDateTime,, dddd, MMMM d, yyyy
  SendInput %CurrentDateTime%,
return

::#me::Anish V. Abraham

::#modcopyright::
  SendInput Modifications Copyright 
  FormatTime, CurrentDateTime,, yyyy
  SendInput {Space}(c) %CurrentDateTime%,{Space}
  SendInput Astero Technologies LLC. All rights to modifications are reserved.
return

::#note::<b>NOTE:</b>

::#psfstr::public static final String

::#v1::@version 0.1.0

return

sendDate()
{
  FormatTime, CurrentDate,, yyyy-MM-dd
  SendInput %CurrentDate%,
}

; Increment version number 
; semvarLvl = 'major' | 'minor' | 'patch'
incrementVersion(semvarLvl)
{
  Send {Esc}{Esc}gg/@version
  Sleep, lineDelay
  Send {Enter}$
  Sleep, lineDelay

  if (semvarLvl = "major") {
    loopCount := 2
  }
  else if (semvarLvl = "minor") {
    loopCount := 1
  }
  else if (semvarLvl = "patch") {
    loopCount := 0
  }

  Loop %loopCount% {
    Send bb
    Sleep, lineDelay
  }
  Send ^a
  Sleep, lineDelay
  Loop %loopCount% {
    resetNextVersionLevel()
  }

  Sleep, lineDelay
  Send :w{Enter}
  Sleep, lineDelay
  Sleep, lineDelay
  Sleep, lineDelay
  Sleep, lineDelay
  return
}

; Copy current version number
copyVersion()
{
  Send {Esc}{Esc}gg/@version{Enter}
  Sleep, lineDelay
  Send {Esc}elly$
  return
}

; Add line in revision history.
; semvarLvl = 'major' | 'minor' | 'patch'
addRevisionHistoryLine(semvarLvl)
{
  SetKeyDelay 100
  incrementVersion(semvarLvl)
  Sleep, lineDelay
  copyVersion()
  Send {Esc}{Esc}gg/REVISION HISTORY{Enter}
  Sleep, lineDelay
  Send o{Enter}
  sendDate()
  Sleep, lineDelay
  Send {Space}{Esc}pa{,} Anish V. Abraham:{Space}
  SetKeyDelay 0
}

; Reset the version number of the next version level to zero. 
; If the cursor is currently on the major version, then the minor is reset 
; to zero.
resetNextVersionLevel()
{
  Send ww
  Sleep, lineDelay
  Send cw
  Sleep, lineDelay
  Send 0
  Sleep, lineDelay
  Send {Esc}{Esc}
  Sleep, lineDelay
}

; All Other Windows ------------------------------------------------------------
#IfWinActive

; Make active window semi-transparent.
<!<^<+T::
  WinGetActiveTitle, title
  WinGet, transparency, Transparent, %title%
  if (transparency < 255) {
    WinSet, Transparent , 255, %title%
  }
  else {
    WinSet, Transparent , 160, %title%
  }
return
