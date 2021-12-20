BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "stations" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"name_fa"	INTEGER NOT NULL,
	"line_id"	INTEGER NOT NULL,
	"position_in_line"	INTEGER NOT NULL,
	"interchange_id"	INTEGER,
	FOREIGN KEY("line_id") REFERENCES "lines"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "line_types" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "interchanges" (
	"id"	INTEGER NOT NULL UNIQUE,
	"station_a"	INTEGER NOT NULL UNIQUE,
	"station_b"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("station_a") REFERENCES "stations"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "lines" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name_en"	TEXT NOT NULL,
	"name_fa"	TEXT NOT NULL,
	"color"	TEXT,
	"type"	INTEGER NOT NULL DEFAULT 1,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "information" (
	"last_modified_year"	INTEGER NOT NULL UNIQUE,
	"last_modified_month"	INTEGER NOT NULL UNIQUE,
	"last_modified_day"	INTEGER NOT NULL UNIQUE
);
INSERT INTO "stations" VALUES (1,'Forudgah-e Emam Khomeini','فرودگاه امام خمینی',101,2,NULL);
INSERT INTO "stations" VALUES (2,'Tajrish','تجریش',1,0,NULL);
INSERT INTO "stations" VALUES (3,'Gheytarie','قیطریه',1,1,NULL);
INSERT INTO "stations" VALUES (4,'Shahid Sadr','شهید صدر',1,2,NULL);
INSERT INTO "stations" VALUES (5,'Gholhak','قلهک',1,3,NULL);
INSERT INTO "stations" VALUES (6,'Doctor Shariati','دکتر شریعتی',1,4,NULL);
INSERT INTO "stations" VALUES (7,'Mirdamad','میرداماد',1,5,NULL);
INSERT INTO "stations" VALUES (8,'Shahid Haghani','شهید حقانی',1,6,NULL);
INSERT INTO "stations" VALUES (9,'Shahid Hemat','شهید همت',1,7,NULL);
INSERT INTO "stations" VALUES (10,'Mosalaye Emam Khomeini','مصلای امام خمینی',1,8,NULL);
INSERT INTO "stations" VALUES (11,'Shahid Beheshti','شهید بهشتی',1,9,15);
INSERT INTO "stations" VALUES (12,'Shahid Mofateh','شهید مفتح',1,10,NULL);
INSERT INTO "stations" VALUES (13,'Shohadaye Haftom Tir','شهدای هفتم تیر',1,11,NULL);
INSERT INTO "stations" VALUES (14,'Taleghani','طالقانی',1,12,NULL);
INSERT INTO "stations" VALUES (15,'Darvaze Dolat','دروازه دولت',1,13,9);
INSERT INTO "stations" VALUES (16,'Saadi','سعدی',1,14,NULL);
INSERT INTO "stations" VALUES (17,'Emam Khomeini','امام خمینی',1,15,13);
INSERT INTO "stations" VALUES (18,'Golshahr','گلشهر',5,10,NULL);
INSERT INTO "stations" VALUES (19,'Mohammad Shahr','محمدشهر',5,9,NULL);
INSERT INTO "stations" VALUES (20,'Karaj','کرج',5,8,NULL);
INSERT INTO "stations" VALUES (21,'Atmosfer','اتمسفر',5,7,NULL);
INSERT INTO "stations" VALUES (22,'Garmdareh','گرم‌دره',5,6,NULL);
INSERT INTO "stations" VALUES (23,'Vardavard','وردآورد',5,5,NULL);
INSERT INTO "stations" VALUES (24,'Iran Khordo','ایران خودرو',5,4,NULL);
INSERT INTO "stations" VALUES (25,'Varzeshgah-e Azadi','ورزشگاه آزادی',5,2,NULL);
INSERT INTO "stations" VALUES (26,'Eram-e Sabz','ارم سبز',5,1,14);
INSERT INTO "stations" VALUES (27,'Tehran (Sadeghieh)','تهران (صادقیه)',5,0,16);
INSERT INTO "stations" VALUES (28,'Emam Hossein','امام حسین',6,0,11);
INSERT INTO "stations" VALUES (29,'Meydan-e Shohada','میدان شهدا',6,1,7);
INSERT INTO "stations" VALUES (30,'Besat','بعثت',6,2,NULL);
INSERT INTO "stations" VALUES (31,'Dolat Abad','دولت‌آباد',6,3,NULL);
INSERT INTO "stations" VALUES (32,'Panzdah-e Khordad','پانزده خرداد',1,16,NULL);
INSERT INTO "stations" VALUES (33,'Khayam','خیام',1,17,NULL);
INSERT INTO "stations" VALUES (34,'Meydan-e Mohammadiyeh','میدان محمدیه',1,18,3);
INSERT INTO "stations" VALUES (35,'Shoosh','شوش',1,19,NULL);
INSERT INTO "stations" VALUES (36,'Payane Jonub','پایانهٔ جنوب',1,20,NULL);
INSERT INTO "stations" VALUES (37,'Shahid Bokharaei','شهید بخارایی',1,21,NULL);
INSERT INTO "stations" VALUES (38,'Ali Abad','علی‌آباد',1,22,NULL);
INSERT INTO "stations" VALUES (39,'Javanmard-e Ghasab','جوانمرد قصاب',1,23,NULL);
INSERT INTO "stations" VALUES (40,'Shahr-e Rey','شهرری',1,24,NULL);
INSERT INTO "stations" VALUES (41,'Palayeshgah','پالایشگاه',1,25,NULL);
INSERT INTO "stations" VALUES (42,'Shahed-Bagher Shahr','شاهد–باقرشهر',1,26,1);
INSERT INTO "stations" VALUES (43,'haramme Motahar-e Emam Khomeini','حرم مطهر امام خمینی',1,27,NULL);
INSERT INTO "stations" VALUES (44,'Kahrizak','کهریزک',1,28,NULL);
INSERT INTO "stations" VALUES (45,'Tehran (Sadeghieh)','تهران (صادقیه)',2,0,16);
INSERT INTO "stations" VALUES (46,'Tarasht','طرشت',2,1,NULL);
INSERT INTO "stations" VALUES (47,'Daneshgah-e Sharif','دانشگاه شریف',2,2,NULL);
INSERT INTO "stations" VALUES (48,'Shadman','شادمان',2,3,12);
INSERT INTO "stations" VALUES (49,'Shahid Navab-e Safavi','شهید نواب صفوی',2,4,5);
INSERT INTO "stations" VALUES (50,'Meydan-e Hor','میدان حر',2,5,NULL);
INSERT INTO "stations" VALUES (51,'Daneshgah-e Emam Ali','دانشگاه امام علی',2,6,NULL);
INSERT INTO "stations" VALUES (52,'Hassan Abad','حسن‌آباد',2,7,NULL);
INSERT INTO "stations" VALUES (53,'Emam Khomeini','امام خمینی',2,8,13);
INSERT INTO "stations" VALUES (54,'Mellat','ملت',2,9,NULL);
INSERT INTO "stations" VALUES (55,'Baharaestan','بهارستان',2,10,NULL);
INSERT INTO "stations" VALUES (56,'Darvaze Shemiran','دروازه شمیران',2,11,8);
INSERT INTO "stations" VALUES (57,'Emam Hossein','امام حسین',2,12,11);
INSERT INTO "stations" VALUES (58,'Shahid Madani','شهید مدنی',2,13,NULL);
INSERT INTO "stations" VALUES (59,'Sabalan','سبلان',2,14,NULL);
INSERT INTO "stations" VALUES (60,'Fadak','فدک',2,15,NULL);
INSERT INTO "stations" VALUES (61,'Janbazan','جانبازان',2,16,NULL);
INSERT INTO "stations" VALUES (62,'Sarsabz','سرسبز',2,17,NULL);
INSERT INTO "stations" VALUES (63,'Daneshgah-e Elm-o Sanat','دانشگاه علم و صنعت',2,18,NULL);
INSERT INTO "stations" VALUES (64,'Shahid Bagheri','شهید باقری',2,19,NULL);
INSERT INTO "stations" VALUES (65,'Azadegan','آزادگان',3,0,NULL);
INSERT INTO "stations" VALUES (66,'Nemat Abad','نعمت‌آباد',3,1,NULL);
INSERT INTO "stations" VALUES (67,'Abdol Abad','عبدل‌آباد',3,2,NULL);
INSERT INTO "stations" VALUES (68,'Shahrak-e Shariati','شهرک شریعتی',3,3,NULL);
INSERT INTO "stations" VALUES (69,'Zamzam','زمزم',3,4,NULL);
INSERT INTO "stations" VALUES (70,'Javadieh','جوادیه',3,5,NULL);
INSERT INTO "stations" VALUES (71,'Rah Ahan','راه‌آهن',3,6,NULL);
INSERT INTO "stations" VALUES (72,'Mahdiyeh','مهدیه',3,7,4);
INSERT INTO "stations" VALUES (73,'Moniriyeh','منیریه',3,8,NULL);
INSERT INTO "stations" VALUES (74,'Taatr-e Shahr','تئاتر شهر',3,9,10);
INSERT INTO "stations" VALUES (75,'Meydan-e Hazrat-e Valiasr','میدان حضرت ولی‌عصر',3,10,NULL);
INSERT INTO "stations" VALUES (76,'Meydan-e Jahad','میدان جهاد',3,11,NULL);
INSERT INTO "stations" VALUES (77,'Mirza-ye Shirazi','میرزای شیرازی',3,12,NULL);
INSERT INTO "stations" VALUES (78,'Shahid Beheshti','شهید بهشتی',3,13,15);
INSERT INTO "stations" VALUES (79,'Sohrevardi','سهروردی',3,14,NULL);
INSERT INTO "stations" VALUES (80,'Shahid Ghodusi','شهید قدوسی',3,15,NULL);
INSERT INTO "stations" VALUES (81,'Shahid Sayyad-e Shirazi','شهید صیاد شیرازی',3,16,NULL);
INSERT INTO "stations" VALUES (82,'Khajeh Abdollah-e Ansari','خواجه عبدالله انصاری',3,17,NULL);
INSERT INTO "stations" VALUES (83,'Shahid Zeynoddin','شهید زین‌الدین',3,18,NULL);
INSERT INTO "stations" VALUES (84,'Meydan-e Horrvey','میدان هروی',3,19,NULL);
INSERT INTO "stations" VALUES (85,'Hossein Abad','حسین‌آباد',3,20,NULL);
INSERT INTO "stations" VALUES (86,'Nobonyad','نوبنیاد',3,21,NULL);
INSERT INTO "stations" VALUES (87,'Shahid Mahalati','شهید محلاتی',3,22,NULL);
INSERT INTO "stations" VALUES (88,'Ghaem','قائم',3,23,NULL);
INSERT INTO "stations" VALUES (89,'Eram-e Sabz','ارم سبز',4,18,14);
INSERT INTO "stations" VALUES (90,'Shahrak-e Ekbatan','شهرک اکباتان',4,17,NULL);
INSERT INTO "stations" VALUES (91,'Bime','بیمه',4,16,2);
INSERT INTO "stations" VALUES (92,'Meydan-e Azadi','میدان آزادی',4,15,NULL);
INSERT INTO "stations" VALUES (93,'Ostad Moein','استاد معین',4,14,NULL);
INSERT INTO "stations" VALUES (94,'Doctor Habibollah','دکتر حبیب‌الله',4,13,NULL);
INSERT INTO "stations" VALUES (95,'Shadman','شادمان',4,12,12);
INSERT INTO "stations" VALUES (96,'Tohid','توحید',4,11,6);
INSERT INTO "stations" VALUES (97,'Meydan-e Enghelab-e Eslami','میدان انقلاب اسلامی',4,10,NULL);
INSERT INTO "stations" VALUES (98,'Taatr-e Shahr','تئاتر شهر',4,9,10);
INSERT INTO "stations" VALUES (99,'Ferdowsi','فردوسی',4,8,NULL);
INSERT INTO "stations" VALUES (100,'Darvaze Dolat','دروازه دولت',4,7,9);
INSERT INTO "stations" VALUES (101,'Darvaze Shemiran','دروازه شمیران',4,6,8);
INSERT INTO "stations" VALUES (102,'Meydan-e Shohada','میدان شهدا',4,5,7);
INSERT INTO "stations" VALUES (103,'Ebn-e Sina','ابن سینا',4,4,NULL);
INSERT INTO "stations" VALUES (104,'Pirouzi','پیروزی',4,3,NULL);
INSERT INTO "stations" VALUES (105,'Nabard','نبرد',4,2,NULL);
INSERT INTO "stations" VALUES (106,'Nirou Havaei','نیروهوایی',4,1,NULL);
INSERT INTO "stations" VALUES (107,'Shahid Kolahdouz','شهید کلاهدوز',4,0,NULL);
INSERT INTO "stations" VALUES (108,'Meydan-e Sanat','میدان صنعت',7,0,NULL);
INSERT INTO "stations" VALUES (109,'Daneshgaheh-e Tarbiat Modares','دانشگاه تربیت مدرس',7,1,NULL);
INSERT INTO "stations" VALUES (110,'Tohid','توحید',7,2,6);
INSERT INTO "stations" VALUES (111,'Shahid Navab-e Safavi','شهید نواب صفوی',7,3,5);
INSERT INTO "stations" VALUES (112,'Roudaki','رودکی',7,4,NULL);
INSERT INTO "stations" VALUES (113,'Komeyl','کمیل',7,5,NULL);
INSERT INTO "stations" VALUES (114,'Beryanak','بریانک',7,6,NULL);
INSERT INTO "stations" VALUES (115,'Helal Ahmar','هلال احمر',7,7,NULL);
INSERT INTO "stations" VALUES (116,'Mahdiyeh','مهدیه',7,8,4);
INSERT INTO "stations" VALUES (117,'Meydan-e Mohammadiyeh','میدان محمدیه',7,9,3);
INSERT INTO "stations" VALUES (118,'Molavi','مولوی',7,10,NULL);
INSERT INTO "stations" VALUES (119,'Basij','بسیج',7,11,NULL);
INSERT INTO "stations" VALUES (120,'Tehranpars','تهرانپارس',2,20,NULL);
INSERT INTO "stations" VALUES (121,'Farhangsara','فرهنگسرا',2,21,NULL);
INSERT INTO "stations" VALUES (122,'Payane 1 va 2 Forudgah-e Mehr-Abad','پایانهٔ ۱ و ۲ فرودگاه مهرآباد',104,1,NULL);
INSERT INTO "stations" VALUES (123,'Payane 4 va 6 Forudgah-e Mehr-Abad','پایانهٔ ۴ و ۶ فرودگاه مهرآباد',104,2,NULL);
INSERT INTO "stations" VALUES (124,'Namayeshgah-e Shahr-e Aftab','نمایشگاه شهر آفتاب',101,1,NULL);
INSERT INTO "stations" VALUES (125,'Chitgar','چیتگر',5,3,NULL);
INSERT INTO "stations" VALUES (126,'Bime','بیمه',104,0,2);
INSERT INTO "stations" VALUES (127,'Shahed-Bagher Shahr','شاهد–باقرشهر',101,0,1);
INSERT INTO "line_types" VALUES (1,'Metro Line');
INSERT INTO "line_types" VALUES (2,'Metro Branch');
INSERT INTO "interchanges" VALUES (1,42,127);
INSERT INTO "interchanges" VALUES (2,91,126);
INSERT INTO "interchanges" VALUES (3,34,117);
INSERT INTO "interchanges" VALUES (4,72,116);
INSERT INTO "interchanges" VALUES (5,49,111);
INSERT INTO "interchanges" VALUES (6,96,110);
INSERT INTO "interchanges" VALUES (7,29,102);
INSERT INTO "interchanges" VALUES (8,56,101);
INSERT INTO "interchanges" VALUES (9,15,100);
INSERT INTO "interchanges" VALUES (10,74,98);
INSERT INTO "interchanges" VALUES (11,28,57);
INSERT INTO "interchanges" VALUES (12,48,95);
INSERT INTO "interchanges" VALUES (13,17,53);
INSERT INTO "interchanges" VALUES (14,26,89);
INSERT INTO "interchanges" VALUES (15,11,78);
INSERT INTO "interchanges" VALUES (16,27,45);
INSERT INTO "lines" VALUES (1,'one','یک','C53642',1);
INSERT INTO "lines" VALUES (2,'two','دو','30577F',1);
INSERT INTO "lines" VALUES (3,'three','سه','59A7C2',1);
INSERT INTO "lines" VALUES (4,'four','چهار','E2C21D',1);
INSERT INTO "lines" VALUES (5,'five','پنج','1A796B',1);
INSERT INTO "lines" VALUES (6,'six','شش','F677AA',1);
INSERT INTO "lines" VALUES (7,'seven','هفت','7C4078',1);
INSERT INTO "lines" VALUES (101,'one','یک','C53642',2);
INSERT INTO "lines" VALUES (104,'four','چهار','E2C21D',2);
INSERT INTO "information" VALUES (2021,12,20);
COMMIT;
