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

INSERT INTO clientes VALUES
(6, 'Lucas Pereira', 34, 5400, 'Sao Paulo', 710),
(7, 'Mariana Costa', 27, 3900, 'Campinas', 690),
(8, 'Rafael Nogueira', 45, 9800, 'Sorocaba', 770),
(9, 'Patricia Ramos', 31, 6200, 'Jundiai', 740),
(10, 'Felipe Araujo', 22, 2500, 'Votorantim', 560),
(11, 'Renata Pires', 38, 7200, 'Sao Paulo', 760),
(12, 'Eduardo Martins', 29, 4100, 'Itu', 680),
(13, 'Juliana Freitas', 33, 5800, 'Salto', 720),
(14, 'Thiago Lopes', 47, 10500, 'Campinas', 800),
(15, 'Vanessa Rocha', 26, 3600, 'Sorocaba', 650),
(16, 'Andre Farias', 52, 13000, 'Sao Paulo', 820),
(17, 'Camila Teixeira', 35, 6400, 'Jundiai', 750),
(18, 'Igor Batista', 41, 8700, 'Itu', 780),
(19, 'Larissa Mello', 24, 2900, 'Votorantim', 590),
(20, 'Daniel Guedes', 39, 7600, 'Salto', 770),
(21, 'Bianca Torres', 28, 4200, 'Campinas', 700),
(22, 'Rodrigo Neves', 44, 9100, 'Sao Paulo', 790),
(23, 'Aline Prado', 32, 5600, 'Sorocaba', 730),
(24, 'Gustavo Pacheco', 36, 6900, 'Jundiai', 760),
(25, 'Natalia Rios', 30, 5100, 'Itu', 710);

INSERT INTO contas VALUES
(106, 6, 'Corrente', 4200, '2021-05-10'),
(107, 7, 'Poupanca', 2800, '2022-02-14'),
(108, 8, 'Corrente', 11500, '2019-09-01'),
(109, 9, 'Investimento', 18000, '2020-11-20'),
(110, 10, 'Corrente', 900, '2023-03-05'),
(111, 11, 'Corrente', 7600, '2021-07-12'),
(112, 12, 'Poupanca', 3500, '2022-08-18'),
(113, 13, 'Corrente', 5400, '2020-10-03'),
(114, 14, 'Investimento', 30000, '2018-04-25'),
(115, 15, 'Corrente', 2200, '2023-01-10'),
(116, 16, 'Investimento', 40000, '2017-06-01'),
(117, 17, 'Corrente', 6100, '2021-09-15'),
(118, 18, 'Poupanca', 8900, '2019-12-22'),
(119, 19, 'Corrente', 1300, '2023-05-30'),
(120, 20, 'Corrente', 7400, '2020-03-11'),
(121, 21, 'Poupanca', 3900, '2022-06-17'),
(122, 22, 'Investimento', 26000, '2018-08-09'),
(123, 23, 'Corrente', 5200, '2021-01-28'),
(124, 24, 'Poupanca', 6800, '2020-04-19'),
(125, 25, 'Corrente', 5000, '2022-12-02');

INSERT INTO transacoes VALUES
(1007, 106, 'Debito', 300, '2024-02-01', 'Alimentacao'),
(1008, 107, 'Debito', 150, '2024-02-03', 'Transporte'),
(1009, 108, 'Credito', 1800, '2024-02-05', 'Salario'),
(1010, 109, 'Debito', 2200, '2024-02-07', 'Viagem'),
(1011, 110, 'Debito', 90, '2024-02-08', 'Lanches'),
(1012, 111, 'Debito', 450, '2024-02-10', 'Compras'),
(1013, 112, 'Credito', 1300, '2024-02-12', 'Salario'),
(1014, 113, 'Debito', 600, '2024-02-14', 'Educacao'),
(1015, 114, 'Debito', 5000, '2024-02-16', 'Investimentos'),
(1016, 115, 'Debito', 200, '2024-02-17', 'Alimentacao'),
(1017, 116, 'Credito', 2500, '2024-02-18', 'Dividendos'),
(1018, 117, 'Debito', 700, '2024-02-20', 'Saude'),
(1019, 118, 'Debito', 350, '2024-02-22', 'Transporte'),
(1020, 119, 'Debito', 120, '2024-02-23', 'Lanches'),
(1021, 120, 'Debito', 900, '2024-02-24', 'Compras'),
(1022, 121, 'Credito', 1400, '2024-02-25', 'Salario'),
(1023, 122, 'Debito', 3200, '2024-02-26', 'Viagem'),
(1024, 123, 'Debito', 500, '2024-02-27', 'Alimentacao'),
(1025, 124, 'Debito', 650, '2024-02-28', 'Educacao'),
(1026, 125, 'Debito', 400, '2024-02-29', 'Compras');

INSERT INTO emprestimos VALUES
(204, 6, 15000, 2.6, 'Ativo', '2023-09-12'),
(205, 7, 9000, 3.1, 'Ativo', '2024-01-20'),
(206, 8, 25000, 2.3, 'Ativo', '2022-11-05'),
(207, 9, 18000, 2.9, 'Quitado', '2021-04-18'),
(208, 10, 6000, 3.5, 'Ativo', '2024-02-01'),
(209, 11, 20000, 2.7, 'Ativo', '2023-06-10'),
(210, 12, 10000, 3.0, 'Quitado', '2022-03-15'),
(211, 13, 14000, 2.8, 'Ativo', '2023-10-02'),
(212, 14, 30000, 2.2, 'Ativo', '2021-07-19'),
(213, 15, 7000, 3.4, 'Ativo', '2024-01-05'),
(214, 16, 35000, 2.1, 'Ativo', '2020-09-09'),
(215, 17, 16000, 2.7, 'Quitado', '2022-05-30'),
(216, 18, 22000, 2.5, 'Ativo', '2023-08-21'),
(217, 19, 5000, 3.6, 'Ativo', '2024-02-03'),
(218, 20, 19000, 2.6, 'Ativo', '2023-11-11'),
(219, 21, 11000, 3.0, 'Quitado', '2022-02-14'),
(220, 22, 28000, 2.4, 'Ativo', '2021-12-01'),
(221, 23, 13000, 2.9, 'Ativo', '2023-07-07'),
(222, 24, 17000, 2.7, 'Ativo', '2023-09-23'),
(223, 25, 12000, 2.8, 'Ativo', '2024-01-15');
