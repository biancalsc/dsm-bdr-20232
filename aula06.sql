CREATE DATABASE bd_aula06;
\c bd_aula06
CREATE DOMAIN chk_categoria text check (value='DRAMA' or value='COMEDIA');
CREATE DOMAIN chk_status text check (value='DISPONIVEL' or value='ALUGADO');
CREATE TABLE tbl_cliente (
  codigo_cliente integer PRIMARY KEY,
  nome text not null,
  cidade text,
  endereco text
);
CREATE TABLE tbl_titulo (
  codigo_titulo integer primary key,
  titulo text not null,
  descricao text,
  categoria chk_categoria
);
CREATE TABLE tbl_livros (
  cod_livro integer PRIMARY KEY,
  codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo),
  status chk_status DEFAULT 'DISPONIVEL'
);
CREATE TABLE tbl_emprestimo (
  numero_emprestimo integer PRIMARY KEY,
  codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente),
  codigo_livro integer REFERENCES tbl_livros(cod_livro)
);

INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES
    (1, 'Joao Silva', 'Sao Paulo', 'Rua A, 123'),
    (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
    (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');

INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES
    (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
    (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
    (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
    (4, 'Código Enigmatico', 'Segredos ocultos', 'COMEDIA'),
    (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');

INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
VALUES
    (1, 1, 'ALUGADO'),
    (2, 1, 'ALUGADO'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'ALUGADO'),
    (5, 4, 'ALUGADO');

INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5);

-- Liste os títulos e seus status, incluindo os que não têm status definido. (retorna 6 linhas)
-- Resposta:

SELECT tbl_titulo.titulo, tbl_livros.status
FROM tbl_titulo
LEFT JOIN tbl_livros ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo;
------------------------------------------------------------------------------------
-- Liste os títulos e suas descrições dos livros alugados (retorna 4 linhas)
-- Resposta:

SELECT tbl_titulo.titulo, tbl_titulo.descricao
FROM tbl_titulo
INNER JOIN tbl_livros ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo
WHERE tbl_livros.status LIKE 'ALUGADO';
------------------------------------------------------------------------------------
-- Liste os nomes dos clientes que não têm livros alugados (retorna 1 linha)
-- Resposta:

SELECT tbl_cliente.nome
FROM tbl_cliente
LEFT JOIN tbl_emprestimo ON tbl_cliente.codigo_cliente = tbl_emprestimo.codigo_cliente
WHERE numero_emprestimo is null;
------------------------------------------------------------------------------------
-- Liste os títulos e suas categorias dos livros disponiveis (retorna 1 linha)
-- Resposta:

SELECT tbl_titulo.titulo, tbl_titulo.categoria
FROM tbl_titulo
LEFT JOIN tbl_livros ON tbl_titulo.codigo_titulo = tbl_livros.codigo_titulo
WHERE tbl_livros.status like 'DISPONIVEL';
------------------------------------------------------------------------------------
-- Liste os nomes dos clientes e os títulos dos livros que eles têm alugados (retorna 5 linhas)
-- Resposta:

SELECT tbl_cliente.nome, tbl_titulo.titulo
FROM tbl_cliente
INNER JOIN tbl_emprestimo ON tbl_cliente.codigo_cliente = tbl_emprestimo.codigo_cliente
INNER JOIN tbl_livros ON tbl_emprestimo.codigo_livro = tbl_livros.cod_livro
INNER JOIN tbl_titulo ON tbl_livros.codigo_titulo = tbl_titulo.codigo_titulo
WHERE tbl_livros.status like 'ALUGADO';
------------------------------------------------------------------------------------
-- Liste o nome, titulo do livro e o status do emprestimo, do livro alugado pela Ana Oliveira (retorna 1 linha)
-- Resposta:

SELECT tbl_cliente.nome, tbl_titulo.titulo, tbl_livros.status
FROM tbl_cliente
INNER JOIN tbl_emprestimo ON tbl_cliente.codigo_cliente = tbl_emprestimo.codigo_cliente
INNER JOIN tbl_livros ON tbl_emprestimo.codigo_livro = tbl_livros.cod_livro
INNER JOIN tbl_titulo ON tbl_livros.codigo_titulo = tbl_titulo.codigo_titulo
WHERE tbl_cliente.nome like 'Ana Oliveira';
