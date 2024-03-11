-- Criando um banco de dados
create database Uber;
-- Usando o banco de dados criado
use Uber;
-- Criando uma tabela na Uber
create table Cliente(
	nome nchar(50),
	cpf char(11) primary key,
	numero char(13),
	email nchar (50),
	genero nchar (20),
	data_nascimento date,
);

create table Motorista(
	nome nchar(50),
	cpf char(11) primary key,
	numero char(13),
	email nchar(50),
	cnh char(9),
	data_nascimento date,

);