VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Win-Copyover"
   ClientHeight    =   1755
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3135
   Icon            =   "frmreboot.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1755
   ScaleWidth      =   3135
   StartUpPosition =   2  'CenterScreen
   WindowState     =   1  'Minimized
   Begin VB.CommandButton Command2 
      Caption         =   "&Hide"
      Height          =   375
      Left            =   1680
      TabIndex        =   4
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&About"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   2895
      Begin VB.Timer Timer1 
         Interval        =   1
         Left            =   2400
         Top             =   0
      End
      Begin VB.Label Label1 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Copyover Time: 03:00:00"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label2 
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   720
         Width           =   2415
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    frmAbout.Show
End Sub

Private Sub Command2_Click()
Me.WindowState = 1
End Sub

Private Sub Form_Load()
    newline$ = ""
    
    If App.PrevInstance = True Then
        X = MsgBox("You cannot start more than one instance of this program.", vbCritical)
        End
    End If
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    
    buf$ = "Are you sure you want to shut this program down?" + Chr$(13) + Chr$(10)
    buf$ = buf$ + "If you shut this down, a critical daily" + Chr$(13) + Chr$(10)
    buf$ = buf$ + "process will not occur."
    X = MsgBox(buf$, vbYesNo, "Confirm Shutdown")
    
    If X = 6 Then
        pass$ = InputBox$("Enter the confirmation code:", "Confirmation")
        If pass$ = "admin" Then
            Call log_buf("Admin shutdown auto-reboot")
            Cancel = 0
        Else
            X = MsgBox("You entered an invalid authorization code.", vbCritical, "Invalid Authorization Code!")
            Cancel = 1
        End If
    Else
        Cancel = 1
    End If
    
End Sub

Private Sub Timer1_Timer()
Label2.Caption = "Current Time: " + Time$

If Time$ = "03:00:00" Then
    FileCopy "h:\update\database.dat", "c:\dat\database.dat"
    FileCopy "h:\update\autoexec.$$$", "c:\autoexec.$$$"
    Call log_buf("Copyover complete.")
End If

End Sub
