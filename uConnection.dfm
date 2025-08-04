object dbConnection: TdbConnection
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Cristhian\Desktop\SistemaEscolar\Win32\Debug\lib\libpq.' +
      'dll'
    Left = 224
    Top = 184
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=sistemaEscolar'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 224
    Top = 128
  end
  object qrySelectAllAlunos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM tb_alunos;')
    Left = 480
    Top = 136
  end
  object qryInsertAluno: TFDQuery
    Connection = FDConnection1
    Left = 480
    Top = 272
  end
end
