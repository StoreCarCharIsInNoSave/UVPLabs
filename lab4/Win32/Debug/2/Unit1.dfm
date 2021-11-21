object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 353
    Height = 169
    Caption = 'Panel1'
    TabOrder = 0
    object StringGrid1: TStringGrid
      Left = 40
      Top = 0
      Width = 265
      Height = 105
      ColCount = 4
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      TabOrder = 0
    end
    object Button1: TButton
      Left = 144
      Top = 128
      Width = 75
      Height = 25
      Caption = #1042#1074#1077#1089#1090#1080
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 361
    Height = 169
    Caption = 'Panel2'
    TabOrder = 1
    object StringGrid2: TStringGrid
      Left = 40
      Top = 0
      Width = 265
      Height = 105
      ColCount = 4
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      TabOrder = 0
    end
    object Button2: TButton
      Left = 136
      Top = 128
      Width = 75
      Height = 25
      Caption = #1089#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 384
    object fsdf1: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1082#1085#1086' '#1074#1074#1086#1076#1072' '#1084#1072#1089#1089#1080#1074#1072
      OnClick = fsdf1Click
    end
    object fsdfsd1: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1084#1072#1089#1089#1080#1074
      OnClick = fsdfsd1Click
    end
    object N1: TMenuItem
      Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1089#1089#1080#1074
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1084#1072#1089#1089#1080#1074
      OnClick = N2Click
    end
  end
end
