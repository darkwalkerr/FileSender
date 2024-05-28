object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1050#1083#1080#1077#1085#1090
  ClientHeight = 441
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  DesignSize = (
    670
    441)
  TextHeight = 15
  object LabelAdress: TLabel
    Left = 294
    Top = 328
    Width = 80
    Height = 45
    Anchors = [akRight, akBottom]
    Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072#13#13' '
  end
  object Label1: TLabel
    Left = 526
    Top = 328
    Width = 75
    Height = 15
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1088#1090' '#1089#1077#1088#1074#1077#1088#1072
  end
  object LabeSaveFolder: TLabel
    Left = 269
    Top = 388
    Width = 147
    Height = 15
    Anchors = [akRight, akBottom]
    Caption = #1055#1072#1087#1082#1072' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1092#1072#1081#1083#1086#1074
  end
  object ButtonGetFile: TButton
    Left = 8
    Top = 370
    Width = 113
    Height = 53
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = ButtonGetFileClick
  end
  object EditServerAdress: TEdit
    Left = 388
    Top = 325
    Width = 121
    Height = 23
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object EditServerPort: TEdit
    Left = 620
    Top = 325
    Width = 35
    Height = 23
    Anchors = [akRight, akBottom]
    NumbersOnly = True
    TabOrder = 2
    Text = '7788'
  end
  object MemoLog: TMemo
    Left = 8
    Top = 8
    Width = 654
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object EditSaveFolder: TEdit
    Left = 422
    Top = 385
    Width = 233
    Height = 23
    Anchors = [akRight, akBottom]
    Enabled = False
    TabOrder = 4
    Text = 'C:\Test\1'
  end
  object ButtonChangeSaveFolder: TButton
    Left = 144
    Top = 370
    Width = 103
    Height = 53
    Anchors = [akRight, akBottom]
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1087#1082#1091' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    TabOrder = 5
    WordWrap = True
    OnClick = ButtonChangeSaveFolderClick
  end
  object IdTCPClient1: TIdTCPClient
    OnDisconnected = IdTCPClient1Disconnected
    OnConnected = IdTCPClient1Connected
    ConnectTimeout = 60
    Port = 0
    ReadTimeout = -1
    Left = 560
    Top = 408
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 504
    Top = 408
  end
end
