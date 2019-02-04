CREATE VIEW NOM_FOURNISSEUR
AS SELECT FRS_NOM
FROM PROFS.fournisseur;

DROP VIEW NOM_FOURNISSEUR;
DROP VIEW LOCALITE_CLIENT;

SELECT FRS_NOM
FROM FOURNISSEUR;

SELECT DISTINCT CLT_LOC
FROM PROFS.CLIENT;

SELECT CLT_NOM, CLT_PRENOM, CLT_PAYS
FROM PROFS.CLIENT
WHERE CLT_LOC = 'PARIS';

SELECT avg(ART_POIDS) as POIDS_MOY
FROM PROFS.ARTICLE;

SELECT MAX(ART_PV) as PRIX_MAX
FROM PROFS.ARTICLE;

SELECT ART_NUM, ART_NOM, ART_COUL
FROM PROFS.ARTICLE
WHERE ART_COUL = 'ROUGE'
OR ART_COUL = 'VERT';

SELECT ART_NUM, ART_NOM, ART_COUL
FROM PROFS.ARTICLE
WHERE ART_COUL = 'ROUGE' and ART_POIDS>100
OR ART_COUL = 'VERT';

SELECT CLT_NUM, CLT_NOM, CLT_PRENOM
FROM PROFS.CLIENT
WHERE CLT_NOM like 'J%';

SELECT ART_NUM, ART_NOM, ART_POIDS, ART_PA
FROM PROFS.ARTICLE
WHERE ART_POIDS <= 100
ORDER BY ART_POIDS asc, art_pa desc ;

SELECT ART_NUM, ART_NOM, ART_PA, ART_PV, art_pv - art_pa as MARGE
from profs.article
WHERE ART_PA>100
ORDER BY MARGE asc;

SELECT avg(ART_PV) as PVMOYEN, MAX(ART_PV-ART_PA) as MARGEMAX, MAX(ART_PV)-MAX(ART_PA) as DPMAX
FROM PROFS.ARTICLE
WHERE ART_COUL is not null;

SELECT ART_NOM, ART_COUL, ART_POIDS, FRS_NOM
FROM PROFS.ARTICLE, PROFS.FOURNISSEUR
WHERE ART_FRS=FRS_NUM
AND ART_COUL='ROUGE';

SELECT distinct CLT_NOM
FROM PROFS.CLIENT, profs.commande, profs.lig_cmd
WHERE clt_num = cmd_clt and
cmd_num = lcd_cmd and
lcd_art = 'A02';


select clt_nom
from profs.client
where clt_num IN(select cmd_clt
                 from profs.commande
                 where cmd_num IN (select lcd_cmd
                                   from  profs.lig_cmd
                                   where lcd_art = 'A02'));
                                   
                                   
SELECT distinct frs_nom
from profs.fournisseur, profs.article, profs.lig_cmd, profs.commande, profs.client
where frs_num = art_frs
and art_num = lcd_art
and lcd_cmd = cmd_num
and cmd_clt = clt_num
and clt_num = 'C01';

select sum(LCD_QTE * ART_POIDS) as MASSE
from profs.article, profs.lig_cmd, profs.commande, profs.client
where art_num = lcd_art
and lcd_cmd = cmd_num
and cmd_clt = clt_num
and clt_pays = 'F'
and art_coul = 'ROUGE';

select clt_nom
from profs.commande, profs.client, profs.magasin
where cmd_clt = clt_num
and cmd_mag = mag_num
and mag_loc != 'PARIS'
and clt_loc = mag_loc;


select avg(ART_PV) as PV_MOYEN, ART_COUL
FROM PROFS.ARTICLE 
GROUP BY ART_COUL;

SELECT art_num, art_pv, art_stock
from profs.article, profs.