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

