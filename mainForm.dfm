object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 668
  ClientWidth = 1030
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ConfigButton: TButton
    Left = 432
    Top = 8
    Width = 209
    Height = 49
    Caption = 'CONFIGURAR'
    DisabledImageName = 'Configura'
    TabOrder = 0
    OnClick = ConfigButtonClick
  end
  object debitButton: TButton
    Left = 202
    Top = 88
    Width = 185
    Height = 49
    Caption = 'INICIAR'
    DisabledImageName = 'debitButton'
    TabOrder = 1
  end
  object creditButton: TButton
    Left = 432
    Top = 88
    Width = 209
    Height = 49
    Caption = 'CREDITO'
    DisabledImageName = 'creditButton'
    TabOrder = 2
  end
  object confirmButton: TButton
    Left = 432
    Top = 143
    Width = 209
    Height = 49
    Caption = 'CONFIRMAR'
    DisabledImageName = 'confirmButton'
    TabOrder = 3
  end
  object undoButton: TButton
    Left = 671
    Top = 88
    Width = 185
    Height = 49
    Caption = 'DESFAZER'
    DisabledImageName = 'undoButton'
    TabOrder = 4
  end
  object cancelButton: TButton
    Left = 202
    Top = 143
    Width = 185
    Height = 49
    Caption = 'CANCELAR'
    DisabledImageName = 'cancelButton'
    TabOrder = 5
  end
  object abortButton: TButton
    Left = 671
    Top = 143
    Width = 185
    Height = 49
    Caption = 'ABORTAR'
    DisabledImageName = 'abortButton'
    TabOrder = 6
  end
  object logsMemo: TMemo
    Left = 202
    Top = 216
    Width = 689
    Height = 401
    TabOrder = 7
  end
end
