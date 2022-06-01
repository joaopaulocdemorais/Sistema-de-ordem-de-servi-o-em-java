show databases;

create database dbinfox;

use dbinfox;

create table tbusuarios(
	iduser int primary key,
    usuario varchar(50) not null,
    fone varchar(15),
    login varchar(15) not null unique,
    senha varchar(15) not null    
);

describe tbusuarios;
insert into tbusuarios(iduser, usuario, fone, login, senha) values (1, 'João Paulo', 62984733123, 'jp', 123);
insert into tbusuarios(iduser, usuario, fone, login, senha) values (2, 'Administrador', 62984733123, 'admin', 'admin');
insert into tbusuarios(iduser, usuario, fone, login, senha) values (3, 'teste', 62984733123, 'teste', 'teste');

update tbusuarios set fone= '8888888' where iduser = 2;

delete from tbusuarios where iduser = 3;

select * from tbusuarios;

create table tbclientes(
	idcli int primary key auto_increment,
    nomecli varchar(50) not null,
    endcli varchar(50),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli ) values ('João Paulo', 'Grupirara, Porangatu', '(62) 9 8473-3124', 'joaopaulomorais2@gmail.com');

select * from tbclientes;

create table tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
    defeito varchar(150) not null,
	servico varchar(150),
    tecnico varchar(30),
    valor decimal (10,2),
    idcli int not null,
    foreign key(idcli) references tbclientes(idcli)
);

describe tbos; 

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli) values('Pc Positivo','Marca','Trocar equipamento','João Paulo',1000.00,'1');

select * from tbos;

select
O.os, equipamento, defeito, servico, valor,
C.nomecli, fonecli
from tbos as O
inner join tbclientes as C 
on (O.idcli = C.idcli);

select * from tbusuarios where login ="jp" and senha =123;

describe tbusuarios;

select * from tbusuarios;

alter table tbusuarios add column perfil varchar(20) not null;

alter table tbusuarios drop column perfil;

update tbusuarios set perfil = 'user' where iduser = 2;

select * from tbusuarios where iduser = 4;

select idcli as ID, nomecli as NOME, endcli as ENDEREÇO, fonecli as FONE, emailcli as EMAIL from tbclientes;

describe tbos;

-- alinha abaixo alterna a tabela adicionando um campo em uma determidana posição 

alter table tbos add tipo varchar(15) not null after data_os;

alter table tbos add situacao varchar(20) not null after tipo;

select * from tbos;

describe tbos;
select os,date_format(data_os, '%d/%m/%Y - %H:%i'),tipo,situacao,equipamento,defeito,servico,valor,idcli from tbos where os=1;

select * from tbclientes;  

-- o sql a seguir seleciona e ordena por nome todos os clientes cadastrados

select * from tbclientes order by nomecli;

-- o bloco de sql a seguir faz a seleção e união de dados de duas tabelas 
-- OSER é uma variavel que comtém os campos desejados da tabelas OS
-- CLI é uma variavel que comtém os campos desejados da tabela Clientes
select
OSER.os, data_os, tipo, situacao, equipamento, valor,
CLI.nomecli, fonecli
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);