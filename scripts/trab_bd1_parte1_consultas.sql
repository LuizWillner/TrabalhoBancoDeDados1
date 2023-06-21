-- Trabalho Banco de Dados 1 - Consultas --


-- Q1: Listar o nome e a cidade das escolas onde todos os alunos
--     residam na mesma cidade onde a escola está localizada.

select  alunos_total_por_escola.nome_escola, alunos_total_por_escola.nome_cidade_da_escola
from (
	select escola.codEscola, escola.nome as nome_escola, cidade.nome as nome_cidade_da_escola, count(pessoa.codPessoa) as total_pessoas
	from pessoa
	join aluno on pessoa.codPessoa = aluno.codPessoa 
	join turma on aluno.codTurma = turma.codTurma 
	join escola on turma.codEscola = escola.codEscola
	join cidade on escola.codCidade = cidade.codCidade 
 	group by escola.codEscola
) as alunos_total_por_escola
join (
	select escola.codEscola, count(pessoa.codPessoa) as total_pessoas_mesma_cidade
	from pessoa
	join aluno on pessoa.codPessoa = aluno.codPessoa 
	join turma on aluno.codTurma = turma.codTurma 
	join escola on turma.codEscola = escola.codEscola 
	where pessoa.codCidade = escola.codCidade 
	group by escola.codEscola
) as alunos_cidade_por_escola on alunos_total_por_escola.codEscola = alunos_cidade_por_escola.codEscola
where alunos_total_por_escola.total_pessoas = alunos_cidade_por_escola.total_pessoas_mesma_cidade;


-- Q2: Listar o nome e matrícula dos alunos sem nenhum contato cadastrado.

select pessoa.nome, aluno.matricula
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

select disciplina.nome, count(distinct ministrar.codProf) as total_profs, count(distinct ministrar_turma.codProf) as profs_em_atividade
from disciplina
join ministrar on disciplina.codDisciplina = ministrar.codDisciplina 
left join ministrar_turma on (ministrar.codDisciplina, ministrar.codProf) = (ministrar_turma.codDisciplina, ministrar_turma.codProf)
group by disciplina.nome;


-- Q6: Listar o nome da escola e o nome dos diretores de escola que residem
--     em cidades diferentes da cidade da escola.

select escola.nome as nome_escola, pessoa.nome as nome_prof_diretor
from escola
join pessoa on escola.codProfDiretor = pessoa.codPessoa 
where escola.codCidade != pessoa.codCidade;


-- Q7: Listar por escola o número de turmas e o número de professores que
--     ministram alguma disciplina para turmas da escola em questão.

select escola.nome, count(distinct turma.codTurma) as quant_turmas, count(distinct ministrar_turma.codProf) as quant_profs
from escola 
join turma on escola.codEscola = turma.codEscola 
join ministrar_turma on turma.codTurma = ministrar_turma.codTurma 
group by escola.nome;



-- Q8: Listar por escola a razão entre o número de alunos da escola e o
--     número de professores que ministram alguma disciplina na escola em questão.

select escola.nome, count(distinct aluno.codPessoa)/count(distinct ministrar_turma.codProf) as razao_alunos_por_prof
from escola
join turma on escola.codEscola = turma.codEscola 
join aluno on turma.codTurma = aluno.codTurma 
join ministrar_turma on turma.codTurma = ministrar_turma.codTurma 
group by escola.nome;


-- Q9: Listar todos os contatos dos alunos informando a matrícula e nome do aluno,
--     nome e telefone do contato, ordenado por matrícula do aluno e nome do contato.

select aluno.matricula, pessoa.nome as nome_aluno, contato.nome as nome_contato, contato.telefone as telefone_contato
from pessoa
join aluno on pessoa.codPessoa = aluno.codPessoa
join contato on aluno.codPessoa = contato.codAluno
order by aluno.matricula, contato.nome;


-- Q10: Listar todos os professores que ministram disciplinas para apenas uma turma

select pessoa.nome as nome_prof
from pessoa
join (
	select professor_turma.codProf, count(professor_turma.codTurma) as total_turmas
	from (
		select distinct ministrar_turma.codProf, ministrar_turma.codTurma
		from ministrar_turma
	) as professor_turma
	group by professor_turma.codProf
) as turmas_por_prof on pessoa.codPessoa = turmas_por_prof.codProf
where turmas_por_prof.total_turmas = 1;
