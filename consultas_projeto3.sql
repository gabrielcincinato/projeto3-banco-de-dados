-- Selecionar a quantidade total de estudantes cadastrados no banco
SELECT COUNT(*) total_alunos FROM alunos

-- Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados
SELECT CONCAT(nome, ' ', sobrenome) alunos, nome_curso FROM alunos
JOIN turmas ON alunos.id_turma = turmas.id_turma

-- Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
SELECT CONCAT(nome, ' ', sobrenome) facilitadores, funcao, COUNT(id_turma) qtd_turmas FROM facilitadores
JOIN funcionarios ON facilitadores.id_funcionario = funcionarios.id_funcionario
GROUP BY funcionarios.id_funcionario
HAVING COUNT(id_turma) > 1










-- Porcentagem de resilientes e não-resilientes
SELECT
CASE
	WHEN turmas.data_fim <= NOW() THEN 'Resilientes'
	ELSE 'Não-resilientes'
	END AS resilientes, 

ROUND((count(*)::numeric(5,2)/(SELECT COUNT(*) FROM alunos)) * 100, 2) porcentagem FROM alunos JOIN turmas
ON alunos.id_turma = turmas.id_turma

GROUP BY resilientes;

-- Porcentagem de não-resilientes e resilientes trabalhando com tecnologia

SELECT
	CASE 
		WHEN trabalhando_na_area = True THEN 'Sim'
		ELSE 'Não'
	END AS trabalhando_na_area,
	ROUND(COUNT(*)::numeric(5,2)/(SELECT count(*) FROM alunos
								  JOIN turmas ON alunos.id_turma = turmas.id_turma
								  WHERE data_fim > NOW()) * 100, 2) nao_resilientes
								  
FROM alunos
JOIN turmas ON alunos.id_turma = turmas.id_turma
WHERE data_fim > NOW()
GROUP BY trabalhando_na_area

SELECT
	CASE
		WHEN trabalhando_na_area = True THEN 'Sim'
		ELSE 'Não'
	END AS trabalhando_na_area,
	ROUND(COUNT(*)::numeric(5,2)/(SELECT count(*) FROM alunos
								  JOIN turmas ON alunos.id_turma = turmas.id_turma
								  WHERE data_fim <= NOW()) * 100, 2) resilientes
								  
FROM alunos
JOIN turmas ON alunos.id_turma = turmas.id_turma
WHERE data_fim <= NOW()
GROUP BY trabalhando_na_area

-- Média e mediana dos salários dos funcionários
SELECT
	ROUND(avg(salario), 0) media_salario,
	percentile_cont(.5) WITHIN GROUP (ORDER BY salario) mediana_salario

FROM funcionarios

-- Média e mediana por departamento
SELECT
	departamentos.nome_departamento,
	ROUND(avg(salario), 0) media_salario,
	percentile_cont(.5) WITHIN GROUP (ORDER BY salario) as mediana_salario
	
FROM departamentos 
JOIN funcionarios ON funcionarios.funcao = departamentos.funcao
GROUP BY departamentos.nome_departamento
ORDER BY media_salario DESC, mediana_salario DESC
