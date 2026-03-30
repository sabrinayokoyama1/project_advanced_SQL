CREATE TABLE clientes (
  cliente_id INTEGER PRIMARY KEY,
  nome TEXT,
  idade INTEGER,
  renda_mensal DECIMAL(10,2),
  cidade TEXT,
  score_credito INTEGER
);

CREATE TABLE contas (
  conta_id INTEGER PRIMARY KEY,
  cliente_id INTEGER,
  tipo_conta TEXT,
  saldo DECIMAL(10,2),
  data_abertura DATE,
  FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE transacoes (
  transacao_id INTEGER PRIMARY KEY,
  conta_id INTEGER,
  tipo TEXT,
  valor DECIMAL(10,2),
  data_transacao DATE,
  categoria TEXT,
  FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);

CREATE TABLE emprestimos (
  emprestimo_id INTEGER PRIMARY KEY,
  cliente_id INTEGER,
  valor DECIMAL(10,2),
  taxa_juros DECIMAL(5,2),
  status TEXT,
  data_concessao DATE,
  FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- CLIENTES
INSERT INTO clientes VALUES
(1,'Ana Souza',25,3200,'Campinas',680),
(2,'Bruno Lima',34,5400,'Sao Paulo',720),
(3,'Carla Mendes',29,4100,'Sorocaba',700),
(4,'Diego Alves',41,8800,'Jundiai',770),
(5,'Eduarda Pinto',22,2600,'Itu',590),
(6,'Felipe Rocha',38,7200,'Campinas',750),
(7,'Gabriela Martins',31,6000,'Sao Paulo',730),
(8,'Henrique Costa',45,9800,'Sorocaba',780),
(9,'Isabela Ribeiro',27,3900,'Salto',690),
(10,'Joao Teixeira',36,6700,'Campinas',760),
(11,'Karina Duarte',33,5800,'Jundiai',740),
(12,'Lucas Ferreira',28,4300,'Itu',700),
(13,'Mariana Lopes',30,5100,'Campinas',710),
(14,'Nicolas Barros',42,9100,'Sao Paulo',790),
(15,'Olivia Freitas',26,3700,'Sorocaba',660),
(16,'Paulo Nogueira',50,12000,'Campinas',810),
(17,'Renata Araujo',37,6800,'Jundiai',750),
(18,'Samuel Batista',44,8700,'Itu',780),
(19,'Tatiane Mello',24,2900,'Salto',600),
(20,'Victor Pacheco',39,7600,'Campinas',770),
(21,'Aline Castro',28,4200,'Sao Paulo',700),
(22,'Bruna Farias',35,6400,'Sorocaba',740),
(23,'Caio Prado',32,5600,'Jundiai',730),
(24,'Daniel Torres',47,10500,'Campinas',800),
(25,'Elaine Ramos',29,4800,'Itu',710),
(26,'Fabio Cunha',40,8200,'Campinas',760),
(27,'Gustavo Dias',34,6100,'Sao Paulo',740),
(28,'Helena Moura',27,3900,'Sorocaba',690),
(29,'Igor Carvalho',38,7300,'Jundiai',750),
(30,'Juliana Rezende',31,5900,'Campinas',720),
(31,'Kleber Andrade',45,9500,'Itu',780),
(32,'Larissa Cardoso',26,3600,'Salto',650),
(33,'Marcelo Gomes',41,8800,'Campinas',770),
(34,'Natasha Vieira',33,5700,'Sao Paulo',730),
(35,'Otavio Correia',37,6900,'Sorocaba',750),
(36,'Patricia Nunes',30,5200,'Jundiai',710),
(37,'Rafael Campos',44,9000,'Campinas',780),
(38,'Sandra Borges',39,7600,'Itu',760),
(39,'Tiago Peixoto',28,4300,'Salto',700),
(40,'Vanessa Brito',35,6400,'Campinas',740),
(41,'Wesley Tavares',42,9100,'Sao Paulo',790),
(42,'Yasmin Guedes',24,2800,'Sorocaba',600),
(43,'Zeca Pires',50,11500,'Campinas',810),
(44,'Adriana Melo',31,6000,'Jundiai',730),
(45,'Bruno Santos',36,6700,'Itu',750),
(46,'Camila Freire',29,4800,'Salto',710),
(47,'Douglas Reis',40,8200,'Campinas',760),
(48,'Erica Dantas',27,3900,'Sao Paulo',690),
(49,'Fernando Leite',38,7200,'Sorocaba',750),
(50,'Giovana Paes',33,5800,'Campinas',720),
(51,'Hugo Silveira',45,9800,'Jundiai',780),
(52,'Ingrid Queiroz',26,3600,'Itu',650),
(53,'Jonas Braga',41,8800,'Salto',770),
(54,'Kelly Moraes',30,5100,'Campinas',710),
(55,'Leandro Rios',39,7600,'Sao Paulo',770),
(56,'Monica Falcao',28,4200,'Sorocaba',700),
(57,'Neto Azevedo',44,9100,'Campinas',790),
(58,'Priscila Siqueira',32,5600,'Jundiai',730),
(59,'Rodrigo Viana',37,6800,'Itu',750),
(60,'Simone Coelho',35,6400,'Salto',740),
(61,'Tales Cunha',42,9100,'Campinas',790),
(62,'Ursula Pimenta',25,3200,'Sao Paulo',680),
(63,'Vitor Neves',34,5400,'Sorocaba',720),
(64,'Willian Fonseca',29,4100,'Jundiai',700),
(65,'Xavier Lopes',41,8800,'Campinas',770),
(66,'Yuri Matos',22,2600,'Itu',590),
(67,'Zilda Rocha',38,7200,'Salto',750),
(68,'Andre Cunha',31,6000,'Campinas',730),
(69,'Bianca Leal',45,9800,'Sao Paulo',780),
(70,'Cesar Furtado',27,3900,'Sorocaba',690),
(71,'Denise Guerra',36,6700,'Campinas',760),
(72,'Edson Pimenta',33,5800,'Jundiai',740),
(73,'Flavia Castro',28,4300,'Itu',700),
(74,'Gerson Lira',30,5100,'Salto',710),
(75,'Helio Antunes',42,9100,'Campinas',790),
(76,'Ivone Batista',26,3700,'Sao Paulo',660),
(77,'Jaime Porto',50,12000,'Sorocaba',810),
(78,'Katia Luz',37,6800,'Campinas',750),
(79,'Luciano Prado',44,8700,'Jundiai',780),
(80,'Marta Sena',24,2900,'Itu',600),
(81,'Nivaldo Peixoto',39,7600,'Salto',770),
(82,'Olga Teles',28,4200,'Campinas',700),
(83,'Pedro Lemos',35,6400,'Sao Paulo',740),
(84,'Quiteria Rosa',32,5600,'Sorocaba',730),
(85,'Rogério Figueira',47,10500,'Campinas',800),
(86,'Selma Cardozo',29,4800,'Jundiai',710),
(87,'Tadeu Maciel',40,8200,'Itu',760),
(88,'Ubirajara Luz',34,6100,'Salto',740),
(89,'Valeria Couto',27,3900,'Campinas',690),
(90,'Wagner Afonso',38,7300,'Sao Paulo',750),
(91,'Xuxa Brandao',31,5900,'Sorocaba',720),
(92,'Yago Sales',45,9500,'Campinas',780),
(93,'Zenaide Chaves',26,3600,'Jundiai',650),
(94,'Alvaro Pinto',41,8800,'Itu',770),
(95,'Beatriz Neri',33,5700,'Salto',730),
(96,'Claudio Bittencourt',37,6900,'Campinas',750),
(97,'Debora Veloso',30,5200,'Sao Paulo',710),
(98,'Elias Tavares',44,9000,'Sorocaba',780),
(99,'Fabiana Queiroz',39,7600,'Campinas',760),
(100,'Gilberto Rangel',28,4300,'Jundiai',700);

-- CONTAS 
INSERT INTO contas
SELECT 
  cliente_id + 100,
  cliente_id,
  CASE 
    WHEN cliente_id % 3 = 0 THEN 'Investimento'
    WHEN cliente_id % 2 = 0 THEN 'Poupanca'
    ELSE 'Corrente'
  END,
  (cliente_id * 500) % 30000 + 1000,
  DATE('2020-01-01', '+' || cliente_id || ' days')
FROM clientes;

-- TRANSAÇÕES (1 por conta)
INSERT INTO transacoes
SELECT
  conta_id + 1000,
  conta_id,
  CASE WHEN conta_id % 2 = 0 THEN 'Credito' ELSE 'Debito' END,
  (conta_id * 37) % 5000 + 50,
  DATE('2024-02-01', '+' || conta_id % 28 || ' days'),
  CASE 
    WHEN conta_id % 5 = 0 THEN 'Viagem'
    WHEN conta_id % 4 = 0 THEN 'Compras'
    WHEN conta_id % 3 = 0 THEN 'Alimentacao'
    WHEN conta_id % 2 = 0 THEN 'Salario'
    ELSE 'Transporte'
  END
FROM contas;

-- EMPRÉSTIMOS (1 por cliente)
INSERT INTO emprestimos
SELECT
  cliente_id + 200,
  cliente_id,
  (cliente_id * 1000) % 30000 + 5000,
  (cliente_id % 5) * 0.5 + 2.0,
  CASE WHEN cliente_id % 4 = 0 THEN 'Quitado' ELSE 'Ativo' END,
  DATE('2022-01-01', '+' || cliente_id * 10 || ' days')
FROM clientes;
