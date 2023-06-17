-- Populando tabela 'cidade' --
insert into cidade
	(codCidade, nome)
values
	(4, 'Rio de Janeiro'), (5, 'Niterói'), (6, 'São Paulo'), (7, 'Salvador'), (8, 'Curitiba');
    
    
-- Populando tabela 'pessoa' --
insert into pessoa
	(codPessoa, nome, telefone, codCidade)
values
	(10, 'Lucas Vitor Caldeira Borba', '(51)926742422', 4),
	(11, 'Gabriel Robert Rosário', '(87)955791733', 5),
	(12, 'Eduardo Feliciano Rocha', '(48)961248718', 6),
	(13, 'Carlos Abreu', '(57)965741425', 7),
	(14, 'David Aragão Fidalgo', '(62)915196471', 8),
	(15, 'Lilian Feliciano Matos', '(25)961386984', 4),
	(16, 'Simão Helder Quintana Reis', '(73)923387419', 5),
	(17, 'Dilma Abreu de França', '(34)928337248', 6),
	(18, 'Simon Kevin Lozano Romero', '(61)962316452', 7),
	(19, 'Manuel Leon de Oliveira', '(17)939672359', 8),
	(20, 'Gabriela Amélia Carmona de Castro', null, 4),
	(21, 'Jairo Fonseca de Almeida', '(92)944815686', 5),
	(22, 'Ezequiel Fernandes Filho', '(42)991268711', 6),
	(23, 'Reginaldo Roberto Domingues de Ferraz', null, 7),
	(24, 'Luna Bittencourt de Alvim', '(56)949626589', 8),
	(25, 'Carlos Bittencourt de Flores', null, 4),
	(26, 'Edu Eric Galvão de Madeira', '(49)931669262', 5),
	(27, 'Ricardo Bóris de Queirós Sobrinho', null, 6),
	(28, 'Anna Manuela de Colaço', '(97)954864275', 7),
	(29, 'Anna Sheila Chaves da Paixão', null, 8),
	(30, 'Emílio Lucas Leon Marin', '(99)948665143', 4),
	(31, 'Ana Ediane Romero de Gimenes', '(94)918857442', 5),
	(32, 'Fernanda Corona Galhardo', null, 6),
	(33, 'André Hércules Aragão Coutinho', null, 7),
	(34, 'Arthur Baltazar Fontes Quintana', '(73)916369346', 8),
	(35, 'Eduardo Flávio de Ferreira Sobrinho', '(39)957193526', 4),
	(36, 'Cauê Fontes', '(88)916334147', 5),
	(37, 'Alessandra Alessandra Gil de Bueno', '(11)955347824', 6),
	(38, 'Luiza Márcia Correia', '(84)917936422', 7),
	(39, 'Malena Shirley Caldeira Soto de Almeida', '(48)921727279', 8),
	(40, 'Horácio Everton Cervantes', '(65)971139316', 4),
	(41, 'Jaqueline Jenny Leal',	'(95)978542275', 5),
	(42, 'Anna Ângela Burgos Feliciano',	'(25)925572921', 6),
	(43, 'Everaldo Benites de Perez', '(19)997764556', 7),
	(44, 'Celso Geraldo Delatorre Valdez de Cerqueira', '(88)972538782', 8),
	(45, 'Sérgio Altair Ávila Ferminiano', '(71)968176535', 4),
	(46, 'Hélio Sílvio Barreto Jr.',	'(43)956128329', 5),
	(47, 'Batista Burgos Sobrinho', '(77)969226571', 6),
	(48, 'Eduardo Gonçalves Vega', '(25)951832959', 7);


-- Popular tabela 'professor' --
insert into professor
	(codPessoa, rg, cpf, titulacao)
values
	(10,	'83.582.652-5',	'515.683.686-64',	'Doutor(a)'),
	(11,	'28.279.461-9',	'284.421.822-84',	'Mestre'   ),
	(12,	'44.467.714-4',	'411.264.393-45',	'Doutor(a)'),
	(13,	'63.123.871-5',	'329.975.231-79',	'Mestre'   ),
	(14,	'75.438.582-7',	'357.793.324-14',	'Doutor(a)'),
	(15,	'86.575.195-9',	'956.383.725-78',	'Mestre'   ),
	(16,	'35.617.383-3',	'173.458.623-26',	'Doutor(a)'),
	(17,	'55.134.182-7',	'487.432.528-47',	'Mestre'   );


-- Popular tabela 'escola' --
insert into escola
	(codEscola, nome, codCidade, codProfDiretor)
values
	(3, 'Colégio São Vicente de Paulo',	4,	10),
	(4, 'Abel',	4,	11),
	(5, 'Salesiano',	5,	16),
	(6, 'Colégio PH',	6,	14);
    

-- Popular tabela 'turma' --
insert into turma
	(codTurma, nome, codEscola)
values
	(2, 'A1',	3),
	(3, 'A2',	3),
	(4, 'B1',	4),
	(5, 'B2',	4),
	(6, 'C1',	5),
	(7, 'C2',	5),
	(8, 'D1',	6),
	(9, 'D2',	6);


-- Popular tabela 'aluno' --
insert into aluno
	(codPessoa, matricula, dataNasc, codTurma)
values
	(17,	'5325224058824445156',	'2001-09-03',	2),
	(18,	'8419888541193805174',	'2001-09-07',	4),
	(19,	'7541970229412625568',	'2003-05-12',	3),
	(20,	'2736330954416384063',	'2002-04-01',	2),
	(21,	'3567210378442218235',	'2004-12-11',	3),
	(22,	'1195158450764163924',	'2006-05-08',	6),
	(23,	'2897613366610461843',	'2001-02-13',	2),
	(24,	'2135490933568941342',	'2009-09-06',	6),
	(25,	'7397046490735899253',	'2000-07-10',	4),
	(26,	'8468188870375303287',	'1998-12-21',	3),
	(27,	'5076280220808908722',	'2000-12-20',	2),
	(28,	'5557027647356363583',	'1997-04-10',	6),
	(29,	'1833240187758369644',	'2002-09-16',	7),
	(30,	'4417676549269207882',	'2003-09-05',	3),
	(31,	'8423842748236263463',	'2001-01-31',	4),
	(32,	'6423859235283523572',	'2004-02-20',	2),
	(33,	'8352934829342349230',	'2001-08-26',	5),
	(34,	'0214971286427472364',	'1999-11-05',	3),
	(35,	'4456151561511551615',	'2004-12-11',	7),
	(36,	'4821381238127312475',	'2006-05-08',	5),
	(37,	'0843647283432482357',	'2001-02-13',	2),
	(38,	'3923572835723573755',	'2009-09-06',	8),
	(39,	'3255238572385723527',	'2000-07-10',	8),
	(40,	'4582582352375236575',	'1998-12-21',	4),
	(41,	'0823742342634532585',	'2000-12-20',	4),
	(42,	'7652782357235623572',	'1997-04-10',	8),
	(43,	'1234567894723572523',	'2002-09-16',	8),
	(44,	'9283572358235725326',	'2003-09-05',	7),
	(45,	'2357238526573265723',	'2001-09-03',	4),
	(46,	'2352735823752735723',	'2001-09-07',	8),
	(47,	'5827532858723582735',	'2003-05-12',	9),
	(48,	'5235723563275623525',	'1999-11-27',	9);
    

-- Popular tabela 'disciplina' --
insert into disciplina
	(codDisciplina, nome)
values
	(18, 'Matemática'),
	(19, 'Física'),
	(20, 'Química'),
	(21, 'Biologia'),
	(22, 'História'),
	(23, 'Geografia'),
	(24, 'Português');
    

-- Popular tabela 'contato'
insert into contato
	(nome, codAluno, telefone)
values
	('Adriana Maria Bezerra Correia',	17,	'(86)918985947'),
	('Adriana Maria Bezerra Correia',	18,	'(86)918985947'),
	('Adriana Maria Bezerra Correia',	19,	'(86)918985947'),
	('Adriana Maria Bezerra Correia',	20,	'(86)918985947'),
	('Valentin Kauê Galhardo Maia de Alvarenga',	17,	'(18)958759436'),
	('Valentin Kauê Galhardo Maia de Alvarenga',	18,	'(18)958759436'),
	('Elisângela Jandira Espinoza de Rios',	21,	'(55)989655158'),
	('Mia Ferreira',	22,	'(74)932429124'),
	('Mia Ferreira',	23,	'(74)932429124'),
	('Mia Ferreira',	24,	'(74)932429124'),
	('Lino Mateus Escobar Esteves de Matos',	21,	'(61)981279264'),
	('Thiago Batista da Cruz',	25,	'(64)995186132'),
	('Amarildo Jonathas Fonseca Rico',	26,	'(86)918254156'),
	('Fábio Jesus Bittencourt Pacheco de Amorim',	27,	'(26)936873927'),
	('Christian Eduardo de Delatorre',	28,	'(63)993742793'),
	('Christian Eduardo de Delatorre',	29,	'(63)993742793'),
	('Elias Yuri de Albuquerque',	20,	'(72)924194645'),
	('Fábio Burgos',	30,	'(11)916899684'),
	('Marta Gil de Marques',	28,	'(22)956223947'),
	('Eduardo Guerra de Drummond',	31,	'(51)962743127'),
	('Eduardo Guerra de Drummond',	32,	'(51)962743127'),
	('Hércules Nathan Branco',	33,	'(12)974831797'),
	('Jerônimo Carmona da Lira',	34,	'(32)935584988');


-- Popular tablea 'ministrar'
insert into ministrar
	(codProf, codDisciplina)
values
	(10,	18),
	(10,	19),
	(10,	20),
	(11,	19),
	(11,	18),
	(12,	20),
	(12,	21),
	(13,	21),
	(13,	19),
	(14,	22),
	(14,	23),
	(15,	23),
	(15,	22),
	(15,	18),
	(15,	19),
	(16,	24),
	(16,	22),
	(17,	24);

-- Popular tabela ministrar_turma
insert into ministrar_turma
	(codProf, codDisciplina, codTurma)
values
	(10, 18, 2),
	(10, 18, 3),
	(15, 18, 4),
	(15, 18, 5),
	(10, 19, 2),
	(10, 19, 4),
	(10, 19, 6),
	(13, 19, 7),
	(15, 19, 7),
	(15, 19, 8),
	(15, 19, 3),
	(15, 19, 4),
	(10, 20, 8),
	(10, 20, 9),
	(10, 20, 7),
	(12, 21, 2),
	(12, 21, 3),
	(13, 21, 4),
	(13, 21, 5),
	(13, 21, 9),
	(15, 22, 4),
	(15, 22, 5),
	(15, 22, 6),
	(15, 22, 7),
	(15, 22, 8),
	(15, 22, 9),
	(14, 23, 6),
	(14, 23, 7),
	(15, 23, 2),
	(17, 24, 2),
	(17, 24, 3),
	(17, 24, 4),
	(17, 24, 5),
	(17, 24, 6);
    