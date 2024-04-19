-- Comando para criar  um novo banco de dados --
CREATE DATABASE casaoliveira;
-- comando para selecionar o banco de dados criado
USE casaoliveira;


-- Comando para criaçao de tabelas
CREATE TABLE usuario(
idusuario int auto_increment primary KEY,
nomeusuario varchar(50) not null unique,
senha varchar(255) not null,
criadoem datetime default current_timestamp(),
foto varchar(250) not null
);

CREATE TABLE  funcionario(
idfuncionario int auto_increment primary key,
nomefuncionario varchar(50) not null,
cpf varchar(13) not null unique,
idcargo int not null,
expediente varchar (50) not null,
idusuario int not null,
idendereco int not null,
idcontato int not null

); 



CREATE TABLE cargo(
idcargo int auto_increment primary key,
titulocargo varchar(30) not null unique,
salaraio decimal(7,2) not null,
departamento varchar(30) not null unique
); 


CREATE TABLE contato( 
idcontato int auto_increment primary key ,
telefoneresidencial varchar(15) not null,
teleonecelular varchar(15) not null unique ,
email varchar (100) not null unique
);


CREATE TABLE endereço( 
idendereco int auto_increment primary key,
tipologradouro enum( "Rua","Avenida","Travessia","Estrada","Viela","Praça" ,"Alameda"),
logradouro varchar(50) not null,
numero varchar(10) not null,
complemento varchar (30),
bairro varchar(30) not null,
cep varchar(10) not null,
cidade varchar (30) not null,
estado varchar(20) not null 
);

CREATE TABLE fornecedor(
idfornecedor int auto_increment primary key,
razaosocial  varchar (50) not null unique,
nomefantasia varchar (50) not null,
cnpj varchar (15) not null unique,
idcontato int not null,
idendereco int not null
);

CREATE TABLE produto(
idproduto int auto_increment primary key,
nomeproduto varchar(50) not null unique,
categoria enum("Frios","Limpeza","Laticinios","Cereais","Açougue","Bebidas","Pães","Hortifruti"),
descricao text not null,
idfornecedor int not null,
preco decimal(6,2) not null
); 

CREATE TABLE lote(
idlote int auto_increment primary key,
datadefabricacao date not null,
datadevalidade date not null,
idproduto int not null
);

CREATE TABLE estoque(
idestoque int auto_increment primary key,
idlote int not null,
quantidade int not null,
dataestoque datetime default current_timestamp()
);


CREATE TABLE cliente(
idcliente int auto_increment primary key,
nomecliente varchar (50) not null,
cpf varchar (13) not null unique,
datanascimento date not null,
idcontato  int not null,
idendereco int not null
);


CREATE TABLE venda(
idvenda int auto_increment primary key,
idcliente int not null,
idfuncionario int not null,
datahora datetime not null,
total decimal(7,2) not null
);

CREATE TABLE detalheVenda(
iddetalhevenda int auto_increment primary key,
idvenda int not null,
idproduto int not null,
subtotal decimal(7,2) not null
);

CREATE TABLE pagamento(
idpagamento int auto_increment primary key,
idvenda int not null,
formadepagamento enum("Dinheiro","Credito","Debito","Pix"),
observacao text not null
);

 drop database casaoliveira; 






-- alterar a tabela funcionario para add uma chave estrangeira e um relacionamento com a tabela de usuario
ALTER TABLE funcionario
ADD CONSTRAINT `fk func_pk.usuario`
foreign key funcionario(`idusuario`)
references usuario(`idusuario`);