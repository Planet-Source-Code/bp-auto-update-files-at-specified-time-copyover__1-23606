Attribute VB_Name = "Module1"
'*******************************************************
'
' Auto-Update / Reboot Windows
'
' Written by:  Blake Pell
'     E-Mail:  bpell@indiana.edu, blakepell@hotmail.com
'
'*******************************************************

Declare Function ExitWindowsEx Lib "User32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Boolean

Global Const EWX_LOGOFF = 0
Global Const EWX_SHUTDOWN = 1
Global Const EWX_REBOOT = 2
Global Const EWX_FORCE = 4

Global newline$

Public Function WinShutdown() As Boolean
    WinShutdown = ExitWindowsEx(EWX_FORCE, 0)
End Function

Public Sub log_buf(buf$)
    On Local Error Resume Next
   
    Open "c:\reboot.txt" For Append As #1
        Print #1, Format$(Date$, "ddddd") + " " + Format$(Time$, "ttttt") + ": " + buf$
    Close #1
    
End Sub
