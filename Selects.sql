select * from `резюме` where `профессия` = 1 ;
select * from `резюме` where `профессия` = 2 ;
SELECT * from `вакансия` where `профессия` = 1;
SELECT * FROM `вакансия` WHERE `город`= 1;
SELECT * FROM `организация` WHERE `город` = 1;
select * FROM `вакансия` where `профессия` = 1 or `профессия` = 2 and `заработная плата` < 25000.00;
select * FROM `вакансия` where `профессия` = 1 and `заработная плата` > 15000.00;
