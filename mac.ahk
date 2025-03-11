; This script assumes that Alt and Ctrl characters have been swapped using a third-party tool
; I would recommend SharpKeys (Remaps with Registry, so no app needs to run in the background)

; NOTE: Because Alt and Ctrl keys are swapped, the script uses the following key mappings:
; -----KEY GUIDE (Win - Mac)-----
; # -> Windows Key - Option key
; + -> Shift - Shift
; ^ -> Alt - Command
; ! -> Ctrl - Control
; & Any two keys to combine into custom hotkey.

; -----MISC-----
SendMode("Input") ; Send input directly to the active window
SetWorkingDir(A_ScriptDir) ; Set the working directory to the script's directory

; --- Command + Arrow Keys
; Move to the start of line
^Left:: {
    Suspend(true)
    Send("{Home}")
    Suspend(false)
    return
}
; Move to the end of line
^Right:: {
    Suspend(true)
    Send("{End}")
    Suspend(false)
    return
}
; Move to the start of document
^Up:: {
    Suspend(true)
    Send("^{Home}")
    Suspend(false)
    return
}
; Move to the end of document
^Down:: {
    Suspend(true)
    Send("^{End}")
    Suspend(false)
    return
}

; --- Command + Shift + Arrow Keys
; Select to the start of line
+^Left:: {
    Suspend(true)
    Send("+{Home}")
    Suspend(false)
    return
}
; Select to the end of line
+^Right:: {
    Suspend(true)
    Send("+{End}")
    Suspend(false)
    return
}
; Select to the start of document
+^Up:: {
    Suspend(true)
    Send("+^{Home}")
    Suspend(false)
    return
}
; Select to the end of document
+^Down:: {
    Suspend(true)
    Send("+^{End}")
    Suspend(false)
    return
}

; --- Option + Arrow Keys
; Move to the start of word
#Left:: {
    Send("^{Left}")
    Sleep 60
    return
}
; Move to the end of word
#Right:: {
    Send("^{Right}")
    Sleep 60
    return
}
; Alt + Up (Move line up)
#Up:: {
    Send("!{Up}")
    Sleep 60
    return
}
; Alt + Down (Move line down)
#Down:: {
    Send("!{Down}")
    Sleep 60
    return
}

; --- Option + Shift + Arrow Keys
; Select to the start of word
+#Left:: {
    Send("+^{Left}")
    Sleep 60
    return
}
; Select to the end of word
+#Right:: {
    Send("+^{Right}")
    Sleep 60
    return
}
; Duplicate line up
+#Up:: {
    Send("+!{Up}")
    Sleep 60
    return
}
; Duplicate line down
+#Down:: {
    Send("+!{Down}")
    Sleep 60
    return
}

; --- Command + Backspace
; Delete to the start of line
^Backspace:: {
    Suspend(true)
    Send("+{Home}")
    Send("{Backspace}")
    Suspend(false)
    return
}

; --- Option + Backspace
; Delete to the start of word
#Backspace:: {
    Suspend(true)
    Send("^{Backspace}")
    Sleep 20
    Suspend(false)
    return
}

; --- All Apps
; Command + Q -> Hold to Quit
^q::HoldToQuit()
HoldToQuit() {
    StartTime := A_TickCount
    ; Wait for 600ms
    While (A_TickCount - StartTime < 600) {
        if (!GetKeyState("q", "P") || !GetKeyState("Ctrl", "P"))
            return
        Sleep(4)
    }
    ; Send Alt + F4 Command
    Send("!{f4}")
    return
}
; Command + Tab -> Alt + Tab
Ctrl & Tab:: AltTab
; Ctrl + Tab -> Ctrl + Tab
!Tab:: Send("^{Tab}")

; Add more hotkeys here, ask ChatGPT or ask on GitHub issues