CREATE table `Избранные резюме`(`ID` int PRIMARY KEY, `iD организации` int, `ID резюме` int);
CREATE table `резюме`(`ID резюме` int PRIMARY KEY, `iD пользователя` int, `профессия` int,`Пол`varchar(15),`Дата рождения`date,`Город проживания`int,`образование`varchar(100),`Желаемая З/П` DECIMAL (11.2), `О себе` varchar(255));
CREATE table `Город` (`ID города` int  PRIMARY KEY,`Название города` varchar(100));
CREATE table `Организация` (`ID организации` int PRimary KEY,`Название` varchar(100), `Город` int,`Информация` varchar(255), `Телефон` varchar(11), `E-mail` varchar(100));
CREATE table `Пользователь` (`ID пользователя` int PRimary KEY,`Фамилия` varchar(100),`Имя` varchar(100),`Отчество` varchar(100), `Телефон` varchar(11), `E-mail` varchar(100),`город проживания` int, `Дата рождения`date,`Пол` VArchar(20));
CREATE table `Вакансия` (`ID вакансии` int PRimary KEY,`Название вакансии` varchar(100),`Профессия` int,`Заработная плата`decimal (11.2), `Город` int,`Организация`int,`Описание`varchar(255),`Требования`varchar(255), `Телефон` varchar(11), `E-mail` varchar(100));
CREATE table `Избранные вакансии` (`ID` int PRIMARY KEY,`ID пользователя` int,`Вакансия` int);
CREATE table `Список профессий` (`ID профессии` int PRIMARY KEY,`Название` varchar(100));


ALTER TABLE `список профессий` ADD INDEX( `ID профессии`);
ALTER TABLE `избранные резюме` ADD INDEX( `iD организации`, `ID резюме`);
ALTER TABLE `резюме` ADD INDEX( `профессия`, `Город проживания`);
ALTER TABLE `Организация` ADD INDEX(`Город`);
ALTER TABLE `вакансия` ADD INDEX( `Профессия`, `Город`, `Организация`);
ALTER TABLE `пользователь` ADD INDEX( `город проживания`);
ALTER TABLE `избранные вакансии` ADD INDEX( `ID пользователя`, `Вакансия`);



ALTER TABLE `избранные вакансии` ADD FOREIGN KEY (`ID пользователя`) REFERENCES `пользователь`(`ID пользователя`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `избранные вакансии` ADD FOREIGN KEY (`Вакансия`) REFERENCES `вакансия`(`ID вакансии`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `вакансия` ADD FOREIGN KEY (`Профессия`) REFERENCES `список профессий`(`ID профессии`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `вакансия` ADD FOREIGN KEY (`Город`) REFERENCES `город`(`ID города`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `вакансия` ADD FOREIGN KEY (`Организация`) REFERENCES `организация`(`ID организации`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `резюме` ADD FOREIGN KEY (`профессия`) REFERENCES `список профессий`(`ID профессии`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `резюме` ADD FOREIGN KEY (`Город проживания`) REFERENCES `город`(`ID города`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `резюме` ADD FOREIGN KEY (`iD пользователя`) REFERENCES `пользователь`(`ID пользователя`) ON DELETE RESTRICT ON UPDATE RESTRICT;ALTER TABLE `избранные резюме` ADD FOREIGN KEY (`iD организации`) REFERENCES `организация`(`ID организации`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `избранные резюме` ADD FOREIGN KEY (`ID резюме`) REFERENCES `резюме`(`ID резюме`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `организация` ADD FOREIGN KEY (`Город`) REFERENCES `город`(`ID города`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `пользователь` ADD FOREIGN KEY (`город проживания`) REFERENCES `город`(`ID города`) ON DELETE RESTRICT ON UPDATE RESTRICT;