CREATE DATABASE bd_aula07;
\c bd_aula07
CREATE TABLE tbl_fornecedor (
    cod_fornecedor serial primary key,
    nome text not null,
    status integer,
    cidade text
);
CREATE TABLE tbl_peca (
    cod_peca serial primary key,
    nome text not null,
    cor text,
    preco numeric,
    cidade text
);
CREATE TABLE tbl_estoque (
    cod_compra serial primary key,
    cod_fornecedor integer references tbl_fornecedor(cod_fornecedor),
    cod_peca integer references tbl_peca(cod_peca),
    quantidade integer
);
						
INSERT INTO tbl_fornecedor (nome,status,cidade) 
VALUES
('A',30,'LONDRES'),
('B',20,'PARIS'),
('C',10,'PARIS'),
('D',10,'LONDRES');

INSERT INTO tbl_peca(nome, cor, preco, cidade)
VALUES
('PLACA','AZUL',5,'LONDRES'),
('MESA','VERMELHA',10,'PARIS'),
('CADERNO','PRETA',14,'ROMA'),
('TESOURA','VERMELHA',12,'LONDRES');

INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade)
VALUES
(1,1,30),
(2,1,30),
(3,2,10),
(3,3,50);

-- Listar o nome dos fornecedores(maiusculo) e das peças(minusculo) que se situam na mesma cidade, ordenado pelo nome.
-- Resposta:

SELECT UPPER(f.nome), LOWER(p.nome)
FROM tbl_fornecedor AS f, tbl_peca AS p
WHERE f.cidade = p.cidade
ORDER BY f.nome ASC;
------------------------------------------------------------------------------------
--listar as cidades onde existem fornecedores (sem valores duplicados)
-- Resposta:

SELECT DISTINCT (cidade)
FROM tbl_fornecedor;
------------------------------------------------------------------------------------
--Listar o nome e a cor das peças do fornecedor com código 3, ordenado pelo nome da peça
-- Resposta:

SELECT p.nome, p.cor
FROM tbl_peca AS p
INNER JOIN tbl_estoque AS e ON p.cod_peca = e.cod_peca
INNER JOIN tbl_fornecedor AS f ON f.cod_fornecedor = e.cod_fornecedor
WHERE f.cod_fornecedor = 3
ORDER BY p.nome ASC;
------------------------------------------------------------------------------------
--Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1. 
-- Resposta:

SELECT f.nome, f.cidade
FROM tbl_fornecedor AS f
INNER JOIN tbl_estoque AS e ON f.cod_fornecedor = e.cod_fornecedor
INNER JOIN tbl_peca AS p ON e.cod_peca = e.cod_peca
WHERE e.quantidade > 10 AND e.cod_peca = 1;
------------------------------------------------------------------------------------
--Listar a quantidade total de peças com código 1, fornecidas pelos fornecedores.
-- Resposta:

SELECT SUM(quantidade)
FROM tbl_estoque
WHERE cod_peca = 1;
------------------------------------------------------------------------------------
--Listar a média dos preços das peças fornecidas pelo fornecedor com código 3.
-- Resposta:

SELECT AVG(p.preco) AS media_precos
FROM tbl_estoque AS e
JOIN tbl_peca AS p ON e.cod_peca = p.cod_peca
WHERE e.cod_fornecedor = 3;
------------------------------------------------------------------------------------
--lista o valor da pecas mais cara e a mais barata.
-- Resposta:

SELECT 
	MAX(preco) AS peca_mais_cara,
	MIN(preco) AS peca_mais_barata
FROM tbl_peca;
------------------------------------------------------------------------------------
--listar a quantidade de peças cadastradas
-- Resposta:

SELECT COUNT(*) AS quantidade_de_pecas
FROM tbl_peca;
------------------------------------------------------------------------------------
--listar a quantidade de cidades diferentes onde existem peças cadastradas
-- Resposta:

SELECT COUNT(DISTINCT cidade) AS quantidade_de_cidades
FROM tbl_peca;

-- listar a media dos precos de todas as peças, com somente 1 digito após a virgula.
-- Resposta:
SELECT ROUND(AVG(preco), 1) AS media_precos
FROM tbl_peca;
