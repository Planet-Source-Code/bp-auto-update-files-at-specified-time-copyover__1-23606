VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About"
   ClientHeight    =   1800
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4035
   Icon            =   "frmabout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1800
   ScaleWidth      =   4035
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "Ok"
      Height          =   375
      Left            =   2640
      TabIndex        =   3
      Top             =   1320
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "E-Mail: bpell@indiana.edu, blakepell@hotmail.com"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   3735
   End
   Begin VB.Label Label2 
      Caption         =   "Written by:  Blake B. Pell"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   3615
   End
   Begin VB.Line Line1 
      X1              =   120
      X2              =   3960
      Y1              =   480
      Y2              =   480
   End
   Begin VB.Label Label1 
      Caption         =   "IU Foundation Telefund Auto-Update"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Me.Hide
End Sub
