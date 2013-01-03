; Force the script to have the only instance to avoid hotkey effect conflicts
#SingleInstance, force

; Set the script's icon if it is not compiled
if(!A_IsCompiled)
{
  Menu, tray, icon, pinned_window.ico
}
; Disable standard menu items
Menu, tray, NoStandard
; Create Help menu item
Menu, tray, add, Help, ShowHelp
; Create Exit menu item
Menu, tray, add, Exit, ExitScript

; Hotkey processing
#LButton::
  ; Get id of the window that was clicked 
  MouseGetPos, OutputVarX, OutputVarY, hWnd
  ; Toggle the window's AlwaysOnTop attribute
  WinSet, AlwaysOnTop, Toggle, ahk_id %hWnd%
return

ShowHelp:
  msgbox, Hold Win button and click anywhere in the window you want to pin on top of other windows.`nUse the same action (Win+left button click) to unpin a pinned window.
return

; 'Exit' menu item subroutine
ExitScript:
  ExitApp