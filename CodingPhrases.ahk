; Phrases that are intended to be auto-completed within coding environments.

; Add code editing environments below.
GroupAdd, CodeEditors, Eclipse
GroupAdd, CodeEditors, Notepad
GroupAdd, CodeEditors, Code


; Match window titles where any part of the search phrase is available in the 
; window title.
SetTitleMatchMode, 2

#IfWinActive ahk_group CodeEditors

	<^<+PrintScreen::
		InputBox, command, Enter command, Enter command:
		if (command = "addrevline")
		{
			addRevisionHistoryLine()
		}
		else 
		{
			MsgBox, Command not recognized.
		}
	return

	::#datetime::
		FormatTime, CurrentDateTime,, yyyy-MM-dd hh:mm
		SendInput %CurrentDateTime%,
	return

	sendDate()
	{
		FormatTime, CurrentDate,, yyyy-MM-dd
		SendInput %CurrentDate%,
	}
	::#date::
		sendDate()
	return 
	
	::#me::Anish V. Abraham

	::#authorme::@author Anish V. Abraham &lt;anish@asterotechnologies.com&gt;

	::#v1::@version 0.0.1

	; Increment version number (patch level)
	incrementVersion()
	{
		Send {Esc}{Esc}gg/version
		Sleep, 100
		Send {Enter}$^a:w{Enter}
		return
	}
	::#vinc::
		incrementVersion()
	return

	; Copy current version number
	copyVersion()
	{
		Send {Esc}{Esc}gg/version{Enter}
		Sleep, 100
		Send {Esc}elly$
		return
	}

	; Add line in revision history
	addRevisionHistoryLine()
	{
		SetKeyDelay 50
		incrementVersion()
		Sleep, 100
		copyVersion()
		Send {Esc}{Esc}gg/REVISION HISTORY{Enter}
		Sleep, 100
		Send o{Enter}
		sendDate()
		Sleep, 100
		Send {Space}{Esc}pa{,} Anish V. Abraham:{Space}
		SetKeyDelay 0
	}

#IfWinActive
