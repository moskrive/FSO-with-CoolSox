CREATE USER IF NOT EXISTS 'catalogue_user' IDENTIFIED BY 'default_password';

GRANT ALL ON socksdb.* TO 'catalogue_user';

CREATE TABLE IF NOT EXISTS sock (
	sock_id varchar(40) NOT NULL, 
	name varchar(20), 
	description varchar(200), 
	price float, 
	count int, 
	image_url_1 varchar(40), 
	image_url_2 varchar(40), 
	PRIMARY KEY(sock_id)
);

CREATE TABLE IF NOT EXISTS tag (
	tag_id MEDIUMINT NOT NULL AUTO_INCREMENT, 
	name varchar(20), 
	PRIMARY KEY(tag_id)
);

CREATE TABLE IF NOT EXISTS sock_tag (
	sock_id varchar(40), 
	tag_id MEDIUMINT NOT NULL, 
	FOREIGN KEY (sock_id) 
		REFERENCES sock(sock_id), 
	FOREIGN KEY(tag_id)
		REFERENCES tag(tag_id)
);

INSERT INTO sock VALUES ("a0a4f044-b040-410d-8ead-4de0446aec7e", "Yellow Car",      "This is a coo car",                         7.99, 115, "/catalogue/images/car_yellow1.jpg",        "/catalogue/images/car_yellow2.jpg");
INSERT INTO sock VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "Red Super Car",   "Red Super car for speed...",               17.32, 738, "/catalogue/images/car_red1.jpg",           "/catalogue/images/car_red2.jpg");
INSERT INTO sock VALUES ("510a0d7e-8e83-4193-b483-e27e09ddc34d", "Orange Truck.",   "This coold Orange Truck is just super",    15.00, 820, "/catalogue/images/car_truck1.jpg",         "/catalogue/images/car_truck2.jpg");
INSERT INTO sock VALUES ("03fef6ac-1896-4ce8-bd69-b798f85c6e0b", "Holy Car.",       "The title says it all...",                 89.99,   1, "/catalogue/images/holy_1.jpeg",            "/catalogue/images/holy_2.jpeg");
INSERT INTO sock VALUES ("d3588630-ad8e-49df-bbd7-3167f7efb246", "Hot Wheels",      "There is some serious power here.....",    10.99, 801, "/catalogue/images/car_hotwheels1.jpg",     "/catalogue/images/car_hotwheels2.jpg");
INSERT INTO sock VALUES ("819e1fbf-8b7e-4f6d-811f-693534916a8b", "White Race Cars", "This car was owned by Speedy.. ",          14.02, 808, "/catalogue/images/car_race_white1.jpg",    "/catalogue/images/car_race_white2.jpg");
INSERT INTO sock VALUES ("zzz4f044-b040-410d-8ead-4de0446aec7e", "Classic",         "Keep it simple.........................",  12.12, 127, "/catalogue/images/car_green_classic1.jpg", "/catalogue/images/car_green_classic2.jpg");
INSERT INTO sock VALUES ("3395a43e-2d88-40de-b95f-e00e1502085b", "Car Pile",        "A pile of cars.",                          18.02, 438, "/catalogue/images/colourful_cars1.jpg",    "/catalogue/images/colourful_cars2.jpg");
INSERT INTO sock VALUES ("837ab141-399e-4c1f-9abc-bace40296bac", "Orange Race Car", "Not faster than light, but still fast...", 15.04, 175, "/catalogue/images/car_race1.jpg",          "/catalogue/images/car_race2.jpg");



INSERT INTO tag (name) VALUES ("brown");
INSERT INTO tag (name) VALUES ("geek");
INSERT INTO tag (name) VALUES ("formal");
INSERT INTO tag (name) VALUES ("blue");
INSERT INTO tag (name) VALUES ("skin");
INSERT INTO tag (name) VALUES ("red");
INSERT INTO tag (name) VALUES ("action");
INSERT INTO tag (name) VALUES ("sport");
INSERT INTO tag (name) VALUES ("black");
INSERT INTO tag (name) VALUES ("magic");
INSERT INTO tag (name) VALUES ("green");

INSERT INTO sock_tag VALUES ("a0a4f044-b040-410d-8ead-4de0446aec7e", "4");
INSERT INTO sock_tag VALUES ("a0a4f044-b040-410d-8ead-4de0446aec7e", "5");
INSERT INTO sock_tag VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "4");
INSERT INTO sock_tag VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "6");
INSERT INTO sock_tag VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "7");
INSERT INTO sock_tag VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "3");
INSERT INTO sock_tag VALUES ("510a0d7e-8e83-4193-b483-e27e09ddc34d", "8");
INSERT INTO sock_tag VALUES ("510a0d7e-8e83-4193-b483-e27e09ddc34d", "9");
INSERT INTO sock_tag VALUES ("510a0d7e-8e83-4193-b483-e27e09ddc34d", "3");
INSERT INTO sock_tag VALUES ("03fef6ac-1896-4ce8-bd69-b798f85c6e0b", "10");
INSERT INTO sock_tag VALUES ("03fef6ac-1896-4ce8-bd69-b798f85c6e0b", "7");
INSERT INTO sock_tag VALUES ("d3588630-ad8e-49df-bbd7-3167f7efb246", "2");
INSERT INTO sock_tag VALUES ("d3588630-ad8e-49df-bbd7-3167f7efb246", "3");
INSERT INTO sock_tag VALUES ("819e1fbf-8b7e-4f6d-811f-693534916a8b", "3");
INSERT INTO sock_tag VALUES ("819e1fbf-8b7e-4f6d-811f-693534916a8b", "11");
INSERT INTO sock_tag VALUES ("819e1fbf-8b7e-4f6d-811f-693534916a8b", "4");
INSERT INTO sock_tag VALUES ("zzz4f044-b040-410d-8ead-4de0446aec7e", "1");
INSERT INTO sock_tag VALUES ("zzz4f044-b040-410d-8ead-4de0446aec7e", "11");
INSERT INTO sock_tag VALUES ("3395a43e-2d88-40de-b95f-e00e1502085b", "1");
INSERT INTO sock_tag VALUES ("3395a43e-2d88-40de-b95f-e00e1502085b", "4");
INSERT INTO sock_tag VALUES ("837ab141-399e-4c1f-9abc-bace40296bac", "1");
INSERT INTO sock_tag VALUES ("837ab141-399e-4c1f-9abc-bace40296bac", "11");
INSERT INTO sock_tag VALUES ("837ab141-399e-4c1f-9abc-bace40296bac", "3");

