BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "line_types" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
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
	"id"	INTEGER NOT NULL DEFAULT 1 UNIQUE,
	"last_modified_year"	INTEGER NOT NULL UNIQUE,
	"last_modified_month"	INTEGER NOT NULL UNIQUE,
	"last_modified_day"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "intersections" (
	"id"	INTEGER NOT NULL UNIQUE,
	"station_a"	INTEGER NOT NULL UNIQUE,
	"station_b"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("station_a") REFERENCES "stations"("id"),
	FOREIGN KEY("station_b") REFERENCES "stations"("id")
);
CREATE TABLE IF NOT EXISTS "stations_accessibility_wheelchair_levels" (
	"id"	INTEGER NOT NULL UNIQUE,
	"description_en"	TEXT NOT NULL,
	"description_fa"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "stations_accessibility_blindness_levels" (
	"id"	INTEGER NOT NULL UNIQUE,
	"description_en"	TEXT NOT NULL,
	"description_fa"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "stations_wc_availability_levels" (
	"id"	INTEGER NOT NULL UNIQUE,
	"description_en"	TEXT NOT NULL,
	"description_fa"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "stations" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name_en"	TEXT NOT NULL,
	"name_fa"	TEXT NOT NULL,
	"line_id"	INTEGER NOT NULL,
	"position_in_line"	INTEGER NOT NULL,
	"location_lat"	REAL,
	"location_long"	REAL,
	"map_x"	INTEGER,
	"map_y"	INTEGER,
	"has_emergency_medical_services"	INTEGER NOT NULL,
	"accessibility_wheelchair_level"	INTEGER NOT NULL DEFAULT 1,
	"accessibility_blindness_level"	INTEGER NOT NULL DEFAULT 1,
	"wc"	INTEGER NOT NULL DEFAULT 1,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("line_id") REFERENCES "lines"("id"),
	FOREIGN KEY("wc") REFERENCES "stations_wc_availability_levels"("id"),
	FOREIGN KEY("accessibility_blindness_level") REFERENCES "stations_accessibility_blindness_levels"("id"),
	FOREIGN KEY("accessibility_wheelchair_level") REFERENCES "stations_accessibility_wheelchair_levels"("id")
);
INSERT INTO "line_types" VALUES (1,'Metro Line');
INSERT INTO "line_types" VALUES (2,'Metro Branch');
INSERT INTO "lines" VALUES (1,'one','یک','C53642',1);
INSERT INTO "lines" VALUES (2,'two','دو','30577F',1);
INSERT INTO "lines" VALUES (3,'three','سه','59A7C2',1);
INSERT INTO "lines" VALUES (4,'four','چهار','E2C21D',1);
INSERT INTO "lines" VALUES (5,'five','پنج','1A796B',1);
INSERT INTO "lines" VALUES (6,'six','شش','F677AA',1);
INSERT INTO "lines" VALUES (7,'seven','هفت','7C4078',1);
INSERT INTO "lines" VALUES (101,'one','یک','C53642',2);
INSERT INTO "lines" VALUES (104,'four','چهار','E2C21D',2);
INSERT INTO "information" VALUES (1,2022,2,25);
INSERT INTO "intersections" VALUES (1,42,127);
INSERT INTO "intersections" VALUES (2,91,126);
INSERT INTO "intersections" VALUES (3,34,117);
INSERT INTO "intersections" VALUES (4,72,116);
INSERT INTO "intersections" VALUES (5,49,111);
INSERT INTO "intersections" VALUES (6,96,110);
INSERT INTO "intersections" VALUES (7,29,102);
INSERT INTO "intersections" VALUES (8,56,101);
INSERT INTO "intersections" VALUES (9,15,100);
INSERT INTO "intersections" VALUES (10,74,98);
INSERT INTO "intersections" VALUES (11,28,57);
INSERT INTO "intersections" VALUES (12,48,95);
INSERT INTO "intersections" VALUES (13,17,53);
INSERT INTO "intersections" VALUES (14,26,89);
INSERT INTO "intersections" VALUES (15,11,78);
INSERT INTO "intersections" VALUES (16,27,45);
INSERT INTO "intersections" VALUES (17,109,134);
INSERT INTO "stations_accessibility_wheelchair_levels" VALUES (1,'Not wheelchair accessible','با ویلچر قابل دسترسی نیست');
INSERT INTO "stations_accessibility_wheelchair_levels" VALUES (2,'Elevator from street to one platform','آسانسور از سطح خیابان به یک سکو');
INSERT INTO "stations_accessibility_wheelchair_levels" VALUES (3,'Elevator from street to both platforms','آسانسور از سطح خیابان به هر دو سکو');
INSERT INTO "stations_accessibility_wheelchair_levels" VALUES (4,'Elevator from ticket sales hall to platform','آسانسور از سالن فروش بلیت به سکو');
INSERT INTO "stations_accessibility_wheelchair_levels" VALUES (5,'Elevator from street to ticket sales hall & from ticket sales hall to platform','آسانسور از سطح خیابان به سالن فروش بلیت و از سالن فروش بلیت به سکو');
INSERT INTO "stations_accessibility_blindness_levels" VALUES (1,'Not accessible to the visually impaired','فاقد مسیر نابینایان');
INSERT INTO "stations_accessibility_blindness_levels" VALUES (2,'Accessible to the visually impaired on platforms only','دارای مسیر نابینایان در سکو‌ها');
INSERT INTO "stations_accessibility_blindness_levels" VALUES (3,'Accessible to the visually impaired','دارای مسیر نابینایان در تمام ایستگاه');
INSERT INTO "stations_wc_availability_levels" VALUES (1,'Restroom not available','فاقد سرویس بهداشتی');
INSERT INTO "stations_wc_availability_levels" VALUES (2,'Restroom available close to the station','دارای سرویس بهداشتی در کنار ایستگاه');
INSERT INTO "stations_wc_availability_levels" VALUES (3,'Restroom available just outside the station','دارای سرویس بهداشتی در محوطه بیرونی ایستگاه');
INSERT INTO "stations" VALUES (1,'Forudgah-e Emam Khomeini','فرودگاه امام خمینی',101,2,35.4079,51.1545,NULL,NULL,0,5,3,1);
INSERT INTO "stations" VALUES (2,'Tajrish','تجریش',1,0,35.80438056,51.43395,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (3,'Gheytarie','قیطریه',1,1,35.79305556,51.43527778,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (4,'Shahid Sadr','شهید صدر',1,2,35.78527778,51.43583333,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (5,'Gholhak','قلهک',1,3,35.77277778,51.43805556,NULL,NULL,0,2,2,1);
INSERT INTO "stations" VALUES (6,'Doctor Shariati','دکتر شریعتی',1,4,35.76277778,51.44444444,NULL,NULL,0,2,2,1);
INSERT INTO "stations" VALUES (7,'Mirdamad','میرداماد',1,5,35.76,51.43361111,NULL,NULL,0,2,1,1);
INSERT INTO "stations" VALUES (8,'Shahid Haghani','شهید حقانی',1,6,35.75583333,51.42611111,NULL,NULL,0,1,2,3);
INSERT INTO "stations" VALUES (9,'Shahid Hemat','شهید همت',1,7,35.7475,51.42805556,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (10,'Mosalaye Emam Khomeini','مصلای امام خمینی',1,8,35.73997778,51.42792778,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (11,'Shahid Beheshti','شهید بهشتی',1,9,35.73163056,51.42681389,NULL,NULL,0,3,2,2);
INSERT INTO "stations" VALUES (12,'Shahid Mofateh','شهید مفتح',1,10,35.72444444,51.42777778,NULL,NULL,0,3,2,1);
INSERT INTO "stations" VALUES (13,'Shohada-ye Haftom-e Tir','شهدای هفتم تیر',1,11,35.71583333,51.42611111,NULL,NULL,0,3,2,2);
INSERT INTO "stations" VALUES (14,'Taleghani','طالقانی',1,12,35.70716111,51.42603333,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (15,'Darvaze Dolat','دروازه دولت',1,13,35.70171111,51.42603333,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (16,'Saadi','سعدی',1,14,35.69305556,51.42472222,NULL,NULL,0,3,1,1);
INSERT INTO "stations" VALUES (17,'Emam Khomeini','امام خمینی',1,15,35.68583333,51.41972222,NULL,NULL,1,5,1,1);
INSERT INTO "stations" VALUES (18,'Golshahr','گلشهر',5,10,35.8248302,50.9332966,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (19,'Mohammad Shahr','محمدشهر',5,9,35.80239,50.9647627,NULL,NULL,0,4,1,1);
INSERT INTO "stations" VALUES (20,'Karaj','کرج',5,8,35.78690556,51.00299722,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (21,'Atmosfer','اتمسفر',5,7,35.7674,51.0458,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (22,'Garmdareh','گرم‌دره',5,6,35.751,51.08166667,NULL,NULL,0,4,1,1);
INSERT INTO "stations" VALUES (23,'Vardavard','وردآورد',5,5,35.74388889,51.15083333,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (24,'Iran Khordo','ایران خودرو',5,4,35.72527778,51.19666667,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (25,'Varzeshgah-e Azadi','ورزشگاه آزادی',5,2,35.71666667,51.28138889,NULL,NULL,0,4,1,1);
INSERT INTO "stations" VALUES (26,'Eram-e Sabz','ارم سبز',5,1,35.7175,51.30194444,NULL,NULL,1,4,1,1);
INSERT INTO "stations" VALUES (27,'Tehran (Sadeghieh)','تهران (صادقیه)',5,0,35.71777778,51.33083333,NULL,NULL,1,5,1,3);
INSERT INTO "stations" VALUES (28,'Emam Hossein','امام حسین',6,6,35.70194444,51.445,NULL,NULL,0,2,2,1);
INSERT INTO "stations" VALUES (29,'Meydan-e Shohada','میدان شهدا',6,5,35.69027778,51.4475,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (30,'Be''sat','بعثت',6,2,35.6449,51.4446,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (31,'Dolat Abad','دولت‌آباد',6,0,35.6197,51.4678,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (32,'Panzdah-e Khordad','پانزده خرداد',1,16,35.67799444,51.41748333,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (33,'Khayam','خیام',1,17,35.67315833,51.41646389,NULL,NULL,0,2,1,1);
INSERT INTO "stations" VALUES (34,'Meydan-e Mohammadiyeh','میدان محمدیه',1,18,35.66831944,51.41559444,NULL,NULL,0,2,1,1);
INSERT INTO "stations" VALUES (35,'Shoosh','شوش',1,19,35.65833333,51.41416667,NULL,NULL,0,3,1,3);
INSERT INTO "stations" VALUES (36,'Payane Jonub','پایانهٔ جنوب',1,20,35.64786389,51.41560556,NULL,NULL,0,5,2,1);
INSERT INTO "stations" VALUES (37,'Shahid Bokharaei','شهید بخارایی',1,21,35.6409,51.41497778,NULL,NULL,0,5,1,3);
INSERT INTO "stations" VALUES (38,'Ali Abad','علی‌آباد',1,22,35.628425,51.41616667,NULL,NULL,1,5,1,3);
INSERT INTO "stations" VALUES (39,'Javanmard-e Ghasab','جوانمرد قصاب',1,23,35.61866111,51.41873611,NULL,NULL,0,5,1,3);
INSERT INTO "stations" VALUES (40,'Shahr-e Rey','شهرری',1,24,35.5951,51.42237778,NULL,NULL,0,5,2,3);
INSERT INTO "stations" VALUES (41,'Palayeshgah','پالایشگاه',1,25,35.55972222,51.39916667,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (42,'Shahed-Bagher Shahr','شاهد–باقرشهر',1,26,35.54744722,51.38258333,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (43,'haramme Motahar-e Emam Khomeini','حرم مطهر امام خمینی',1,27,35.54510556,51.37298333,NULL,NULL,0,3,1,2);
INSERT INTO "stations" VALUES (44,'Kahrizak','کهریزک',1,28,35.5217,51.3692,NULL,NULL,0,4,1,1);
INSERT INTO "stations" VALUES (45,'Tehran (Sadeghieh)','تهران (صادقیه)',2,0,35.71777778,51.33083333,NULL,NULL,1,5,1,3);
INSERT INTO "stations" VALUES (46,'Tarasht','طرشت',2,1,35.7161,51.3435,NULL,NULL,0,3,2,1);
INSERT INTO "stations" VALUES (47,'Daneshgah-e Sharif','دانشگاه شریف',2,2,35.70583333,51.35361111,NULL,NULL,0,2,1,1);
INSERT INTO "stations" VALUES (48,'Shadman','شادمان',2,3,35.70111111,51.33194444,NULL,NULL,0,3,2,1);
INSERT INTO "stations" VALUES (49,'Shahid Navab-e Safavi','شهید نواب صفوی',2,4,35.69555556,51.37833333,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (50,'Meydan-e Hor','میدان حر',2,5,35.69083333,51.38861111,NULL,NULL,0,3,1,1);
INSERT INTO "stations" VALUES (51,'Daneshgah-e Emam Ali','دانشگاه امام علی',2,6,35.68722222,51.39916667,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (52,'Hasan Abad','حسن‌آباد',2,7,35.68638889,51.40972222,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (53,'Emam Khomeini','امام خمینی',2,8,NULL,NULL,NULL,NULL,1,5,1,1);
INSERT INTO "stations" VALUES (54,'Mellat','ملت',2,9,35.6888,51.42694444,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (55,'Baharaestan','بهارستان',2,10,35.69166667,51.43277778,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (56,'Darvaze Shemiran','دروازه شمیران',2,11,35.69899,51.43725,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (57,'Emam Hossein','امام حسین',2,12,35.70194444,51.445,NULL,NULL,0,2,2,1);
INSERT INTO "stations" VALUES (58,'Shahid Madani','شهید مدنی',2,13,35.70916667,51.4525,NULL,NULL,0,3,1,1);
INSERT INTO "stations" VALUES (59,'Sabalan','سبلان',2,14,35.71805556,51.46444444,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (60,'Fadak','فدک',2,15,35.72638889,51.47583333,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (61,'Janbazan','جانبازان',2,16,35.7325,51.47361111,NULL,NULL,0,2,2,1);
INSERT INTO "stations" VALUES (62,'Sarsabz','سرسبز',2,17,35.735,51.495,NULL,NULL,0,3,2,1);
INSERT INTO "stations" VALUES (63,'Daneshgah-e Elm-o Sanat','دانشگاه علم و صنعت',2,18,35.73444444,51.50472222,NULL,NULL,0,3,2,3);
INSERT INTO "stations" VALUES (64,'Shahid Bagheri','شهید باقری',2,19,35.73277778,51.51638889,NULL,NULL,0,3,1,1);
INSERT INTO "stations" VALUES (65,'Azadegan','آزادگان',3,0,35.62753,51.33525,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (66,'Ne''mat Abad','نعمت‌آباد',3,1,35.63402,51.34775,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (67,'Abdol Abad','عبدل‌آباد',3,2,35.63821,51.36015,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (68,'Shahrak-e Shariati','شهرک شریعتی',3,3,35.64403,51.36883,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (69,'Zamzam','زمزم',3,4,35.65256,51.37359,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (70,'Javadieh','جوادیه',3,5,35.65935,51.388,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (71,'Rah Ahan','راه‌آهن',3,6,35.65867,51.39838,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (72,'Mahdiyeh','مهدیه',3,7,35.66719,51.39942,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (73,'Moniriyeh','منیریه',3,8,35.68114,51.40163,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (74,'Taatr-e Shahr','تئاتر شهر',3,9,35.70102,51.405366,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (75,'Meydan-e Hazrat-e Vali Asr','میدان حضرت ولی‌عصر',3,10,35.71162,51.40701,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (76,'Meydan-e Jahad','میدان جهاد',3,11,35.72051,51.40842,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (77,'Mirza-ye Shirazi','میرزای شیرازی',3,12,35.72818,51.41692,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (78,'Shahid Beheshti','شهید بهشتی',3,13,NULL,NULL,NULL,NULL,0,3,2,2);
INSERT INTO "stations" VALUES (79,'Sohrevardi','سهروردی',3,14,35.73111111,51.4375,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (80,'Shahid Ghoddoosi','شهید قدوسی',3,15,35.73138889,51.445,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (81,'Shahid Sayyad-e Shirazi','شهید صیاد شیرازی',3,16,35.735,35.735,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (82,'Khajeh Abdollah-e Ansari','خواجه عبدالله انصاری',3,17,35.74361111,51.46361111,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (83,'Shahid Zeynoddin','شهید زین‌الدین',3,18,35.75972222,51.46666667,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (84,'Meydan-e Heravi','میدان هروی',3,19,35.77194444,51.47305556,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (85,'Hossein Abad','حسین‌آباد',3,20,35.77861111,51.48055556,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (86,'Nobonyad','نوبنیاد',3,21,35.79083333,51.4785,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (87,'Shahid Mahalati','شهید محلاتی',3,23,35.79805556,51.50833333,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (88,'Ghaem','قائم',3,24,35.79944444,51.52166667,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (89,'Eram-e Sabz','ارم سبز',4,18,35.7175,51.30194444,NULL,NULL,1,4,1,1);
INSERT INTO "stations" VALUES (90,'Shahrak-e Ekbatan','شهرک اکباتان',4,17,35.70553,51.30763,NULL,NULL,0,1,2,3);
INSERT INTO "stations" VALUES (91,'Bime','بیمه',4,16,35.69944444,51.32055556,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (92,'Meydan-e Azadi','میدان آزادی',4,15,35.69975,51.3326,NULL,NULL,1,1,2,1);
INSERT INTO "stations" VALUES (93,'Ostad Moein','استاد معین',4,14,35.70016,51.34472,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (94,'Doctor Habib-o-llah','دکتر حبیب‌الله',4,13,35.70031,51.35604,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (95,'Shadman','شادمان',4,12,35.70111111,51.33194444,NULL,NULL,0,3,2,1);
INSERT INTO "stations" VALUES (96,'Tohid','توحید',4,11,35.70083333,51.37861111,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (97,'Meydan-e Enghelab-e Eslami','میدان انقلاب اسلامی',4,10,35.70111111,51.38972222,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (98,'Taatr-e Shahr','تئاتر شهر',4,9,35.70102,51.405366,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (99,'Ferdowsi','فردوسی',4,8,35.7014,51.4185,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (100,'Darvaze Dolat','دروازه دولت',4,7,NULL,NULL,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (101,'Darvaze Shemiran','دروازه شمیران',4,6,35.69899,51.43725,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (102,'Meydan-e Shohada','میدان شهدا',4,5,35.69027778,51.4475,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (103,'Ebn-e Sina','ابن سینا',4,4,35.69027778,51.45666667,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (104,'Pirouzi','پیروزی',4,3,35.691,51.4679,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (105,'Nabard','نبرد',4,2,35.69166667,51.47777778,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (106,'Nirou Havaei','نیروهوایی',4,1,35.6925,51.488,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (107,'Shahid Kolahdouz','شهید کلاهدوز',4,0,35.69888889,51.49999,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (108,'Meydan-e Sanat','میدان صنعت',7,0,35.7544,51.368,NULL,NULL,1,1,3,1);
INSERT INTO "stations" VALUES (109,'Daneshgah-e Tarbiat Modarres','دانشگاه تربیت مدرس',7,2,35.72498,51.38096,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (110,'Tohid','توحید',7,4,35.70083333,51.37861111,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (111,'Shahid Navab-e Safavi','شهید نواب صفوی',7,5,35.69555556,51.37833333,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (112,'Roudaki','رودکی',7,6,NULL,NULL,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (113,'Komeyl','کمیل',7,7,35.6814,51.3801,NULL,NULL,1,1,3,1);
INSERT INTO "stations" VALUES (114,'Beryanak','بریانک',7,8,35.671,51.3817,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (115,'Helal Ahmar','هلال احمر',7,9,35.6678,51.3871,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (116,'Mahdiyeh','مهدیه',7,10,35.66719,51.39942,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (117,'Meydan-e Mohammadiyeh','میدان محمدیه',7,11,35.66831944,51.41559444,NULL,NULL,0,2,1,1);
INSERT INTO "stations" VALUES (118,'Molavi','مولوی',7,12,NULL,NULL,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (119,'Basij','بسیج',7,16,NULL,NULL,NULL,NULL,0,2,3,1);
INSERT INTO "stations" VALUES (120,'Tehranpars','تهرانپارس',2,20,35.73083333,51.53166667,NULL,NULL,0,3,2,1);
INSERT INTO "stations" VALUES (121,'Farhangsara','فرهنگسرا',2,21,35.72972222,51.54694444,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (122,'Payane 1 va 2 Forudgah-e Mehr-Abad','پایانهٔ ۱ و ۲ فرودگاه مهرآباد',104,1,35.6934,51.3248,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (123,'Payane 4 va 6 Forudgah-e Mehr-Abad','پایانهٔ ۴ و ۶ فرودگاه مهرآباد',104,2,35.6891,51.3305,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (124,'Namayeshgah-e Shahr-e Aftab','نمایشگاه شهر آفتاب',101,1,35.5398,51.3493,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (125,'Chitgar','چیتگر',5,3,35.71722222,51.24388889,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (126,'Bime','بیمه',104,0,35.69944444,51.32055556,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (127,'Shahed-Bagher Shahr','شاهد–باقرشهر',101,0,35.54744722,51.38258333,NULL,NULL,0,4,1,3);
INSERT INTO "stations" VALUES (128,'Aghdasiyeh','اقدسیه',3,22,35.8007,51.48462,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (129,'Amir Kabir','امیر کبیر',6,4,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (130,'Shahid Rezaei','شهید رضایی',6,3,NULL,NULL,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (131,'Kiyan Shahr','ایران شهر',6,1,NULL,NULL,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (132,'Shohada-ye Haftom-e Tir','شهدای هفتم تیر',6,7,35.71583333,51.42611111,NULL,NULL,0,3,2,2);
INSERT INTO "stations" VALUES (133,'Meydan-e Hazrat-e Vali Asr','میدان حضرت ولی‌عصر',6,8,35.71162,51.40701,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (134,'Daneshgah-e Tarbiat Modarres','دانشگاه تربیت مدرس',6,9,35.72498,51.38096,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (135,'Shahrak-e Azmayesh','شهرک‌ آزمایش',6,10,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (136,'Marzdaran','مرزداران',6,11,NULL,NULL,NULL,NULL,0,1,1,1);
INSERT INTO "stations" VALUES (137,'Yadegar-e Emam','یادگار امام',6,12,NULL,NULL,NULL,NULL,0,1,2,1);
INSERT INTO "stations" VALUES (138,'Shahid Ashrafi Esfahani','شهید اشرفی اصفهانی',6,13,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (139,'Shahid Sattari','شهید ستاری',6,14,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (140,'Borj-e Milad-e Tehran','برج میلاد تهران',7,1,NULL,NULL,NULL,NULL,0,5,3,1);
INSERT INTO "stations" VALUES (141,'Modafean-e Salamat','مدافعان سلامت',7,3,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (142,'Meydan-e Ghiyam','میدان قیام',7,13,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (143,'Chehel Tan-e Doulab','چهل تن دولاب',7,14,NULL,NULL,NULL,NULL,0,1,3,1);
INSERT INTO "stations" VALUES (144,'Ahang','آهنگ',7,15,NULL,NULL,NULL,NULL,0,1,3,1);
COMMIT;
