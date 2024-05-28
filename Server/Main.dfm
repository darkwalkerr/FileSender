﻿object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1077#1088#1074#1077#1088
  ClientHeight = 465
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    624
    465)
  TextHeight = 15
  object LabelPort: TLabel
    Left = 332
    Top = 368
    Width = 78
    Height = 15
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1088#1090' '#1089#1077#1088#1074#1077#1088#1072':'
  end
  object Label1: TLabel
    Left = 166
    Top = 416
    Width = 108
    Height = 15
    Anchors = [akRight, akBottom]
    Caption = #1060#1072#1081#1083' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080':'
  end
  object MemoLog: TMemo
    Left = 8
    Top = 25
    Width = 608
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ButtonStart: TButton
    Left = 8
    Top = 360
    Width = 113
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 1
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 136
    Top = 360
    Width = 105
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = #1057#1090#1086#1087
    TabOrder = 2
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 416
    Top = 365
    Width = 77
    Height = 23
    Anchors = [akRight, akBottom]
    NumbersOnly = True
    TabOrder = 3
    Text = '7788'
  end
  object EditFileName: TEdit
    Left = 280
    Top = 413
    Width = 213
    Height = 23
    Anchors = [akRight, akBottom]
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object ButtonСhooseFile: TButton
    Left = 8
    Top = 408
    Width = 113
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083
    TabOrder = 5
    OnClick = ButtonСhooseFileClick
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnConnect = IdTCPServer1Connect
    OnDisconnect = IdTCPServer1Disconnect
    OnExecute = IdTCPServer1Execute
    Left = 520
    Top = 352
  end
  object OpenDialog1: TOpenDialog
    Left = 520
    Top = 400
  end
end
