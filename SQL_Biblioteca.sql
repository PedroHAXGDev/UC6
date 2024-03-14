create database biblioteca;

use biblioteca;

create table cliente(
	cod_cliente int primary key,
	nome nvarchar (50),
	email nvarchar (50),
	telefone_1 varchar (20),
	telefone_2 varchar (20),
	rua nvarchar (30),
	bairro nvarchar (30),
	cidade nvarchar (30),
	estado nvarchar (30)
);

insert into cliente(
	cod_cliente, nome, email, telefone_1, telefone_2, rua, bairro, cidade, estado
)
values
(1,'Gil Bala','gilbalinha@gmail.com','84980028922','84999232352','Rua do Limoeiro','Nossa Senhora da Apresentação','Natal','Rio Grande do Norte'),
(2,'Wendell Lagartixa','lagartixa@gmail.com','84984374627','84911435785','Av. Maranguape','Panatis','Natal','Rio Grande do Norte');

create table pessoa_fisica(
	cod_cliente int,
	rg nvarchar (9),
	cpf nchar (11),
	foreign key (cod_cliente) references cliente(cod_cliente)
);
insert into pessoa_fisica(
	cod_cliente, rg, cpf
)
values 
(1,'123456789','32112345668');

create table pessoa_juridica(
	cod_cliente int,
	cnpj nchar (14),
	ie nvarchar (12),
	foreign key (cod_cliente) references cliente(cod_cliente)
);
insert into pessoa_juridica(
	cod_cliente, cnpj, ie
)
values
(2,'12345678911234','123456789112');

create table editora(
	cod_editora int primary key,
	telefone_1 varchar (20),
	telefone_2 varchar (20),
	nome_contato nvarchar (50),
	email nvarchar (50)
);
insert into editora(
	cod_editora, telefone_1, telefone_2, nome_contato, email
)
values
(1,'84975327690','84988731354','Capa Sobre Folha','capasobrefolha@gmail.com'),
(2,'84927652932','84948257325','Leitura','leiturasac@gmail.com');

create table livro(
	cod_livro int primary key,
	cod_editora int,
	valor numeric,
	ano_publicacao date,
	categoria nvarchar (50),
	titulo nvarchar (30),
	autor nvarchar (20),
	foreign key (cod_editora) references editora(cod_editora)
);
insert into livro(
	cod_livro, cod_editora, valor, ano_publicacao, categoria, titulo, autor
)
values
(1,1,69.90,'2007/6/13','romance, drama','Amores da Vida','Annie Frech'),
(2,2,29.90,'2011/11/3','ficção, comédia, ação','Resenhas & Resenhas','Nego do Borel');

create table estoque(
	cod_editora int,
	cod_livro int,
	qtde_estoque int,
	foreign key (cod_editora) references editora(cod_editora),
	foreign key (cod_livro) references livro(cod_livro)
);
insert into estoque(
	cod_editora, cod_livro, qtde_estoque
)
values
(1,1,50),
(2,2,75);

create table pedido(
	cod_pedido int primary key,
	cod_cliente int,
	data_pedido date,
	valor_pedido numeric,
	foreign key (cod_cliente) references cliente(cod_cliente)
);
insert into pedido(
	cod_pedido, cod_cliente, data_pedido, valor_pedido
)
values
(1,1,'2023/12/4',69.90),
(2,2,'2024/3/10',29.90);

create table item_pedido(
	cod_pedido int,
	cod_livro int,
	qtde_pedido int,
	valor_item numeric,
	foreign key (cod_pedido) references pedido(cod_pedido),
	foreign key (cod_livro) references livro(cod_livro)
);
insert into item_pedido(
	cod_pedido, cod_livro, qtde_pedido, valor_item
)
values
(1,1,1,69.90),
(2,2,2,29.90);

select * from cliente
select * from pessoa_fisica
select * from pessoa_juridica
select * from editora
select * from livro
select * from estoque
select * from pedido
select * from item_pedido
