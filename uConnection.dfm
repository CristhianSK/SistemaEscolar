object dbConnection: TdbConnection
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Cristhian\Desktop\SistemaEscolar\Win32\Debug\lib\libpq.' +
      'dll'
    Left = 8
    Top = 56
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=sistemaEscolar'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 8
  end
  object qrySelectAllAlunos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM tb_alunos ORDER BY aluno_id;')
    Left = 480
    Top = 384
  end
  object qryInsert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 88
    Top = 232
  end
  object qryMaxAlunos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(aluno_id) AS total_alunos FROM tb_alunos;')
    Left = 576
    Top = 392
  end
  object qrySelectAllTurmas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM tb_turmas ORDER BY turma_id;')
    Left = 528
    Top = 160
  end
  object qrySelectAllProfessores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '              SELECT * FROM tb_professores ORDER BY professor_id' +
        ';')
    Left = 368
    Top = 392
  end
  object qrySelectAllDisciplinas: TFDQuery
    Connection = FDConnection1
    Left = 16
    Top = 368
  end
  object qrySelectAllMatriculas: TFDQuery
    Connection = FDConnection1
    Left = 208
    Top = 72
  end
  object qryMaxTurmas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(turma_id) AS total_turmas FROM tb_turmas;')
    Left = 424
    Top = 160
  end
  object qryMaxProfessores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT MAX(professor_id) AS total_professores FROM tb_professore' +
        's;')
    Left = 232
    Top = 384
  end
end
