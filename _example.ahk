#SingleInstance, Force
#Include, InputMouseKeyboard.ahk

Gui, -MinimizeBox -MaximizeBox
Gui, Add, Button, vKeyDecision gSetKey w180, Z
Gui, Add, Button, vKeyCancel gSetKey w180, X
Gui, Add, Button, vKeyShift gSetKey w180, SHIFT
Gui, Show, Center Autosize Center ; W640 H480
return

DisableNavigate:
return

SetKey:
GuiControl, Disable, KeyDecision
GuiControl, Disable, KeyCancel
GuiControl, Disable, KeyShift

GuiControlGet, kCurrent, , %A_GuiControl%
Gui, +Disabled
GuiControl, Text, %A_GuiControl%, Waiting...
GuiControl, Text, %A_GuiControl%, % (NewKey := InputMouseKeyboard(0,"vk",2)) ? NewKey : kCurrent
GuiControl, Enable, KeyDecision
GuiControl, Enable, KeyCancel
GuiControl, Enable, KeyShift
Gui, -Disabled
return

GuiEscape:
return

GuiClose:
ExitApp