; Phrases that are intended to be auto-completed within coding environments.

; Add code editing environments below.
GroupAdd, CodeEditors, Eclipse
GroupAdd, CodeEditors, Notepad


; Match window titles where any part of the search phrase is available in the 
; window title.
SetTitleMatchMode, 2

#IfWinActive ahk_group CodeEditors
	::#datetime::
		FormatTime, CurrentDateTime,, yyyy-MM-dd hh:mm
		SendInput %CurrentDateTime%,
	return

	::#date::
		FormatTime, CurrentDate,, yyyy-MM-dd
		SendInput %CurrentDate%,
	return 
	
	::#me::Anish V. Abraham


#IfWinActive

