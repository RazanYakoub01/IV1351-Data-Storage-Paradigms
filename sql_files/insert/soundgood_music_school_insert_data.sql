BEGIN; -- Start of the transaction

INSERT INTO school_rules (rule_id,rule_description,rule_value,valid_start,valid_end)
VALUES
  (1,'Rule: Maximum renting period for an instrument',12,'2023-09-21',NULL),
  (2,'Rule: Student_contact person.',1,'2023-11-29',NULL),
  (3,'Rule: Maximum number of instruments allowed for rental',2,'2024-04-30',NULL);

INSERT INTO soundgood_music_school DEFAULT VALUES;
INSERT INTO soundgood_music_school DEFAULT VALUES;
INSERT INTO soundgood_music_school DEFAULT VALUES;

INSERT INTO adminstrative_staff DEFAULT VALUES;
INSERT INTO adminstrative_staff DEFAULT VALUES;
INSERT INTO adminstrative_staff DEFAULT VALUES;
INSERT INTO adminstrative_staff DEFAULT VALUES;
INSERT INTO adminstrative_staff DEFAULT VALUES;
INSERT INTO adminstrative_staff DEFAULT VALUES;


INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Nomlanga','Battle',196653003961,'2006-12-02'),
  ('Yen','Maldonado',198580580331,'1980-11-18'),
  ('Shad','Holman',191698234730,'2016-08-28'),
  ('Baker','Walsh',191925340739,'2016-09-14'),
  ('Rogan','Hodge',199238975213,'1978-05-26'),
  ('Samson','Santos',193004242428,'1990-07-03'),
  ('Erich','Horton',190945327139,'1998-11-30'),
  ('Minerva','Glass',200159623454,'1983-04-19'),
  ('Keith','Macias',193590169668,'2009-12-05'),
  ('Mechelle','Travis',198442969025,'1981-11-19');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Hall','Vincent',190125567404,'1983-10-01'),
  ('Lionel','Flynn',192018811630,'1997-03-30'),
  ('Zephania','Solomon',197503758723,'2015-03-02'),
  ('Chantale','Blevins',190585619253,'1992-10-23'),
  ('TaShya','Reed',192490372561,'1996-03-15'),
  ('Carl','Cote',194660506752,'1968-02-28'),
  ('Basil','Trujillo',200226780245,'1985-01-13'),
  ('Slade','Macias',194708838745,'1969-02-14'),
  ('Dorothy','Guerra',201629399215,'1978-02-03'),
  ('Rina','Phillips',195609825021,'1984-04-11');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Chava','Morrison',193610301629,'2010-10-11'),
  ('Veda','Calhoun',190217556823,'1987-07-07'),
  ('Gabriel','Aguilar',197156672692,'2005-03-13'),
  ('Yasir','Riddle',196266405726,'1980-09-02'),
  ('Sonia','Kerr',200609911915,'1983-06-06'),
  ('Chava','Bryant',191286671381,'1979-12-25'),
  ('Nero','Cash',197502289317,'2003-06-26'),
  ('Forrest','Hood',192856933874,'1967-02-07'),
  ('May','Burton',197281791253,'1987-10-31'),
  ('Quemby','Holden',196626208068,'1990-06-24');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Bevis','Small',201656127833,'1992-12-19'),
  ('Gemma','Wilder',200475517749,'2013-04-02'),
  ('Ori','Ramos',198225837994,'2005-12-04'),
  ('Porter','Reilly',193566881992,'1969-05-08'),
  ('Curran','Morin',198836235582,'1977-02-21'),
  ('Bevis','Woods',200568624596,'1969-11-10'),
  ('Jolie','Roberson',195503923166,'1974-06-10'),
  ('Todd','West',201563427046,'2007-10-09'),
  ('Valentine','Huber',198357599059,'2011-09-23'),
  ('Brielle','Jacobs',199295361295,'1985-02-03');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Regan','Rivers',192620386980,'2015-05-26'),
  ('Jeremy','Carroll',201480807334,'1976-02-19'),
  ('Kirk','Hatfield',201468961550,'1994-01-13'),
  ('Hedwig','Erickson',195604567244,'2016-10-08'),
  ('Madison','Pitts',195453877878,'1975-08-22'),
  ('Ciaran','Chaney',193099149118,'2001-09-01'),
  ('Cally','Puckett',194830963589,'2014-08-08'),
  ('Sybill','Blankenship',190258178893,'2006-11-13'),
  ('Raven','Beasley',192420402981,'1977-07-23'),
  ('Zenaida','Kelly',199083530381,'2003-11-06');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Jesse','Farley',198400493033,'1998-04-29'),
  ('Latifah','Pierce',197641912203,'2019-01-02'),
  ('Dante','Ingram',194068220535,'2012-12-29'),
  ('Quinlan','Hensley',190600753269,'2013-06-07'),
  ('Bo','Griffin',191966932468,'1972-11-05'),
  ('Selma','Cummings',190606178040,'1983-08-25'),
  ('Neil','Rollins',194494101257,'2020-08-14'),
  ('Moses','Schroeder',201045283395,'2010-08-03'),
  ('Bell','Duke',196326548859,'1998-02-27'),
  ('Kenneth','Whitfield',200547101805,'1987-04-24');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Demetrius','Shepherd',196051083424,'2008-07-21'),
  ('Aidan','Mcleod',196141507464,'1994-11-20'),
  ('Cailin','Goodman',201106319332,'1995-03-19'),
  ('Jenette','Gay',192872185692,'1976-05-15'),
  ('Elvis','Dean',200327697137,'1982-10-28'),
  ('Evelyn','Gillespie',197434802527,'2006-08-17'),
  ('Maggy','Bender',195859152188,'1980-05-01'),
  ('Briar','Horton',199147812075,'2016-01-30'),
  ('Barrett','Ellison',196947828538,'1970-10-28'),
  ('Burton','Rogers',190661474725,'1990-09-26');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Bryar','Luna',192524421722,'1972-10-31'),
  ('Phelan','Dalton',199718761857,'2001-06-24'),
  ('Salvador','Cleveland',198951737786,'1969-12-23'),
  ('Maya','Crane',192667685441,'1998-08-29'),
  ('Maris','Huff',194210186778,'2016-06-15'),
  ('Ignacia','Barnes',192399596196,'2007-10-20'),
  ('Kiayada','Franco',197118196472,'2020-06-15'),
  ('Dean','Pugh',199320147586,'2019-08-24'),
  ('Martena','Goodwin',193575005695,'2017-05-10'),
  ('Amaya','Brewer',191450160380,'2001-01-06');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Baxter','Little',191455040889,'2004-12-09'),
  ('Berk','Gordon',192455777944,'2020-08-29'),
  ('Patrick','Contreras',194666613509,'1999-12-16'),
  ('Barry','Molina',201016193969,'2012-07-25'),
  ('Tatum','Brock',197446467524,'2013-10-04'),
  ('Whilemina','Hammond',199104289606,'1991-11-15'),
  ('Gray','Valdez',199926636065,'1990-07-17'),
  ('Sage','Fletcher',201536734446,'1978-03-03'),
  ('Maia','Moody',198666339799,'1977-09-07'),
  ('Darrel','Washington',194166072969,'2014-02-21');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Darryl','Pate',192030526344,'2020-05-21'),
  ('Zena','Lindsey',199389370538,'1992-02-02'),
  ('Lawrence','Hickman',197578555480,'2005-02-26'),
  ('Rajah','Guy',198898924106,'2004-05-19'),
  ('Amela','Davidson',190953543232,'2011-02-22'),
  ('Bianca','Schroeder',196355548162,'1989-12-10'),
  ('Martha','Conner',196227338443,'1985-12-24'),
  ('Ariel','Terrell',192759521329,'1985-03-15'),
  ('Lois','Dunlap',197577289281,'1993-04-03'),
  ('Mary','Snyder',198156576455,'1967-05-13');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Summer','Garza',195137841859,'2022-11-21'),
  ('Erich','Reese',201269656135,'2022-11-21'),
  ('Rafael','Browning',194130388412,'2022-11-21'),
  ('Wang','Cole',201917389875,'2022-11-21'),
  ('Jennifer','Oneal',191989723513,'2022-11-21'),
  ('Ursa','Burch',192278396931,'2022-11-21'),
  ('Jakeem','Church',190689685459,'2022-11-21'),
  ('Chaney','Martin',196002624621,'2022-11-21'),
  ('Jolene','Henry',200421817278,'2022-11-21'),
  ('Gil','Schwartz',190088284551,'2022-11-21');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Noelle','Caldwell',196038713035,'2022-11-21'),
  ('Charissa','Rocha',198556782080,'2022-11-21'),
  ('Wyoming','Rosario',190653645372,'2022-11-21'),
  ('Elizabeth','Valentine',195360367945,'2022-11-21'),
  ('Lacey','Hernandez',192730057152,'2022-11-21'),
  ('Lucius','Mendez',190997563406,'2022-11-21'),
  ('Keelie','Campos',199285628669,'2022-11-21'),
  ('Farrah','Diaz',190731481832,'2022-11-21'),
  ('Brennan','Patrick',190597017913,'2022-11-21'),
  ('Hadley','Buckner',197632281732,'2022-11-21');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Ishmael','Taylor',197454338350,'2022-11-21'),
  ('Macy','Hale',201521331952,'2022-11-21'),
  ('Evan','Gay',196228481193,'2022-11-21'),
  ('Clio','Norton',198818572237,'2022-11-21'),
  ('Mercedes','Meyer',194929450016,'2022-11-21'),
  ('Roth','Fitzgerald',201655796306,'2022-11-21'),
  ('Iona','Herrera',201693464866,'2022-11-21'),
  ('Ivy','Lowery',195595715233,'2022-11-21'),
  ('Tate','Harris',194117162014,'2022-11-21'),
  ('Sade','Barber',197034973211,'2022-11-21');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Galena','Alston',196752634029,'2022-11-21'),
  ('Mollie','Serrano',199245180744,'2022-11-21'),
  ('Nora','Mitchell',196014804125,'2022-11-21'),
  ('Zachary','Dominguez',190653028893,'2022-11-21'),
  ('Honorato','Gallegos',190423432138,'2022-11-21'),
  ('Ryan','Gallegos',197955640331,'2022-11-21'),
  ('Amanda','Benjamin',200117361736,'2022-11-21'),
  ('Dorothy','Shannon',193188191264,'2022-11-21'),
  ('McKenzie','Dunn',195835765747,'2022-11-21'),
  ('Amela','Robles',194589407468,'2022-11-21');
INSERT INTO person (first_name,last_name,personal_number,birthdate)
VALUES
  ('Kerry','Case',195929958420,'2022-11-21'),
  ('Emerald','Bernard',198778358900,'2022-11-21'),
  ('Lynn','Vargas',195740853904,'2022-11-21'),
  ('Jaime','Flynn',194245796120,'2022-11-21'),
  ('Calvin','Stevens',200217677078,'2022-11-21'),
  ('Phelan','Sandoval',199673572495,'2022-11-21'),
  ('Elaine','Mack',199414413270,'2022-11-21'),
  ('Kirk','Bradshaw',201099869130,'2022-11-21'),
  ('Andrew','Cantrell',197106016685,'2022-11-21'),
  ('Nathaniel','Osborn',190344357707,'2022-11-21');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('472-495 Donec Av.','69080','Bacoor'),
  ('255-7970 Rutrum Av.','55839','Dublin'),
  ('P.O. Box 913, 5686 Risus. Avenue','23416','Heilongjiang'),
  ('713-504 Penatibus Street','80754','Galway'),
  ('8501 Facilisis Street','29756','Dutse'),
  ('643-6759 Sodales Rd.','79765','North Battleford'),
  ('9452 Et, Road','34536','Kuruman'),
  ('9469 Eget Avenue','64017','Tân An'),
  ('396-3367 In, Road','86385','Squillace'),
  ('P.O. Box 321, 4039 Amet St.','85654','Port Blair');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('P.O. Box 440, 3577 Turpis. Rd.','68858','Río Verde'),
  ('785-2723 Tempus Ave','27577','Thames'),
  ('1805 Euismod Street','03368','İslahiye'),
  ('268-6763 Ut, Av.','32891','Ilhéus'),
  ('Ap #759-9061 Facilisis Rd.','83602','St. Johann in Tirol'),
  ('741-8696 Ut Street','93551','Nus'),
  ('Ap #558-7154 Duis St.','63142','Courcelles'),
  ('Ap #644-4391 Fermentum St.','82548','Warszawa'),
  ('475-4474 Erat. St.','44364','Zaanstad'),
  ('833-9356 Donec Street','38800','Poltava');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('Ap #809-8836 Ipsum Av.','31081','Corozal'),
  ('883-2492 Viverra. Ave','52292','Chepén'),
  ('Ap #286-6035 Accumsan Street','75698','Hall in Tirol'),
  ('151-6815 Magna. Rd.','65435','Perpignan'),
  ('3783 Vel, Road','78225','Arequipa'),
  ('Ap #811-5467 Quam St.','72655','Palu'),
  ('226-8947 Magna Road','46849','Guizhou'),
  ('Ap #951-9624 Sed Ave','32587','Opole'),
  ('Ap #579-7939 Arcu Rd.','11891','Santa Cruz de Lorica'),
  ('Ap #185-4228 Neque St.','73260','Ibagué');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('P.O. Box 549, 9456 Adipiscing Rd.','15632','Kasur'),
  ('381-1236 Aliquet Rd.','17585','Perchtoldsdorf'),
  ('Ap #938-3001 Orci Street','87288','Drohobych'),
  ('P.O. Box 616, 6988 Erat St.','65155','Kuruman'),
  ('1605 Libero Road','85163','Workington'),
  ('Ap #255-5933 Feugiat. Av.','67258','Lorient'),
  ('4993 Non, St.','49505','Okene'),
  ('5959 Adipiscing Street','62061','Paço do Lumiar'),
  ('P.O. Box 841, 9327 Parturient Rd.','96034','Lipa'),
  ('P.O. Box 394, 6847 Et, Ave','87429','Hudiksvall');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('1802 Est Rd.','67629','Jiutepec'),
  ('Ap #147-1116 Nisl. Av.','42866','Zhytomyr'),
  ('574-5260 Donec St.','21284','Trujillo'),
  ('824-7377 Magna, St.','13652','Puerto Princesa'),
  ('Ap #591-4364 Senectus Road','21881','Bursa'),
  ('Ap #869-4572 Congue. Av.','44250','Skövde'),
  ('167-5693 Dolor. St.','15655','Voronezh'),
  ('9104 Purus. Rd.','81416','Limón (Puerto Limón]'),
  ('Ap #695-833 Fringilla St.','48609','Tours'),
  ('P.O. Box 759, 3230 In St.','89633','Korneuburg');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('131-4935 Purus. Rd.','23632','Vienna'),
  ('Ap #819-6174 Faucibus Rd.','61563','Puerto Carreño'),
  ('P.O. Box 387, 6188 Vitae Ave','79711','Chapadinha'),
  ('2186 Scelerisque, Street','24466','Chuncheon'),
  ('Ap #186-6259 Sem, Rd.','81146','Siverek'),
  ('Ap #692-795 Aliquet Rd.','72716','Funtua'),
  ('P.O. Box 548, 2999 Vivamus St.','22498','Criciúma'),
  ('Ap #698-1993 Nullam Road','99786','Mexicali'),
  ('258-5742 Tempus, Ave','21173','Bellevue'),
  ('420 Libero. Street','80436','Santa Rosa');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('P.O. Box 447, 4388 In St.','76547','Bida'),
  ('437-9805 Donec Av.','18502','Mường Lay'),
  ('612-1674 Mi Road','83124','Mamuju'),
  ('939-496 Sagittis. Av.','26029','Hofors'),
  ('7624 Adipiscing St.','23369','Montresta'),
  ('641-8178 Dictum Rd.','90467','Belfort'),
  ('Ap #991-976 Proin Rd.','61413','Bryansk'),
  ('Ap #344-7471 Diam Road','21151','Meux'),
  ('Ap #194-4468 Malesuada Av.','43270','Cork'),
  ('Ap #571-4011 Fringilla. Ave','92244','Queenstown');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('453-9096 Blandit Rd.','64337','Hainan'),
  ('2881 Fusce Avenue','02296','Tumba'),
  ('Ap #810-8299 Purus, Rd.','64456','Suncheon'),
  ('203-9818 Dolor Ave','36651','Emalahleni'),
  ('P.O. Box 995, 9779 Eu Avenue','12791','Recco'),
  ('P.O. Box 521, 7805 Blandit. Street','72308','Bedok'),
  ('9890 Libero. Ave','99732','Antalya'),
  ('P.O. Box 538, 9931 Lorem, St.','68858','Davenport'),
  ('Ap #444-1522 Consequat Avenue','54412','Boston'),
  ('118-3820 Nulla. Rd.','16671','Acacías');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('874-7236 Ut Rd.','56572','Onitsha'),
  ('4799 Donec Rd.','90711','Saavedra'),
  ('P.O. Box 202, 4058 Justo Avenue','24665','San Cristóbal de las Casas'),
  ('Ap #547-1983 Non, Rd.','36803','Shanghai'),
  ('Ap #257-7389 Sem, Rd.','68343','Magadan'),
  ('5768 Pretium Ave','27608','Dera Ghazi Khan'),
  ('9623 Phasellus Road','52718','Tampines'),
  ('Ap #775-2065 Auctor Avenue','48126','La Dorada'),
  ('P.O. Box 397, 8380 Risus. Ave','31327','Okene'),
  ('991-3522 Enim. Street','86823','Tromsø');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('Ap #616-2672 Sapien Road','47417','Motueka'),
  ('126-2148 At Av.','71302','Guápiles'),
  ('P.O. Box 984, 6399 Parturient Rd.','72633','Bayugan'),
  ('P.O. Box 835, 9559 Tempor Avenue','99936','Toledo'),
  ('923-644 Nec Rd.','64544','Aguazul'),
  ('Ap #757-1477 Fusce Rd.','53632','Tomaszów Mazowiecki'),
  ('P.O. Box 135, 9113 At Road','66414','Wonju'),
  ('151-1025 Curae Rd.','52021','Olsztyn'),
  ('347-4592 Et Av.','82884','Beijing'),
  ('Ap #166-2448 Suspendisse Ave','65362','Neudörfl');
  INSERT INTO adress (street,zip_code,city)
VALUES
  ('998-274 Lorem Avenue','55358','San Diego'),
  ('669-5210 Ultrices. St.','74944','Emalahleni'),
  ('5508 Tincidunt Avenue','35683','Cabano'),
  ('180-5981 Metus Rd.','77184','Belfast'),
  ('Ap #507-5049 Fusce St.','62636','Guarapuava'),
  ('P.O. Box 636, 3454 Turpis. Avenue','17275','Guizhou'),
  ('Ap #164-8620 Ipsum Ave','66351','Avignon'),
  ('Ap #191-3972 Sed, Ave','30535','Satara'),
  ('Ap #483-4623 Sit Street','91643','Jeju'),
  ('Ap #303-4691 Ipsum. Rd.','49845','Florenville');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('396-1651 Nulla Av.','02097','Galway'),
  ('112-6868 Dictum. Rd.','04366','Meix-le-Tige'),
  ('Ap #285-3899 Tempor St.','14656','Dir'),
  ('7424 Dui. Av.','15852','Palembang'),
  ('5008 Risus. Av.','76695','Haripur'),
  ('P.O. Box 269, 839 Interdum Ave','42349','Soverzene'),
  ('P.O. Box 371, 2639 Vel Avenue','24223','The Hague'),
  ('Ap #630-6737 A, Street','81046','Bodø'),
  ('8413 Adipiscing St.','34347','Curepto'),
  ('Ap #134-5766 Velit. Rd.','78410','Qinghai');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('P.O. Box 629, 8460 Justo Rd.','88561','Berlin'),
  ('Ap #941-2525 Sem Av.','68232','İmamoğlu'),
  ('566-4049 Tristique Av.','43851','Thatta'),
  ('760-5672 Et Street','46033','San Mauro Cilento'),
  ('Ap #273-8705 Convallis Street','31077','Dublin'),
  ('Ap #320-7857 Donec Avenue','74186','Queenstown'),
  ('Ap #128-4868 Nec Road','13171','Cherbourg-Octeville'),
  ('Ap #310-1568 Est, Street','70643','Gorontalo'),
  ('P.O. Box 158, 8437 Vitae St.','04341','Warszawa'),
  ('750-4834 Nullam Rd.','56269','Tehuacán');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('Ap #642-2885 In St.','36607','Pasir Ris'),
  ('Ap #437-6355 Turpis Road','92165','Sydney'),
  ('146-6465 Et, Avenue','33371','Vũ Thư'),
  ('869-1379 Neque. St.','73572','Fauvillers'),
  ('Ap #755-7431 Aliquam St.','46469','Tonalá'),
  ('2346 Semper Avenue','55725','Belfast'),
  ('Ap #635-3458 Auctor St.','38568','Ambon'),
  ('5485 Aliquet, Road','56357','Ede'),
  ('5474 Venenatis Street','83613','Tamines'),
  ('843-2897 Curae Ave','87585','Porsgrunn');
INSERT INTO adress (street,zip_code,city)
VALUES
  ('P.O. Box 959, 1116 Orci Road','43693','Magadan'),
  ('Ap #894-7139 Risus. Ave','84361','Marikina'),
  ('125-9271 Vel Av.','33492','Florianópolis'),
  ('Ap #654-2628 Vel Rd.','61254','Cauayan'),
  ('Ap #793-3862 A Ave','38527','Anápolis'),
  ('5727 Ornare Rd.','25959','Bloomington'),
  ('P.O. Box 966, 6532 Aliquam Rd.','71557','Bathurst'),
  ('Ap #642-758 Pharetra. Ave','06325','Landau'),
  ('P.O. Box 636, 7756 Luctus Rd.','04955','Tarma'),
  ('Ap #933-9892 Donec Street','25914','Surat');


INSERT INTO person_adress (person_id,adress_id)
VALUES
  (1,100),
  (2,99),
  (3,98),
  (4,97),
  (5,96),
  (6,95),
  (7,94),
  (8,93),
  (9,92),
  (10,91);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (11,90),
  (12,89),
  (13,88),
  (14,87),
  (15,86),
  (16,85),
  (17,84),
  (18,83),
  (19,82),
  (20,81);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (21,80),
  (22,79),
  (23,78),
  (24,77),
  (25,76),
  (26,75),
  (27,74),
  (28,73),
  (29,72),
  (30,71);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (31,70),
  (32,69),
  (33,68),
  (34,67),
  (35,66),
  (36,65),
  (37,64),
  (38,63),
  (39,62),
  (40,61);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (41,60),
  (42,59),
  (43,58),
  (44,57),
  (45,56),
  (46,55),
  (47,54),
  (48,53),
  (49,52),
  (50,51);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (51,50),
  (52,49),
  (53,48),
  (54,47),
  (55,46),
  (56,45),
  (57,44),
  (58,43),
  (59,42),
  (60,41);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (61,40),
  (62,39),
  (63,38),
  (64,37),
  (65,36),
  (66,35),
  (67,34),
  (68,33),
  (69,32),
  (70,31);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (71,30),
  (72,29),
  (73,28),
  (74,27),
  (75,26),
  (76,25),
  (77,24),
  (78,23),
  (79,22),
  (80,21);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (81,20),
  (82,19),
  (83,18),
  (84,17),
  (85,16),
  (86,15),
  (87,14),
  (88,13),
  (89,12),
  (90,11);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (91,10),
  (92,9),
  (93,8),
  (94,7),
  (95,6),
  (96,5),
  (97,4),
  (98,3),
  (99,2),
  (100,1);
  INSERT INTO person_adress (person_id,adress_id)
VALUES
  (101,150),
  (102,149),
  (103,148),
  (104,147),
  (105,146),
  (106,145),
  (107,144),
  (108,143),
  (109,142),
  (110,141);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (111,140),
  (112,139),
  (113,138),
  (114,137),
  (115,136),
  (116,135),
  (117,134),
  (118,133),
  (119,132),
  (120,131);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (121,130),
  (122,129),
  (123,128),
  (124,127),
  (125,126),
  (126,125),
  (127,124),
  (128,123),
  (129,122),
  (130,121);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (131,120),
  (132,119),
  (133,118),
  (134,117),
  (135,116),
  (136,115),
  (137,114),
  (138,113),
  (139,112),
  (140,111);
INSERT INTO person_adress (person_id,adress_id)
VALUES
  (141,110),
  (142,109),
  (143,108),
  (144,107),
  (145,106),
  (146,105),
  (147,104),
  (148,103),
  (149,102),
  (150,101);

INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-611 213 37',1),
  ('07-078 618 51',2),
  ('07-188 817 27',3),
  ('07-709 460 38',4),
  ('07-939 032 58',5),
  ('07-820 718 52',6),
  ('07-888 255 55',7),
  ('07-824 561 40',8),
  ('07-552 066 08',9),
  ('07-022 174 85',10);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-660 854 46',11),
  ('07-406 654 14',12),
  ('07-489 325 53',13),
  ('07-532 194 62',14),
  ('07-858 462 76',15),
  ('07-809 504 81',16),
  ('07-480 841 38',17),
  ('07-558 850 67',18),
  ('07-376 329 77',19),
  ('07-498 611 41',20);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-063 914 78',21),
  ('07-398 070 14',22),
  ('07-503 304 42',23),
  ('07-753 321 03',24),
  ('07-623 254 75',25),
  ('07-877 724 41',26),
  ('07-361 355 37',27),
  ('07-284 350 92',28),
  ('07-176 967 82',29),
  ('07-233 012 27',30);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-577 860 53',31),
  ('07-885 644 69',32),
  ('07-537 308 77',33),
  ('07-884 312 62',34),
  ('07-491 543 06',35),
  ('07-668 427 41',36),
  ('07-931 165 73',37),
  ('07-435 556 73',38),
  ('07-487 757 50',39),
  ('07-005 952 44',40);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-545 497 32',41),
  ('07-658 802 34',42),
  ('07-488 938 00',43),
  ('07-574 525 72',44),
  ('07-767 695 06',45),
  ('07-216 370 61',46),
  ('07-629 478 44',47),
  ('07-201 541 33',48),
  ('07-347 240 84',49),
  ('07-788 219 62',50);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-378 535 29',51),
  ('07-113 337 14',52),
  ('07-567 835 70',53),
  ('07-224 734 19',54),
  ('07-694 304 34',55),
  ('07-860 882 42',56),
  ('07-691 364 79',57),
  ('07-912 861 83',58),
  ('07-543 053 71',59),
  ('07-178 720 23',60);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-643 576 26',61),
  ('07-421 334 39',62),
  ('07-132 879 56',63),
  ('07-877 656 41',64),
  ('07-707 233 20',65),
  ('07-561 675 67',66),
  ('07-168 082 19',67),
  ('07-869 411 88',68),
  ('07-528 370 18',69),
  ('07-576 887 32',70);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-334 328 28',71),
  ('07-616 687 38',72),
  ('07-452 331 46',73),
  ('07-990 476 71',74),
  ('07-212 827 62',75),
  ('07-560 610 47',76),
  ('07-651 447 67',77),
  ('07-174 274 85',78),
  ('07-101 265 36',79),
  ('07-725 413 56',80);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-567 381 12',81),
  ('07-171 556 15',82),
  ('07-165 770 25',83),
  ('07-597 376 03',84),
  ('07-002 149 53',85),
  ('07-735 116 64',86),
  ('07-264 317 53',87),
  ('07-403 954 08',88),
  ('07-575 105 26',89),
  ('07-283 662 41',90);
INSERT INTO phone (phone_number,person_id)
VALUES
  ('07-378 054 37',91),
  ('07-221 902 85',92),
  ('07-938 774 85',93),
  ('07-741 241 67',94),
  ('07-179 557 26',95),
  ('07-073 281 70',96),
  ('07-173 224 28',97),
  ('07-287 222 29',98),
  ('07-889 190 73',99),
  ('07-343 447 55',100);
  INSERT INTO phone (person_id,phone_number)
VALUES
  (101,'073-567 40 36'),
  (102,'073-155 54 88'),
  (103,'075-280 41 51'),
  (104,'076-286 66 56'),
  (105,'075-574 04 73'),
  (106,'074-807 81 82'),
  (107,'072-574 62 64'),
  (108,'073-444 10 77'),
  (109,'075-464 28 43'),
  (110,'075-854 00 25');
INSERT INTO phone (person_id,phone_number)
VALUES
  (111,'078-633 18 21'),
  (112,'071-246 55 68'),
  (113,'073-115 75 95'),
  (114,'072-822 48 50'),
  (115,'072-119 81 40'),
  (116,'073-745 53 78'),
  (117,'070-645 24 76'),
  (118,'071-462 42 77'),
  (119,'072-436 31 65'),
  (120,'076-197 83 04');
INSERT INTO phone (person_id,phone_number)
VALUES
  (121,'073-388 37 98'),
  (122,'070-516 14 68'),
  (123,'077-741 01 72'),
  (124,'075-425 31 95'),
  (125,'071-768 24 86'),
  (126,'072-543 02 23'),
  (127,'075-444 49 23'),
  (128,'074-676 82 47'),
  (129,'073-618 93 41'),
  (130,'073-379 46 66');
INSERT INTO phone (person_id,phone_number)
VALUES
  (131,'076-669 84 74'),
  (132,'070-952 56 27'),
  (133,'071-564 07 51'),
  (134,'074-715 20 18'),
  (135,'073-573 93 75'),
  (136,'077-255 36 44'),
  (137,'077-613 78 93'),
  (138,'077-547 91 68'),
  (139,'078-747 29 48'),
  (140,'074-642 14 48');
INSERT INTO phone (person_id,phone_number)
VALUES
  (141,'077-085 04 71'),
  (142,'077-853 45 49'),
  (143,'075-644 70 09'),
  (144,'074-696 75 16'),
  (145,'071-613 42 57'),
  (146,'072-013 72 78'),
  (147,'073-113 35 28'),
  (148,'075-443 18 11'),
  (149,'076-864 48 12'),
  (150,'076-617 37 14');


  INSERT INTO email (email,person_id)
VALUES
  ('proin@yahoo.edu',1),
  ('bibendum.ullamcorper@google.ca',2),
  ('imperdiet.non.vestibulum@protonmail.couk',3),
  ('bibendum.fermentum@protonmail.com',4),
  ('quisque.imperdiet.erat@aol.org',5),
  ('aliquam.nec@hotmail.org',6),
  ('sodales@google.edu',7),
  ('ligula.eu@outlook.couk',8),
  ('felis.ullamcorper@icloud.net',9),
  ('suscipit@icloud.com',10);
INSERT INTO email (email,person_id)
VALUES
  ('lectus.ante.dictum@aol.edu',11),
  ('libero.et.tristique@outlook.ca',12),
  ('neque@outlook.edu',13),
  ('congue@protonmail.com',14),
  ('nec.tempus.scelerisque@yahoo.net',15),
  ('nulla.eu@google.edu',16),
  ('ullamcorper.velit.in@icloud.net',17),
  ('quisque@protonmail.com',18),
  ('mus.proin@google.com',19),
  ('non.enim@outlook.couk',20);
INSERT INTO email (email,person_id)
VALUES
  ('laoreet.posuere@google.net',21),
  ('at@google.net',22),
  ('proin.ultrices@hotmail.org',23),
  ('penatibus@aol.com',24),
  ('enim.etiam@outlook.edu',25),
  ('imperdiet.ullamcorper@protonmail.net',26),
  ('tellus.lorem@outlook.couk',27),
  ('id.sapien.cras@yahoo.com',28),
  ('diam@google.edu',29),
  ('donec.luctus.aliquet@hotmail.net',30);
INSERT INTO email (email,person_id)
VALUES
  ('orci.phasellus.dapibus@hotmail.org',31),
  ('tellus.non@aol.com',32),
  ('luctus.curabitur.egestas@protonmail.edu',33),
  ('velit@google.edu',34),
  ('semper.cursus.integer@hotmail.edu',35),
  ('mauris.eu@yahoo.net',36),
  ('mauris.vestibulum@outlook.ca',37),
  ('turpis.egestas@icloud.com',38),
  ('id.ante@outlook.ca',39),
  ('luctus.ut.pellentesque@icloud.edu',40);
INSERT INTO email (email,person_id)
VALUES
  ('felis.orci@protonmail.ca',41),
  ('nam.interdum.enim@aol.edu',42),
  ('elit.dictum@icloud.net',43),
  ('vel@google.couk',44),
  ('donec@hotmail.edu',45),
  ('dignissim.tempor.arcu@icloud.ca',46),
  ('imperdiet.ornare@yahoo.org',47),
  ('non@google.edu',48),
  ('nam@yahoo.couk',49),
  ('metus.in@protonmail.org',50);
INSERT INTO email (email,person_id)
VALUES
  ('ligula.consectetuer.rhoncus@outlook.edu',51),
  ('vitae.aliquam@outlook.net',52),
  ('lobortis.augue@hotmail.couk',53),
  ('non@yahoo.org',54),
  ('ut.pellentesque.eget@hotmail.com',55),
  ('neque.vitae@hotmail.couk',56),
  ('nullam@icloud.ca',57),
  ('urna.vivamus.molestie@icloud.net',58),
  ('quis.tristique.ac@protonmail.couk',59),
  ('urna.convallis@outlook.couk',60);
INSERT INTO email (email,person_id)
VALUES
  ('curabitur.sed@outlook.net',61),
  ('accumsan.interdum.libero@outlook.ca',62),
  ('et.magnis@icloud.com',63),
  ('risus.quis.diam@yahoo.couk',64),
  ('enim.nec@outlook.com',65),
  ('lacinia.at@hotmail.couk',66),
  ('non.lobortis.quis@aol.edu',67),
  ('aliquam.ultrices@icloud.com',68),
  ('mollis.lectus.pede@yahoo.edu',69),
  ('nullam@hotmail.net',70);
INSERT INTO email (email,person_id)
VALUES
  ('dolor.quam@yahoo.net',71),
  ('mattis@aol.net',72),
  ('nunc.quisque.ornare@google.net',73),
  ('auctor.non.feugiat@hotmail.edu',74),
  ('at.pretium@google.edu',75),
  ('eu.placerat@aol.couk',76),
  ('adipiscing.lacus@google.net',77),
  ('elit.nulla@aol.couk',78),
  ('tortor.at.risus@hotmail.ca',79),
  ('nonummy.ac@hotmail.net',80);
INSERT INTO email (email,person_id)
VALUES
  ('enim.non.nisi@aol.net',81),
  ('nunc.nulla.vulputate@yahoo.net',82),
  ('elit.nulla@icloud.couk',83),
  ('per@protonmail.couk',84),
  ('duis.ac@protonmail.couk',85),
  ('a@protonmail.edu',86),
  ('sed.eget.lacus@outlook.org',87),
  ('vulputate.eu@hotmail.ca',88),
  ('nec.tellus@icloud.edu',89),
  ('eget@aol.net',90);
INSERT INTO email (email,person_id)
VALUES
  ('fusce.diam@icloud.edu',91),
  ('ultrices.posuere@protonmail.org',92),
  ('faucibus@google.ca',93),
  ('quis.diam@protonmail.com',94),
  ('nibh.phasellus@hotmail.net',95),
  ('risus.nunc@hotmail.net',96),
  ('in.consequat@yahoo.edu',97),
  ('mauris@google.net',98),
  ('nunc.sit.amet@yahoo.edu',99),
  ('bibendum.ullamcorper@google.net',100);
  INSERT INTO email (person_id,email)
VALUES
  (101,'gravida.aliquam@hotmail.net'),
  (102,'ac.mattis@protonmail.couk'),
  (103,'sodales.nisi.magna@google.com'),
  (104,'magnis@protonmail.com'),
  (105,'in.felis@yahoo.com'),
  (106,'lobortis.augue.scelerisque@icloud.ca'),
  (107,'justo.praesent.luctus@hotmail.edu'),
  (108,'felis@outlook.org'),
  (109,'rhoncus.proin@yahoo.ca'),
  (110,'montes.nascetur@protonmail.com');
INSERT INTO email (person_id,email)
VALUES
  (111,'in.nec@aol.edu'),
  (112,'ultricies.sem.magna@icloud.couk'),
  (113,'tellus@yahoo.couk'),
  (114,'magna.tellus@protonmail.net'),
  (115,'eget.nisi@protonmail.net'),
  (116,'sed.congue@yahoo.edu'),
  (117,'venenatis.vel@aol.ca'),
  (118,'felis.adipiscing@yahoo.net'),
  (119,'lacus.cras@icloud.ca'),
  (120,'eget.metus@outlook.edu');
INSERT INTO email (person_id,email)
VALUES
  (121,'vivamus.non@yahoo.com'),
  (122,'diam.sed@yahoo.couk'),
  (123,'cursus@protonmail.com'),
  (124,'pellentesque@google.com'),
  (125,'lectus.pede.ultrices@aol.couk'),
  (126,'pulvinar.arcu.et@icloud.org'),
  (127,'cum.sociis.natoque@yahoo.couk'),
  (128,'amet.ornare.lectus@protonmail.couk'),
  (129,'tempor.diam@hotmail.com'),
  (130,'dolor.sit.amet@yahoo.org');
INSERT INTO email (person_id,email)
VALUES
  (131,'phasellus@icloud.ca'),
  (132,'neque@outlook.ca'),
  (133,'et.malesuada.fames@aol.com'),
  (134,'sed.molestie@protonmail.com'),
  (135,'viverra@hotmail.couk'),
  (136,'id.libero@icloud.ca'),
  (137,'non@outlook.edu'),
  (138,'lectus.nullam.suscipit@icloud.com'),
  (139,'eget.varius@icloud.org'),
  (140,'sed@google.net');
INSERT INTO email (person_id,email)
VALUES
  (141,'purus.duis.elementum@yahoo.edu'),
  (142,'erat@aol.com'),
  (143,'vulputate.dui.nec@outlook.edu'),
  (144,'egestas@hotmail.com'),
  (145,'dolor@outlook.couk'),
  (146,'malesuada.integer@aol.edu'),
  (147,'integer.aliquam@outlook.couk'),
  (148,'nibh.lacinia@protonmail.edu'),
  (149,'cras.interdum.nunc@icloud.ca'),
  (150,'nisl.maecenas@hotmail.couk');

INSERT INTO skill_level (level)
VALUES
('Beginner'),
('Intermediate'),
('Advance');


INSERT INTO lesson_type (type)
VALUES
('Individual'),
('Group'),
('Ensemble');


INSERT INTO student (person_id)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);
INSERT INTO student (person_id)
VALUES
  (11),
  (12),
  (13),
  (14),
  (15),
  (16),
  (17),
  (18),
  (19),
  (20);
INSERT INTO student (person_id)
VALUES
  (21),
  (22),
  (23),
  (24),
  (25),
  (26),
  (27),
  (28),
  (29),
  (30);
INSERT INTO student (person_id)
VALUES
  (31),
  (32),
  (33),
  (34),
  (35),
  (36),
  (37),
  (38),
  (39),
  (40);
INSERT INTO student (person_id)
VALUES
  (41),
  (42),
  (43),
  (44),
  (45),
  (46),
  (47),
  (48),
  (49),
  (50);
INSERT INTO student (person_id)
VALUES
  (51),
  (52),
  (53),
  (54),
  (55),
  (56),
  (57),
  (58),
  (59),
  (60);
INSERT INTO student (person_id)
VALUES
  (61),
  (62),
  (63),
  (64),
  (65),
  (66),
  (67),
  (68),
  (69),
  (70);
INSERT INTO student (person_id)
VALUES
  (71),
  (72),
  (73),
  (74),
  (75),
  (76),
  (77),
  (78),
  (79),
  (80);
INSERT INTO instructor (person_id,can_teach_ensemble)
VALUES
  (81,'true'),
  (82,'true'),
  (83,'true'),
  (84,'true'),
  (85,'true'),
  (86,'true'),
  (87,'true'),
  (88,'true'),
  (89,'true'),
  (90,'true');
INSERT INTO instructor (person_id,can_teach_ensemble)
VALUES
  (91,'true'),
  (92,'true'),
  (93,'true'),
  (94,'true'),
  (95,'true'),
  (96,'true'),
  (97,'true'),
  (98,'true'),
  (99,'true'),
  (100,'true');
INSERT INTO instructor (person_id,can_teach_ensemble)
VALUES
  (101,'true'),
  (102,'true'),
  (103,'true'),
  (104,'true'),
  (105,'true'),
  (106,'true'),
  (107,'true'),
  (108,'true'),
  (109,'true'),
  (110,'true');


INSERT INTO contact_person (person_id,student_id,relation)
VALUES
  (111,1,'aunt'),
  (112,3,'grandmother'),
  (113,5,'mother'),
  (114,7,'grandfather'),
  (115,9,'grandfather'),
  (116,11,'father'),
  (117,13,'aunt'),
  (118,15,'mother'),
  (119,17,'aunt'),
  (120,19,'aunt');
INSERT INTO contact_person (person_id,student_id,relation)
VALUES
  (121,21,'mother'),
  (122,23,'grandfather'),
  (123,25,'father'),
  (124,27,'aunt'),
  (125,29,'father'),
  (126,31,'aunt'),
  (127,33,'aunt'),
  (128,35,'father'),
  (129,37,'grandmother'),
  (130,39,'aunt');
INSERT INTO contact_person (person_id,student_id,relation)
VALUES
  (131,41,'mother'),
  (132,43,'mother'),
  (133,45,'grandfather'),
  (134,47,'mother'),
  (135,49,'aunt'),
  (136,51,'father'),
  (137,53,'aunt'),
  (138,55,'father'),
  (139,57,'father'),
  (140,59,'father');
INSERT INTO contact_person (person_id,student_id,relation)
VALUES
  (141,61,'aunt'),
  (142,63,'grandfather'),
  (143,65,'mother'),
  (144,67,'grandmother'),
  (145,69,'aunt'),
  (146,71,'aunt'),
  (147,73,'grandfather'),
  (148,75,'grandfather'),
  (149,77,'grandmother'),
  (150,79,'mother');


INSERT INTO sibling_student (student_id,sibling_id)
VALUES
  (1,21),
  (2,22),
  (3,23),
  (4,24),
  (5,25),
  (6,26),
  (7,27),
  (8,28),
  (9,29),
  (10,30);
INSERT INTO sibling_student (student_id,sibling_id)
VALUES
  (11,31),
  (12,32),
  (13,33),
  (14,34),
  (15,35);
INSERT INTO sibling_student (student_id,sibling_id)
VALUES
  (3,80),
  (8,79),
  (13,78),
  (18,77),
  (23,76),
  (28,75),
  (33,74),
  (38,73),
  (43,72),
  (48,71);
INSERT INTO sibling_student (student_id,sibling_id)
VALUES
  (1,40),
  (4,42),
  (7,44),
  (10,46),
  (13,48),
  (16,50),
  (19,52),
  (22,54),
  (25,56),
  (28,58);

INSERT INTO instrument_stock (instrument_name,brand,maximum_stock,availability_stock,renting_price)
VALUES
  ('Guitar','Steinway & Sons',41,11,823),
  ('Ukulele','Gibson',43,9,859),
  ('Drums','Roland',38,7,166),
  ('Mandolin','Pearl',32,4,867),
  ('Accordion','Pearl',26,2,703),
  ('Harp','Taylor',45,7,278),
  ('Trombone','Roland',47,8,319),
  ('Bagpipes','Pearl',37,6,437);
INSERT INTO instrument_stock (instrument_name,brand,maximum_stock,availability_stock,renting_price)
VALUES
  ('Piano','Ludwig',25,15,907),
  ('Trumpet','Steinway & Sons',47,12,807),
  ('Flute','Korg',38,3,431),
  ('Cello','Fender',49,4,441),
  ('Violin', 'Gibson', 30, 8, 623),
  ('Clarinet', 'Fender', 34, 5, 579),
  ('Saxophone', 'Korg', 42, 9, 743),
  ('Horn', 'Ludwig', 36, 6, 689);

  INSERT INTO instrument_stock (instrument_name, brand, maximum_stock, availability_stock, renting_price)
VALUES
  ('Viola', 'Gibson', 28, 10, 567),
  ('Double Bass', 'Fender', 31, 7, 785),
  ('Piccolo', 'Korg', 33, 5, 543),
  ('Xylophone', 'Ludwig', 40, 13, 678),
  ('Oboe', 'Steinway & Sons', 29, 6, 643),
  ('Bassoon', 'Fender', 35, 8, 722),
  ('Harmonica', 'Korg', 27, 9, 489),
  ('Triangle', 'Ludwig', 20, 4, 167);

INSERT INTO instrument (stock_id)
VALUES
  (24),
  (23),
  (22),
  (21),
  (20),
  (19),
  (18),
  (17),
  (16),
  (15);
INSERT INTO instrument (stock_id)
VALUES
  (14),
  (13),
  (12),
  (11),
  (10),
  (9),
  (8),
  (7),
  (6),
  (5);
INSERT INTO instrument (stock_id)
VALUES
  (4),
  (3),
  (2),
  (1);


INSERT INTO available_schedule (instructor_id, instrument_id, date, time, skill_level_id, lessontype_id, staff_id)
VALUES
  (1, 7, '2024-10-16', '15:32', 1, 2, 1),
  (2, 7, '2024-04-01', '23:08', 1, 2, 2),
  (3, 13, '2024-06-27', '03:01', 2, 2, 3),
  (4, 12, '2024-06-08', '11:56', 3, 2, 4),
  (5, 12, '2024-02-22', '15:48', 2, 2, 5),
  (6, 6, '2024-06-05', '01:32', 1, 3, 4),
  (7, 4, '2024-10-21', '07:57', 3, 2, 2),
  (8, 5, '2024-03-05', '08:29', 2, 3, 3),
  (9, 6, '2024-05-09', '13:24', 2, 2, 1),
  (10, 8, '2023-12-31', '14:29', 2, 3, 5);

INSERT INTO available_schedule (instructor_id, instrument_id, date, time, skill_level_id, lessontype_id)
VALUES
  (11, 1, '2024-03-24', '02:11', 2, 1),
  (12, 3, '2024-02-20', '06:09', 3, 1),
  (13, 8, '2024-01-26', '03:45', 2, 2),
  (14, 4, '2024-07-11', '14:41', 3, 1),
  (15, 1, '2024-02-01', '22:44', 1, 3),
  (16, 9, '2024-08-14', '09:30', 1, 2),
  (17, 10, '2024-09-05', '17:20', 2, 3),
  (18, 11, '2024-06-18', '12:15', 3, 1),
  (19, 14, '2024-05-28', '10:00', 1, 2),
  (20, 16, '2024-04-11', '18:45', 2, 3);

INSERT INTO available_schedule (instructor_id, instrument_id, date, time, skill_level_id, lessontype_id)
VALUES
  (21, 18, '2024-03-01', '07:35', 3, 1),
  (22, 19, '2024-07-22', '14:55', 1, 3),
  (23, 21, '2024-02-29', '11:10', 2, 2),
  (24, 22, '2024-09-15', '16:25', 2, 1),
  (25, 24, '2024-11-09', '09:45', 3, 2);



INSERT INTO pricing_scheme (price, lessontype_id, skill_level_id, price_date, sibling_discount)
VALUES
  (168, 1, 1, '2023-01-01', 20),
  (194, 1, 2, '2023-01-01', 20),
  (130, 1, 3, '2023-01-01', 20),
  (283, 2, 1, '2023-01-01', 20),
  (249, 2, 2, '2023-01-01', 20),
  (205, 2, 3, '2023-01-01', 20),
  (175, 3, 1, '2023-01-01', 20),
  (198, 3, 2, '2023-01-01', 20),
  (160, 3, 3, '2023-01-01', 20);


INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('519','2024-09-30','01:21:51','2','1','2','26',1,1),
  ('541','2023-10-31','00:49:14','2','6','3','28',1,1),
  ('548','2022-12-08','07:05:29','3','3','1','4',1,1),
  ('445','2024-11-02','09:13:34','3','5','3','26',1,1),
  ('284','2024-09-16','05:25:29','2','6','1','9',1,1),
  ('590','2024-03-12','20:58:50','2','4','1','9',1,1),
  ('159','2024-02-27','05:42:48','1','1','3','19',1,1),
  ('536','2024-09-24','13:09:23','1','6','1','3',1,1),
  ('655','2023-07-05','19:10:11','3','5','3','14',1,1),
  ('857','2023-08-01','02:52:23','2','4','3','18',1,1);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('884','2024-02-19','03:33:29','3','4','3','27',1,1),
  ('750','2024-05-13','04:53:24','3','3','2','29',1,1),
  ('440','2024-06-15','07:51:44','3','6','3','28',1,1),
  ('712','2024-05-18','23:53:49','1','5','1','2',1,1),
  ('331','2024-03-05','17:30:20','3','3','1','15',1,1),
  ('373','2024-10-14','17:18:28','3','1','2','4',1,1),
  ('564','2024-06-21','20:34:53','1','3','2','8',1,1),
  ('704','2023-10-03','14:46:52','1','2','1','11',1,1),
  ('854','2023-01-21','11:31:46','2','2','3','24',1,1),
  ('829','2023-02-25','18:24:08','1','6','1','29',1,1);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('225','2023-07-28','14:33:14','1','5','2','7',1,1),
  ('765','2024-05-12','06:33:14','3','4','1','2',1,1),
  ('218','2024-10-05','23:50:08','3','3','1','2',1,1),
  ('511','2023-01-05','04:46:58','2','2','2','29',1,1),
  ('814','2023-06-05','16:26:50','3','3','3','29',1,1),
  ('258','2024-10-31','01:02:44','3','4','3','15',1,1),
  ('766','2023-11-07','20:20:26','3','6','2','27',1,1),
  ('775','2023-10-14','10:56:07','2','1','1','3',1,1),
  ('567','2023-07-18','05:07:38','2','5','2','9',1,1),
  ('855','2024-06-16','18:34:08','3','2','1','13',1,1);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('246','2024-06-22','05:21:37','3','1','2','16',1,1),
  ('360','2023-03-28','18:01:16','3','4','1','29',1,1),
  ('543','2023-09-21','22:54:25','1','6','2','8',1,1),
  ('363','2024-01-08','12:34:23','2','1','3','9',1,1),
  ('820','2023-03-08','21:01:11','3','6','2','21',1,1),
  ('958','2022-11-28','09:46:32','3','3','1','5',1,1),
  ('235','2024-03-25','14:45:19','3','6','1','13',1,1),
  ('428','2024-02-19','15:01:33','1','2','3','14',1,1),
  ('738','2024-04-07','19:36:04','2','2','1','7',1,1),
  ('343','2023-03-03','06:32:04','3','6','3','6',1,1);


INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('892','2023-06-10','14:23:05','2','6','4','16',3,25),
  ('687','2023-12-17','01:14:52','1','3','6','11',3,25),
  ('137','2024-07-07','16:09:03','1','1','5','7',3,16),
  ('873','2024-01-17','13:48:33','1','4','4','1',3,14),
  ('431','2024-06-18','14:41:18','2','2','4','22',3,28),
  ('649','2023-05-09','02:09:34','1','1','6','6',3,21),
  ('385','2023-07-01','00:25:04','3','3','5','19',3,25),
  ('132','2024-05-15','06:50:42','3','1','6','12',3,15),
  ('222','2024-04-20','17:08:50','1','2','5','18',3,22),
  ('522','2023-06-15','10:15:31','1','5','4','22',3,18);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('873','2023-08-09','00:26:22','3','1','4','28',3,16),
  ('041','2024-07-01','08:51:40','1','5','6','3',3,17),
  ('127','2024-08-17','23:06:52','1','1','5','30',3,19),
  ('830','2024-10-12','15:21:11','2','5','5','5',3,20),
  ('250','2023-05-26','20:06:29','1','6','6','10',3,29),
  ('199','2024-03-01','02:22:15','2','5','5','10',3,16),
  ('834','2024-10-16','23:43:25','3','4','6','9',3,21),
  ('258','2024-03-31','01:38:59','2','1','6','1',3,10),
  ('827','2023-03-03','03:13:45','3','4','5','21',3,21),
  ('243','2024-03-04','10:33:28','1','3','4','6',3,11);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('075','2023-09-15','21:40:01','3','3','4','13',3,24),
  ('147','2023-09-14','17:21:35','1','1','5','27',3,14),
  ('487','2024-06-26','20:14:35','2','3','5','19',3,24),
  ('695','2023-09-15','16:30:08','2','3','6','12',3,13),
  ('563','2023-08-16','18:56:19','3','3','5','6',3,20),
  ('259','2023-07-21','17:12:22','2','2','5','24',3,19),
  ('157','2024-07-31','08:13:43','3','5','4','11',3,13),
  ('816','2023-02-24','10:38:39','1','5','5','9',3,20),
  ('391','2024-04-14','10:46:43','2','5','6','18',3,13),
  ('848','2023-04-03','02:09:45','2','1','5','9',3,26);

/*Ensemble*/
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('678','2024-02-13','07:27:32','1','3','7','24',3,26),
  ('485','2023-07-22','19:17:59','1','5','7','28',3,15),
  ('813','2023-03-07','08:46:53','1','5','8','14',3,12),
  ('322','2023-01-18','15:40:31','3','2','9','11',3,29),
  ('245','2023-10-23','19:23:20','2','2','8','19',3,28),
  ('663','2023-07-26','09:00:39','1','3','8','26',3,11),
  ('067','2023-04-18','07:28:43','1','6','7','26',3,22),
  ('055','2023-10-31','22:26:33','1','6','7','27',3,26),
  ('027','2024-10-03','07:58:14','2','1','8','11',3,30),
  ('524','2023-03-20','20:14:55','1','5','9','15',3,12);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('514','2023-01-19','19:19:10','3','4','9','18',3,18),
  ('258','2023-10-25','08:46:53','3','2','9','7',3,17),
  ('124','2023-04-19','00:51:05','3','1','8','17',3,18),
  ('353','2024-07-21','09:21:05','1','4','7','28',3,17),
  ('412','2023-05-19','13:08:47','3','5','7','12',3,23),
  ('012','2024-01-11','04:14:39','2','6','9','27',3,28),
  ('184','2023-10-02','10:33:51','2','6','9','17',3,15),
  ('434','2024-04-01','22:25:06','3','5','8','19',3,26),
  ('158','2024-09-02','17:27:57','2','6','8','7',3,18),
  ('949','2024-06-15','13:50:38','1','6','9','21',3,24);
INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('206','2023-07-22','11:39:58','3','1','8','21',3,12),
  ('873','2023-11-10','14:13:08','3','5','8','4',3,24),
  ('481','2024-05-18','16:59:10','2','4','7','2',3,18),
  ('418','2023-10-21','08:16:39','2','6','7','14',3,18),
  ('323','2023-09-09','16:16:12','3','2','7','12',3,25),
  ('807','2024-10-13','21:41:45','3','5','9','6',3,26),
  ('325','2023-12-04','23:01:24','2','5','7','4',3,23),
  ('167','2024-05-17','23:14:37','1','6','9','21',3,24),
  ('336','2024-04-21','06:44:07','2','4','9','22',3,25),
  ('621','2024-06-04','19:58:44','2','6','8','12',3,25);

  /*NEW ENSEMBLE*/

  INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('206','2023-12-03','11:39:58','3','1','8','11',3,6),
  ('873','2023-12-04','14:13:08','3','5','8','11',3,10),
  ('481','2023-12-03','16:59:10','2','4','7','11',3,12),
  ('418','2023-12-03','08:16:39','2','6','7','11',3,15),
  ('323','2023-12-09','16:16:12','3','2','7','11',3,15),
  ('807','2023-12-13','21:41:45','3','5','9','16',3,16),
  ('325','2023-12-04','23:01:24','2','5','7','16',3,13),
  ('167','2023-12-07','23:14:37','1','6','9','16',3,16),
  ('336','2023-12-21','06:44:07','2','4','9','16',3,8),
  ('621','2023-12-04','19:58:44','2','6','8','17',3,9);


  INSERT INTO lesson (classroom_number,date,time,campus_id,staff_id,price_id,instructor_id,min_places,max_places)
VALUES
  ('206','2023-12-02','11:39:58','3','1','8','16',3,6),
  ('873','2023-12-01','14:13:08','3','5','8','16',3,10),
  ('481','2023-12-08','16:59:10','2','4','7','17',3,12),
  ('418','2023-12-03','08:16:39','2','6','7','17',3,15),
  ('323','2023-12-06','16:16:12','3','2','7','17',3,15),
  ('807','2023-12-19','21:41:45','3','5','9','1',3,16),
  ('325','2023-12-06','23:01:24','2','5','7','1',3,13),
  ('167','2023-12-07','23:14:37','1','6','9','1',3,16),
  ('336','2023-12-30','06:44:07','2','4','9','1',3,8),
  ('621','2023-12-29','19:58:44','2','6','8','1',3,9);


INSERT INTO ensemble_lesson (genre,lesson_id)
VALUES
  ('jaz',71),
  ('pop',72),
  ('pop',73),
  ('pop',74),
  ('rock',75),
  ('pop',76),
  ('choir',77),
  ('brass',78),
  ('pop',79),
  ('brass',80);
INSERT INTO ensemble_lesson (genre,lesson_id)
VALUES
  ('pop',81),
  ('jaz',82),
  ('pop',83),
  ('brass',84),
  ('orchestra',85),
  ('rock',86),
  ('choir',87),
  ('pop',88),
  ('brass',89),
  ('rock',90);
INSERT INTO ensemble_lesson (genre,lesson_id)
VALUES
  ('orchestra',91),
  ('orchestra',92),
  ('brass',93),
  ('jaz',94),
  ('rock',95),
  ('orchestra',96),
  ('pop',97),
  ('jaz',98),
  ('orchestra',99),
  ('pop',100);

  INSERT INTO ensemble_lesson (genre,lesson_id)
VALUES
  ('orchestra',101),
  ('orchestra',102),
  ('brass',103),
  ('jaz',104),
  ('rock',105),
  ('orchestra',106),
  ('pop',107),
  ('jaz',108),
  ('orchestra',109),
  ('pop',110);

  INSERT INTO ensemble_lesson (genre,lesson_id)
VALUES
  ('orchestra',111),
  ('orchestra',112),
  ('brass',113),
  ('jaz',114),
  ('rock',115),
  ('orchestra',116),
  ('pop',117),
  ('jaz',118),
  ('orchestra',119),
  ('pop',120);


INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (1,'10'),
  (2,'8'),
  (3,'1'),
  (4,'13'),
  (5,'8'),
  (6,'2'),
  (7,'15'),
  (8,'19'),
  (9,'2'),
  (10,'22');
INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (11,'22'),
  (12,'23'),
  (13,'13'),
  (14,'12'),
  (15,'10'),
  (16,'1'),
  (17,'1'),
  (18,'14'),
  (19,'8'),
  (20,'19');
INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (21,'2'),
  (22,'8'),
  (23,'24'),
  (24,'19'),
  (25,'3'),
  (26,'18'),
  (27,'19'),
  (28,'13'),
  (29,'17'),
  (30,'23');
INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (31,'15'),
  (32,'3'),
  (33,'22'),
  (34,'19'),
  (35,'12'),
  (36,'11'),
  (37,'16'),
  (38,'19'),
  (39,'21'),
  (40,'4');
INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (41,'3'),
  (42,'23'),
  (43,'11'),
  (44,'18'),
  (45,'15'),
  (46,'17'),
  (47,'13'),
  (48,'22'),
  (49,'18'),
  (50,'12');
INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (51,'17'),
  (52,'7'),
  (53,'20'),
  (54,'22'),
  (55,'7'),
  (56,'16'),
  (57,'24'),
  (58,'8'),
  (59,'7'),
  (60,'4');
  INSERT INTO instrument_type (lesson_id,instrument_id)
VALUES
  (61,'9'),
  (62,'1'),
  (63,'2'),
  (64,'6'),
  (65,'18'),
  (66,'19'),
  (67,'24'),
  (68,'5'),
  (69,'11'),
  (70,'12');


INSERT INTO renting_period (student_id,date_from,date_to,instrument_id)
VALUES
  (3,'2023-03-29','2023-12-22','16'),
  (5,'2023-02-21','2023-07-03','19'),
  (7,'2023-05-27','2024-01-31','24'),
  (9,'2023-01-19','2023-08-23','11'),
  (11,'2023-04-23','2023-12-29','11'),
  (13,'2023-01-20','2024-01-28','19'),
  (15,'2023-05-21','2023-07-25','18'),
  (17,'2023-04-15','2023-08-21','21'),
  (19,'2023-03-11','2023-11-09','16'),
  (21,'2023-04-09','2024-01-14','2');
INSERT INTO renting_period (student_id,date_from,date_to,instrument_id)
VALUES
  (23,'2023-03-03','2023-10-12','5'),
  (25,'2023-03-26','2023-09-17','20'),
  (27,'2023-05-29','2023-12-15','9'),
  (29,'2023-05-24','2023-11-11','4'),
  (31,'2023-05-23','2023-09-07','11'),
  (33,'2023-05-21','2023-09-07','8'),
  (35,'2023-06-23','2023-08-09','24'),
  (37,'2023-04-15','2024-01-14','6'),
  (39,'2023-05-18','2023-08-12','10'),
  (41,'2023-04-20','2023-11-06','5');
INSERT INTO renting_period (student_id,date_from,date_to,instrument_id)
VALUES
  (43,'2023-04-21','2023-08-02','20'),
  (45,'2023-05-28','2023-10-14','18'),
  (47,'2023-02-22','2023-12-30','21'),
  (49,'2023-02-12','2023-07-26','23'),
  (51,'2023-01-13','2024-01-04','7');

/*Individual lessons*/
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (1,2),
  (2,4),
  (3,6),
  (4,8),
  (5,10),
  (6,12),
  (7,14),
  (8,16),
  (9,18),
  (10,20);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (11,22),
  (12,24),
  (13,26),
  (14,28),
  (15,30),
  (16,32),
  (17,34),
  (18,36),
  (19,38),
  (20,40);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (21,42),
  (22,44),
  (23,46),
  (24,48),
  (25,50),
  (26,52),
  (27,54),
  (28,56),
  (29,58),
  (30,60);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (31,62),
  (32,64),
  (33,66),
  (34,68),
  (35,70),
  (36,72),
  (37,74),
  (38,76),
  (39,78),
  (40,80);


  /*Group/Ensemble lessons*/
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (41,34),
  (42,47),
  (43,15),
  (44,31),
  (45,66),
  (46,22),
  (47,37),
  (48,15),
  (49,70),
  (50,70);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (51,73),
  (52,24),
  (53,35),
  (54,54),
  (55,55),
  (56,62),
  (57,79),
  (58,28),
  (59,47),
  (60,71);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (61,2),
  (62,52),
  (63,56),
  (64,58),
  (65,72),
  (66,26),
  (67,53),
  (68,2),
  (69,53),
  (70,3);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (71,3),
  (72,4),
  (73,37),
  (74,5),
  (75,69),
  (76,40),
  (77,74),
  (78,32),
  (79,5),
  (80,48);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (81,72),
  (82,47),
  (83,16),
  (84,79),
  (85,48),
  (86,79),
  (87,19),
  (88,47),
  (89,39),
  (90,72);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (91,65),
  (92,29),
  (93,55),
  (94,45),
  (95,1),
  (97,37),
  (98,12),
  (99,75),
  (100,24);
  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (100,71),
  (99,32),
  (98,73),
  (97,38),
  (96,17),
  (95,71),
  (94,62),
  (93,49),
  (92,76),
  (91,20);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (90,51),
  (89,68),
  (88,19),
  (87,51),
  (86,73),
  (85,53),
  (84,47),
  (83,67),
  (82,43),
  (81,54);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (80,38),
  (79,40),
  (78,69),
  (77,7),
  (76,12),
  (75,80),
  (74,34),
  (73,40),
  (72,38),
  (71,58);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (70,5),
  (69,64),
  (68,22),
  (67,1),
  (66,22),
  (65,65),
  (64,8),
  (63,68),
  (62,47),
  (61,66);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (60,32),
  (59,26),
  (58,71),
  (57,23),
  (56,6),
  (55,49),
  (54,28),
  (53,30),
  (52,38),
  (51,25);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (50,12),
  (49,7),
  (48,5),
  (47,13),
  (46,73),
  (45,23),
  (44,14),
  (43,45),
  (42,8),
  (41,41);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (41,66),
  (42,20),
  (43,13),
  (44,79),
  (45,61),
  (46,72),
  (47,17),
  (48,24),
  (49,72),
  (50,58);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (51,49),
  (52,7),
  (53,7),
  (54,50),
  (55,25),
  (56,16),
  (57,64),
  (58,40),
  (59,51),
  (60,23);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (61,43),
  (62,5),
  (63,37),
  (64,49),
  (65,69),
  (66,37),
  (67,23),
  (68,51),
  (69,30),
  (70,2);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (71,74),
  (72,20),
  (73,67),
  (74,52),
  (75,25),
  (76,74),
  (77,47),
  (78,30),
  (79,24),
  (80,70);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (81,76),
  (82,8),
  (83,48),
  (84,74),
  (85,23),
  (86,37),
  (88,67),
  (89,5),
  (90,60);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (91,47),
  (92,66),
  (93,10),
  (94,46),
  (95,68),
  (96,49),
  (97,70),
  (98,52),
  (99,4),
  (100,74);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (100,52),
  (99,6),
  (98,68),
  (97,19),
  (96,2),
  (95,26),
  (94,8),
  (93,74),
  (92,63),
  (91,36);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (90,34),
  (89,47),
  (88,60),
  (87,56),
  (86,27),
  (85,3),
  (84,46),
  (83,40),
  (82,70),
  (81,43);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (80,36),
  (79,41),
  (78,16),
  (77,62),
  (76,18),
  (75,55),
  (74,67),
  (73,55),
  (72,45),
  (71,8);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (70,55),
  (69,4),
  (68,48),
  (67,2),
  (66,33),
  (65,6),
  (64,3),
  (63,74),
  (62,26),
  (61,4);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (60,64),
  (59,44),
  (58,80),
  (57,8),
  (56,74),
  (55,61),
  (54,71),
  (53,37),
  (52,45),
  (51,58);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (50,51),
  (49,32),
  (48,63),
  (47,53),
  (46,61),
  (45,3),
  (44,44),
  (43,56),
  (42,57),
  (41,75);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (41,38),
  (42,59),
  (43,17),
  (44,70),
  (45,70),
  (46,50),
  (47,66),
  (48,38),
  (49,68),
  (50,41);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (51,40),
  (52,8),
  (53,31),
  (54,69),
  (55,57),
  (56,52),
  (57,48),
  (58,68),
  (60,12);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (61,55),
  (62,76),
  (63,39),
  (64,63),
  (65,2),
  (66,68),
  (67,36),
  (69,5),
  (70,24);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (71,21),
  (72,76),
  (73,53),
  (74,50),
  (75,53),
  (76,71),
  (77,70),
  (78,58),
  (79,49),
  (80,74);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (81,44),
  (83,60),
  (84,4),
  (85,9),
  (86,34),
  (87,42),
  (88,44),
  (89,41),
  (90,46);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (91,17),
  (92,67),
  (93,64),
  (94,60),
  (95,77),
  (96,1),
  (97,24),
  (98,18),
  (99,28),
  (100,30);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (100,37),
  (99,46),
  (98,76),
  (97,44),
  (96,75),
  (95,66),
  (94,41),
  (93,15),
  (92,47),
  (91,35);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (90,48),
  (89,34),
  (87,28),
  (86,50),
  (84,77),
  (83,30),
  (82,65),
  (81,27);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (80,20),
  (79,27),
  (78,73),
  (77,5),
  (76,36),
  (75,60),
  (74,74),
  (73,34),
  (72,77),
  (71,66);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (70,54),
  (69,6),
  (68,31),
  (67,51),
  (66,5),
  (65,35),
  (64,70),
  (63,16),
  (62,18),
  (61,78);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (60,27),
  (59,58),
  (58,42),
  (57,1),
  (56,53),
  (55,58),
  (54,17),
  (53,29),
  (52,66),
  (51,70);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (50,27),
  (49,66),
  (48,17),
  (47,28),
  (46,23),
  (45,50),
  (44,64),
  (43,3),
  (41,8);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (41,32),
  (42,7),
  (43,63),
  (44,60),
  (45,1),
  (46,10),
  (47,43),
  (48,20),
  (49,29),
  (50,62);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (51,35),
  (52,63),
  (53,52),
  (54,44),
  (55,65),
  (56,63),
  (57,45),
  (58,44),
  (59,67),
  (60,37);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (61,68),
  (62,10),
  (63,15),
  (64,41),
  (65,10),
  (67,74),
  (68,9),
  (69,21);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (71,40),
  (72,3),
  (73,60),
  (74,1),
  (75,1),
  (76,51),
  (77,67),
  (78,78),
  (79,25),
  (80,23);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (81,24),
  (82,4),
  (83,28),
  (84,43),
  (85,67),
  (86,32),
  (87,31),
  (88,14),
  (90,44);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (91,41),
  (92,46),
  (93,46),
  (94,78),
  (95,42),
  (96,15),
  (97,28),
  (98,66),
  (99,41),
  (100,15);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (100,34),
  (99,64),
  (98,13),
  (97,75),
  (96,24),
  (95,59),
  (94,13),
  (93,42),
  (92,73),
  (91,52);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (90,33),
  (89,52),
  (88,80),
  (87,58),
  (86,47),
  (85,7),
  (84,63),
  (83,70),
  (82,38);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (80,3),
  (79,78),
  (77,12),
  (73,39),
  (72,55),
  (71,61);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (70,32),
  (69,29),
  (68,79),
  (66,21),
  (65,62),
  (64,52),
  (63,80),
  (62,59),
  (61,12);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (60,1),
  (59,34),
  (58,9),
  (57,19),
  (56,54),
  (55,67),
  (54,14),
  (53,15),
  (52,17),
  (51,46);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (50,38),
  (49,25),
  (47,56),
  (46,65),
  (45,79),
  (44,73),
  (42,26),
  (41,59);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (41,57),
  (42,65),
  (43,64),
  (44,55),
  (45,77),
  (46,58),
  (48,51),
  (49,17),
  (50,34);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (51,5),
  (52,28),
  (53,79),
  (55,53),
  (56,18),
  (57,54),
  (59,23),
  (60,54);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (61,36),
  (62,63),
  (63,69),
  (64,74),
  (65,38),
  (66,34),
  (67,50),
  (68,65),
  (69,66);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (71,33),
  (72,67),
  (73,49),
  (74,46),
  (76,69),
  (77,2),
  (78,72),
  (79,50),
  (80,58);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (81,5),
  (82,12),
  (83,13),
  (84,25),
  (85,15),
  (86,42),
  (87,66),
  (88,68),
  (89,61),
  (90,14);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (91,23),
  (92,43),
  (93,66),
  (94,66),
  (95,53),
  (96,45),
  (97,46),
  (98,21),
  (99,65),
  (100,28);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (41,23),
  (42,11),
  (43,52),
  (46,39),
  (47,8),
  (48,76),
  (49,60),
  (50,6);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (51,54),
  (52,30),
  (53,62),
  (54,23),
  (55,4),
  (56,60),
  (57,36),
  (58,22),
  (59,78),
  (60,46);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (61,60),
  (62,44),
  (63,65),
  (64,20),
  (65,20),
  (66,28),
  (67,42),
  (68,62),
  (69,15),
  (70,77);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (71,16),
  (72,69),
  (73,50),
  (74,23),
  (75,27),
  (76,33),
  (77,40),
  (78,49),
  (79,32),
  (80,31);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (81,69),
  (82,39),
  (83,10),
  (84,16),
  (85,51),
  (86,4),
  (87,49),
  (88,65),
  (89,14),
  (90,24);
INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (91,33),
  (92,10),
  (93,45),
  (94,2),
  (95,15),
  (96,21),
  (97,23),
  (98,42),
  (99,34),
  (100,31);

/*  NEW DATA FOR SEMINAR 3*/

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (101,10),
  (101,9),
  (101,8),
  (101,7),
  (102,6),
  (102,5),
  (102,4),
  (102,3),
  (102,2),
  (102,1);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (102,10),
  (103,9),
  (103,8),
  (103,7),
  (103,6),
  (103,5),
  (103,4),
  (103,3),
  (103,2),
  (103,1);


  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (103,10),
  (103,19),
  (104,8),
  (104,7),
  (104,6),
  (104,5),
  (104,4),
  (104,3),
  (104,2),
  (104,1);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (105,10),
  (105,9),
  (105,8),
  (105,7),
  (105,6),
  (105,5),
  (105,4),
  (106,3),
  (106,2),
  (106,1);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (106,10),
  (106,9),
  (106,8),
  (106,7),
  (107,6),
  (107,5),
  (107,4),
  (107,3),
  (107,2),
  (107,1);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (107,10),
  (107,9),
  (108,8),
  (108,7),
  (108,6),
  (108,5),
  (108,4),
  (108,3),
  (108,2),
  (108,1);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (108,11),
  (108,12),
  (109,18),
  (109,17),
  (109,16),
  (109,15),
  (109,14),
  (109,13),
  (109,12),
  (109,11);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (110,11),
  (110,12),
  (110,18),
  (110,17),
  (110,16),
  (110,15),
  (110,14),
  (110,13),
  (110,2),
  (110,20);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (111,11),
  (111,12),
  (111,18),
  (111,17),
  (111,16),
  (112,15),
  (112,14),
  (112,13),
  (112,12),
  (112,20),
  (112,5),
  (112,3),
  (112,2),
  (112,28);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (113,11),
  (113,12),
  (113,18),
  (113,17),
  (113,16),
  (114,15),
  (114,14),
  (114,13),
  (114,12),
  (114,20);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (115,11),
  (115,12),
  (115,18),
  (115,17),
  (115,16),
  (115,15),
  (115,14),
  (115,13),
  (115,79),
  (116,20);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (116,11),
  (116,12),
  (116,18),
  (116,17),
  (116,16),
  (116,15),
  (117,14),
  (117,13),
  (117,12),
  (117,20);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (118,11),
  (118,76),
  (118,18),
  (118,17),
  (118,16),
  (118,15),
  (118,14),
  (118,13),
  (118,12),
  (118,20);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (118,1),
  (118,2),
  (118,8),
  (118,7),
  (118,6),
  (119,5),
  (119,4),
  (119,3),
  (119,27),
  (119,29);

  INSERT INTO student_lesson (lesson_id,student_id)
VALUES
  (119,1),
  (119,2),
  (119,8),
  (119,7),
  (119,6),
  (120,5),
  (120,4),
  (120,3),
  (120,2),
  (120,29);

INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('11',71),
  ('11',72),
  ('13',73),
  ('24',74),
  ('6',75),
  ('4',76),
  ('21',77),
  ('17',78),
  ('12',79),
  ('2',80);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('2',82),
  ('24',83),
  ('9',84),
  ('23',85),
  ('16',86),
  ('18',87),
  ('6',88),
  ('14',89),
  ('20',90);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('22',91),
  ('19',92),
  ('23',93),
  ('21',94),
  ('16',95),
  ('13',96),
  ('13',97),
  ('14',98),
  ('22',99),
  ('19',100);
  INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('20',100),
  ('20',99),
  ('5',98),
  ('24',97),
  ('4',96),
  ('20',95),
  ('19',94),
  ('11',93),
  ('15',92),
  ('1',91);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('19',90),
  ('19',89),
  ('9',88),
  ('11',87),
  ('4',86),
  ('24',85),
  ('22',84),
  ('11',83),
  ('8',82),
  ('9',81);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('10',80),
  ('15',79),
  ('1',78),
  ('8',77),
  ('10',76),
  ('10',75),
  ('13',74),
  ('23',73),
  ('23',72),
  ('24',71);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('2',71),
  ('18',73),
  ('15',74),
  ('20',75),
  ('16',76),
  ('7',77),
  ('13',78),
  ('18',79),
  ('23',80);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('10',81),
  ('10',82),
  ('7',83),
  ('16',84),
  ('18',85),
  ('11',86),
  ('5',87),
  ('14',88),
  ('8',89),
  ('23',90);
INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('16',91),
  ('13',92),
  ('2',93),
  ('22',94),
  ('8',95),
  ('24',96),
  ('16',97),
  ('1',98),
  ('7',99),
  ('8',100);



  /*NEW LESSONS*/

  INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('11',101),
  ('11',102),
  ('13',103),
  ('24',104),
  ('6',105),
  ('4',106),
  ('21',107),
  ('17',108),
  ('12',109),
  ('23',110);

  INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('1',101),
  ('1',102),
  ('3',103),
  ('4',104),
  ('16',105),
  ('20',106),
  ('11',107),
  ('7',108),
  ('2',109),
  ('20',110);

  INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('17',101),
  ('19',102),
  ('10',103),
  ('2',104),
  ('13',105),
  ('14',106),
  ('16',107),
  ('18',108),
  ('15',109),
  ('1',110);


INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('11',111),
  ('11',112),
  ('13',113),
  ('24',114),
  ('6',115),
  ('4',116),
  ('21',117),
  ('17',118),
  ('12',119),
  ('23',120);

  INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('1',111),
  ('1',112),
  ('3',113),
  ('4',114),
  ('16',115),
  ('20',116),
  ('11',117),
  ('7',118),
  ('2',119),
  ('20',120);

  INSERT INTO instrument_type (instrument_id,lesson_id)
VALUES
  ('17',111),
  ('19',112),
  ('10',113),
  ('2',114),
  ('13',115),
  ('14',116),
  ('16',117),
  ('18',118),
  ('15',119),
  ('1',120);


COMMIT; -- End of the transaction
