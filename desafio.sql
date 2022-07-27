SELECT aluno.matricula_aluno, aluno.no_aluno, aluno.id_status,
	periodo.no_periodo, turma.id_turma, 
    disciplina.sigla, atividade_avaliativa.ds_atividade, atividade_avaliativa.vl_pontos,
    nota_aluno.vl_nota, nota_aluno.vl_nota / atividade_avaliativa.vl_pontos * 100 AS percentual,
	nota_aluno.ds_observacoes_professor
FROM aluno
	INNER JOIN turma_aluno ON (aluno.matricula_aluno = turma_aluno.matricula_aluno)
    INNER JOIN turma ON (turma_aluno.id_turma = turma.id_turma)
    INNER JOIN periodo ON (turma.id_periodo = periodo.id_periodo)
    INNER JOIN disciplina ON (turma.id_disciplina = disciplina.id_disciplina)
    INNER JOIN atividade_avaliativa ON (turma.id_turma = atividade_avaliativa.id_turma)
    INNER JOIN nota_aluno ON (atividade_avaliativa.id_atividade_avaliativa = nota_aluno.id_atividade_avaliativa);