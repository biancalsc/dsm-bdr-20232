create database bd_aula03;

\l;

\c bd_aula03;

create table tbl_cliente (
	codigo_cliente integer primary key,
	nome varchar(50) not null,
	cidade varchar(50),
	endereco varchar (50)
);

create table tbl_titulo (
	codigo_titulo integer primary key,
	titulo varchar (10) not null,
	descricao varchar (20),
	categoria varchar (10)
);

create table tbl_livros (
	cod_livro integer primary key,
	codigo_titulo integer,
	status varchar (10)
);

create table tbl_emprestimo (
	numero_emprestimo integer primary key,
	codigo_cliente integer,
	codigo_livro integer
);

CREATE DOMAIN chk_status text check (value='disponivel' OR value='alugado');

CREATE DOMAIN chk_categoria text check (value='drama' OR value='comedia');

ALTER TABLE tbl_titulo ALTER COLUMN categoria SET DATA TYPE chk_categoria;

ALTER TABLE tbl_livros ALTER COLUMN status SET DATA TYPE chk_status;
