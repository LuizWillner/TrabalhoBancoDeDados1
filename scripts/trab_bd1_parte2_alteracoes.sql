use bd1_escola;

-- Q1: Alterar todos os contatos vinculados a um aluno A para um aluno B.
-- => Aluno A: codAluno = 21 
-- => Aluno B: codAluno = 27

update contato 
set codAluno = 27
where codAluno = 21;


-- Q2:  Forneça um conjunto de instruções SQL para remover da base de 
--      dados um professor qualquer. Caso o professor seja diretor de 
--      uma escola um novo diretor deverá ser definido.
-- => Professor para remover: codPessoa = 16
-- => Professor substituto:   codPessoa = 17

update escola
set codProfDiretor = 17
where codProfDiretor = 16;

delete from ministrar_turma 
where codProf = 16;

delete from ministrar 
where codProf = 16;

delete from pessoa
where codPessoa = 16;


-- Q3:  Considerando que um Professor P1 precisou sair de licença médica,
--      substituí-lo por outro Professor P2 em todas as turmas onde P1 ministra
--      disciplinas. Importante: Caso o Professor P2 não esteja vinculado a todas
--      as disciplinas ministradas pelo Professor P1, inclua a informação de que  
--      o Professor P2 é capaz de ministrar todas as disciplinas ministradas pelo
--      Professor P1.
-- => Professor P1: codProf = 10
-- => Professor P2: codProf = 11

insert into ministrar 
	(codProf, codDisciplina)
select 11, disciplinas_p1.codDisciplina
from (
	select codDisciplina
	from ministrar
	where ministrar.codProf = 10
) as disciplinas_p1
where disciplinas_p1.codDisciplina not in (
	select codDisciplina
	from ministrar
	where ministrar.codProf = 11
)

update ministrar_turma 
set codProf = 11
where codProf = 10
