create database bd_aula03;

\l;

\c bd_aula03;

create table tbl_cliente (
	codigo_cliente integer primary key,
	nome varchar(50) not null,
	cidade varchar(50),
	endereco varchar(50)
);
create domain chk_categoria varchar(7) check (value='drama' or value='comedia');

create table tbl_titulo (
	codigo_titulo integer primary key,
	titulo varchar(10) not null,
	descricao varchar(20),
	categoria chk_categoria
);
create table tbl_emprestimo (
	numero_emprestimo integer primary key
);
create domain chk_status varchar(11) check (value='disponivel' or value='alugado');

create table tbl_livros (
	cod_livro integer primary key,
	status chk_status
);

alter table tbl_emprestimo add column codigo_cliente integer references tbl_cliente (codigo_cliente);
alter table tbl_emprestimo add column codigo_livro integer references tbl_livros (cod_livro);
alter table tbl_livros add column codigo_titulo integer references tbl_titulo (codigo_titulo);
