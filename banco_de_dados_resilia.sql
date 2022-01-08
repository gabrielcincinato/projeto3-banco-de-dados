CREATE TABLE IF NOT EXISTS public.Turmas
(
    id_turma bigserial,
    nome_curso character varying(50) NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    CONSTRAINT id_turma_key PRIMARY KEY (id_turma)
);

INSERT INTO Turmas (id_turma, nome_curso, data_inicio, data_fim)
VALUES
	(1,'Análise de Dados', '2020-12-07', '2021-06-05'),
	(2,'Desenvolvimento Web', '2020-01-18', '2020-07-16'),
	(3,'Desenvolvimento Web', '2020-09-01', '2021-02-28'),
	(4,'Análise de Dados', '2020-02-21', '2020-08-19'),
	(5,'Desenvolvimento Web', '2020-09-24', '2021-03-23'),
	(6,'Análise de Dados', '2020-02-16', '2020-08-14'),
	(7,'Desenvolvimento Web', '2020-01-15', '2020-07-13'),
	(8,'Desenvolvimento Web', '2020-08-03', '2021-01-30'),
	(9,'Desenvolvimento Web', '2020-10-18', '2021-04-16'),
	(10,'Desenvolvimento Web', '2020-11-26', '2021-05-25'),
	(11,'Desenvolvimento Web', '2020-07-10', '2021-01-06'),
	(12,'Desenvolvimento Web', '2020-02-05', '2020-08-03'),
	(13,'Desenvolvimento Web', '2020-11-15', '2021-05-14'),
	(14,'Análise de Dados', '2020-03-07', '2020-09-03');