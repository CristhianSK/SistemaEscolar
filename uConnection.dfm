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
    Left = 360
    Top = 224
  end
  object qryInsert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 40
    Top = 232
  end
  object qryMaxAlunos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(aluno_id) AS total_alunos FROM tb_alunos;')
    Left = 352
    Top = 280
  end
  object qrySelectAllTurmas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM tb_turmas ORDER BY turma_id;')
    Left = 568
    Top = 40
  end
  object qrySelectAllProfessores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '              SELECT * FROM tb_professores ORDER BY professor_id' +
        ';')
    Left = 184
    Top = 272
  end
  object qrySelectAllDisciplinas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '              SELECT * FROM tb_disciplinas ORDER BY disciplina_i' +
        'd;')
    Left = 360
    Top = 88
  end
  object qrySelectAllMatriculas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '                      SELECT * FROM tb_matriculas ORDER BY matri' +
        'cula_id;')
    Left = 192
    Top = 32
  end
  object qryMaxTurmas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(turma_id) AS total_turmas FROM tb_turmas;')
    Left = 568
    Top = 96
  end
  object qryMaxProfessores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT MAX(professor_id) AS total_professores FROM tb_professore' +
        's;')
    Left = 184
    Top = 208
  end
  object qryMaxDisciplinas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT MAX(disciplina_id) AS total_disciplinas FROM tb_disciplin' +
        'as;')
    Left = 352
    Top = 40
  end
  object qryMaxMatriculas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(matricula_id) AS total_matriculas FROM tb_matriculas;')
    Left = 192
    Top = 88
  end
end
