-- Criação do esquema do trabalho --

create schema bd1_escola;
use bd1_escola;

-- Criação das tabelas e relacionamentos --

create table cidade (
    codCidade integer not null auto_increment,
    nome varchar(50) not null,
    
    constraint pk_cidade primary key (codCidade)
);


create table pessoa(
    codPessoa integer not null auto_increment,
    nome varchar(50) not null,
    telefone varchar(20),
    codCidade integer not null,
    
    constraint pk_pessoa primary key (codPessoa),
    constraint fk_pessoa_relation_cidade foreign key (codCidade)
        references cidade (codCidade)
);


create table professor (
    codPessoa integer not null,
    rg varchar(13) not null,
    cpf varchar(15) not null,
    titulacao varchar(50) not null,
    
    constraint pk_professor primary key (codPessoa),
    constraint uk_rg unique key (rg),
    constraint uk_cpf unique key (cpf),
    constraint fk_professor_relation_pessoa foreign key (codPessoa)
        references Pessoa (codPessoa)
);


create table escola (
    codEscola integer not null auto_increment,
    nome varchar(50) not null,
    codCidade integer not null,
    codProfDiretor integer not null,
    
    constraint pk_escola primary key (codEscola),
    constraint uk_codProfDiretor unique key (codProfDiretor),
    constraint fk_escola_relation_cidade foreign key (codCidade)
        references cidade (codCidade),
    constraint fk_escola_relation_professor foreign key (codProfDiretor)
        references professor (codPessoa)
);


create table turma (
    codTurma integer not null auto_increment,
    nome varchar(50) not null,
    codEscola integer not null,
    
    constraint pk_turma primary key (codTurma),
    constraint fk_turma_relation_escola foreign key (codEscola)
        references escola (codEscola)
);


create table aluno (
    codPessoa integer not null,
    matricula varchar(50) not null,
    dataNasc date,
    codTurma integer not null,
    
    constraint pk_aluno primary key (codPessoa),
    constraint uk_matricula unique key (matricula),
    constraint fk_aluno_relation_pessoa foreign key (codPessoa)
        references pessoa (codPessoa),
    constraint fk_aluno_relation_turma foreign key (codTurma)
        references turma (codTurma)
);


create table disciplina (
    codDisciplina integer not null auto_increment,
    nome varchar(50) not null,
    
    constraint pk_disciplina primary key (codDisciplina),
    constraint uk_nome_disciplina unique key (nome)
);


create table contato (
    nome varchar(50) not null,
    codAluno integer not null,
    telefone varchar(20),
    
    constraint pk_contato primary key (nome, codAluno),
    constraint fk_contato_relation_pessoa foreign key (codAluno)
        references aluno (codPessoa)
);


create table ministrar (
    codProf integer not null,
    codDisciplina integer not null,
    
    constraint pk_ministrar primary key (codProf, codDisciplina),
    constraint fk_ministrar_relation_professor foreign key (codProf)
        references professor (codPessoa),
    constraint fk_ministrar_relation_disciplina foreign key (codDisciplina)
        references disciplina (codDisciplina)
);


create table ministrar_turma (
    codProf integer not null,
    codDisciplina integer not null,
    codTurma integer not null,
    
    constraint pk_ministrar_turma primary key (codProf, codDisciplina, codTurma),
    constraint fk_ministrar_turma_relation_ministrar foreign key (codProf, codDisciplina)
        references ministrar (codProf, codDisciplina),
    constraint fk_ministrar_turma_relation_turma foreign key (codTurma)
        references turma (codTurma)
);