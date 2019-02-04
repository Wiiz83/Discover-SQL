CREATE TABLE ARTICLE
(ART_NUM char(8) not null,
FRS_NUM char(8) not null,
ART_NOM char(25),
ART_PV float(4),
CONSTRAINT ART_NUM_PK2 primary key(ART_NUM)
);

CREATE TABLE CLIENT
(CLT_NUM char(8) not null,
CLT_NOM char(25) not null,
CLT_PRENOM char(20) not null,
CONSTRAINT CLT_NUM_PK primary key(CLT_NUM)
);

CREATE TABLE COMMANDE
(CMD_NUM char(8) not null,
CLT_NUM char(8) not null,
MAG_NUM char(8) not null,
CMD_DATE date not null,
CONSTRAINT CMD_NUM_PK primary key(CMD_NUM)
);

CREATE TABLE FOURNISSEUR
(FRS_NUM char(8) not null,
FRS_NOM char(25),
CONSTRAINT FRS_NUM_PK primary key(FRS_NUM)
);

CREATE TABLE LIG_CMD
(ART_NUM char(8) not null,
CMD_NUM char(8) not null,
LCD_QTE number(4,0),
LCD_PU float(4),
CONSTRAINT ART_NUM_PK primary key(ART_NUM, CMD_NUM)
);

CREATE TABLE MAGASIN
(MAG_NUM char(8) not null,
MAG_LOC char(25) not null,
CONSTRAINT MAG_NUM_PK primary key(MAG_NUM)
);


INSERT INTO ARTICLE
(ART_NUM, FRS_NUM, ART_NOM, ART_PV)
VALUES
('A01', 'FRS01', 'CRAYON', 10);

DELETE FROM ARTICLE;

ALTER TABLE ARTICLE 
ADD CONSTRAINT FRS_NUM_FK foreign key (FRS_NUM)
References FOURNISSEUR (FRS_NUM);

insert into fournisseur (FRS_NUM, FRS_NOM) 
SELECT FRS_NUM, FRS_NOM 
FROM profs.fournisseur;

insert into article (ART_NUM, ART_NOM, ART_PV, FRS_NUM) 
SELECT ART_NUM, ART_NOM, ART_PV, ART_FRS 
FROM profs.article;

insert into client (CLT_NUM, CLT_NOM, CLT_PRENOM) 
SELECT CLT_NUM, CLT_NOM, CLT_PRENOM 
FROM profs.client;

insert into magasin (MAG_NUM, MAG_LOC) 
SELECT MAG_NUM, MAG_LOC 
FROM profs.magasin;

insert into commande (CMD_NUM, CLT_NUM, MAG_NUM, CMD_DATE) 
SELECT CMD_NUM, CMD_CLT, CMD_MAG, CMD_DATE
FROM profs.commande;

insert into LIG_CMD (ART_NUM, CMD_NUM, LCD_QTE, LCD_PU)
SELECT LCD_ART, LCD_CMD, LCD_QTE, LCD_PU
FROM profs.LIG_CMD;

CREATE VIEW ARTICLE_VIEW AS
select min(art_pv) 
as min, avg(art_pv) asmoy, 
max(art_pv) 
as max from article;

DROP TABLE ARTICLE;

DROP TABLE CLIENT;

DROP TABLE COMMANDE;

DROP TABLE FOURNISSEUR;

DROP TABLE LIG_CMD;

DROP TABLE MAGASIN;
