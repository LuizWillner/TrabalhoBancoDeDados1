-- Trabalho Banco de Dados 1 - Consultas --


-- Q1: Listar o nome e a cidade das escolas onde todos os alunos
--     residam na mesma cidade onde a escola está localizada.


-- Q2: Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.

select pessoa.codPessoa, pessoa.nome, aluno.matricula
from pessoa
join aluno on pessoa.codPessoa = aluno.codPessoa 
where aluno.codPessoa not in (
	select distinct contato.codAluno 
	from contato
);


-- Q3: Listar o código e nome das turmas com mais de 5 alunos.

select alunos_por_turma.codTurma, turma.nome 
from (
	select aluno.codTurma, count(*) as quant_alunos
	from aluno
	group by aluno.codTurma
) as alunos_por_turma
join turma on turma.codTurma = alunos_por_turma.codTurma
where alunos_por_turma.quant_alunos > 5;


-- Q4: Listar o código, nome e titulação dos professores que ministram
--     aulas para pelo menos três turmas diferentes.

select turma_por_prof.codProf, pessoa.nome, professor.titulacao 
from (
	select ministrar_turma.codProf, count(*) as quant_turmas
	from ministrar_turma
	group by ministrar_turma.codProf
) as turma_por_prof
join pessoa on turma_por_prof.codProf = pessoa.codPessoa
join professor on pessoa.codPessoa = professor.codPessoa 
where turma_por_prof.quant_turmas >= 3;


-- Q5: Listar por disciplina o número de professores que podem ministrá-la
--     e quantos efetivamente ministram a mesma para uma turma.


-- Q6: Listar o nome da escola e o nome dos diretores de escola que residem
--     em cidades diferentes da cidade da escola.


-- Q7: Listar por escola o número de turmas e o número de professores que
--     ministram alguma disciplina para turmas da escola em questão.


-- Q8: Listar por escola a razão entre o número de alunos da escola e o
--     número de professores que ministram alguma disciplina na escola em questão.


-- Q9: Listar todos os contatos dos alunos informando a matrícula e nome do aluno,
--     nome e telefone do contato, ordenado por matrícula do aluno e nome do contato.


-- Q10: Listar todos os professores que ministram disciplinas para apenas uma turma
