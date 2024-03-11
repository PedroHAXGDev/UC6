-- Criando um banco de dados
create database Uber;
-- Usando o banco de dados criado
use Uber;
-- Criando uma tabela na Uber
create table  uber(
	cnpj char(14) int primary key,
	nome nchar(20),
	telefone numeric(11),
	email nchar(50),
	url_site nchar,
);

create table endereco(
	id_endereco_uber int primary key,
	pais nchar,
	estado nchar,
	cidade nchar,
	bairro nchar,
	rua nchar, 
	cnpj char(14),
	foreign key (cnpj) references uber(cnpj),

);

create table conta(
	id_registro int primary key,
	foto image,
	cnpj int,
	foreign key (cnpj) references uber(cnpj),
);

create table cash(
	id_cash int primary key,
	valor numeric,
	id_registro int,
	foreign key (id_registro) references conta(id_registro),
);

create table extrato(
	id_extrato int primary key,
	id_registro int,
	id_corrida int,
	foreign key (id_corrida) references corrida
	foreign key (id_registro) references conta(id_registro),
);

create table cliente(
	id_cliente int primary key,
	nome nchar(50),
	cpf char(11),
	numero char(13),
	email nchar (50),
	genero nchar (20),
	data_nascimento date,
);

create table motorista(
	id_motorista int primary key,
	nome nchar(50),
	cpf char(11),
	numero char(13),
	email nchar(50),
	cnh char(9),
	data_nascimento date,

);

create table corrida(
	id_motorista int,
	id_cliente int,
	id_corrida int primary key,
	preco numeric,
	endereco_inr(50),
	foeign key (id_motorista) references motorista(id_motorista),
	foreign key (id_cliente) references cliente(id_cliente)
);