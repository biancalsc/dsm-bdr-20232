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

SELECT tbl_fornecedor.nome, tbl_peca.nome
FROM tbl_fornecedor
INNER JOIN tbl_peca ON tbl_fornecedor.cidade = tbl_peca.cidade;
------------------------------------------------------------------------------------
--listar as cidades onde existem fornecedores (sem valores duplicados)
-- Resposta:

SELECT DISTINCT (tbl_fornecedor.cidade)
FROM tbl_fornecedor;
------------------------------------------------------------------------------------
--Listar o nome e a cor das peças do fornecedor com código 3, ordenado pelo nome da peça
-- Resposta:

------------------------------------------------------------------------------------
--Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1. 
-- Resposta:

------------------------------------------------------------------------------------
--Listar a quantidade total de peças com código 1, fornecidas pelos fornecedores.
-- Resposta:

------------------------------------------------------------------------------------
--Listar a média dos preços das peças fornecidas pelo fornecedor com código 3.
-- Resposta:

------------------------------------------------------------------------------------
--lista o valor da pecas mais cara e a mais barata.
-- Resposta:

------------------------------------------------------------------------------------
--listar a quantidade de peças cadastradas
-- Resposta:

------------------------------------------------------------------------------------
--listar a quantidade de cidades diferentes onde existem peças cadastradas
-- Resposta:
