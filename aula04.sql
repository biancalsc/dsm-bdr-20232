create database bd_aula04;
\c bd_aula04
create domain chk_categoria text check (
  value='DRAMA' or value='COMEDIA'
);
create domain chk_status text check (
  value='DISPONIVEL' or value='ALUGADO'
);
create table tbl_cliente (
  codigo_cliente integer PRIMARY KEY,
  nome text not null,
  cidade text,
  endereco text
);
create table tbl_titulo (
  codigo_titulo integer primary key,
  titulo text not null,
  descricao text,
  categoria chk_categoria
);
create table tbl_livros (
  cod_livro integer PRIMARY KEY,
  codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo),
  status chk_status DEFAULT 'DISPONIVEL'
);
create table tbl_emprestimo (
  numero_emprestimo integer PRIMARY KEY,
  codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente),
  codigo_livro integer REFERENCES tbl_livros(cod_livro)
);

INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES
    (1, 'João Silva', 'São Paulo', 'Rua A, 123'),
    (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
    (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');

INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES
    (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
    (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
    (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
    (4, 'Código Enigmático', 'Segredos ocultos', 'COMEDIA'),
    (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');

INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
VALUES
    (1, 1, 'DISPONIVEL'),
    (2, 1, 'ALUGADO'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'ALUGADO'),
    (5, 4, 'DISPONIVEL');

INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5),
    (5, 5, 3);

select * from tbl_cliente;

select * from tbl_cliente where cidade = 'São Paulo';

select * from tbl_cliente where codigo_cliente > 3;

select * from tbl_titulo;

CREATE table tbl_cliente2 (codigo integer);
insert into tbl_cliente2 select codigo_cliente from tbl_cliente;

UPDATE tbl_livros SET status = 'DISPONIVEL' where status = 'ALUGADO';

DELETE FROM tbl_cliente2 where codigo > 3;



