
/*insertion code*/
INSERT INTO Publisher VALUES (104,'British','P-open source','www.P_open_source.com',+441134397203,4);
INSERT INTO Publisher VALUES  (105,'Saudi Arabia','S-kingdome','www.S_kingdome.com',+9665374297540,8);
INSERT INTO Publisher VALUES  (106,'Kuwait','The Gold','www.The-Gold.com',+9651534397203,4);
INSERT INTO Publisher VALUES  (107,'America','Falcon','www.Falcon.com',+17047645571,7);
INSERT INTO Publisher VALUES  (108,'Egypt','The Stars','www.TheStars.com',+201234897203,3);
    
    _________________________________________________________
    
INSERT INTO Book VALUES('978-1-60819-046-1','the scar of david','Available',550,'1998-10-1','7',2,5,325,108);
INSERT INTO Book VALUES('0-385-50420-9','The Davinci code','Available',666,'2003/10/20','8',2,3,496,107);
INSERT INTO Book VALUES('0-425-15225-1','Sophie world','Unavailable',777,'1995/5/1','9',3,1,552,104);
INSERT INTO Book VALUES('0-684-87058-4','Malignant Sadness: The Anatomy Of Depression','Available',626,'1999/7/25','9',4,2,332,107);
INSERT INTO Book VALUES('978-8501-03-1','fear','Available',101,'2015/11/16','5',2,6,302,105);
INSERT INTO Book VALUES('978-0805-07-974-0','Through the Language Glass','Available',707,'2010/10/1','9',2,5,334,104);
INSERT INTO Book VALUES('978-614-01-0523-2','The bamboo Stalk','Unavailable',143,'2012/5/15','5',2,4,396,106);
     _________________________________________________________
     
INSERT INTO Author VALUES(01,+2012758982874,7,'1970/6/3',NULL,'Susan','Abulhawa');
INSERT INTO Author VALUES(02,+170478453601,7,'1964/6/22',NULL,'Dan','Brown');
INSERT INTO Author VALUES(03,+441132399785,19,'1952/8/8',NULL,'Jostein','Gaarder');
INSERT INTO Author VALUES(04,+170488465790,8,'1929/10/19',NULL,'Lewis','Wolpert');
INSERT INTO Author VALUES(05,+9665314295330,17,'1977/3/5',NULL,'Ossama','Almuslim');
INSERT INTO Author VALUES(06,+9665821053984,3,'1969/8/9',NULL,'Guy','Deutscher');
INSERT INTO Author VALUES(07,+9665321055849,5,'1981/6/2',NULL,'Saud','Alsanousi');

     _________________________________________________________
     
INSERT INTO Written_by VALUES(550,01);
INSERT INTO Written_by VALUES(666,02);
INSERT INTO Written_by VALUES(777,03);
INSERT INTO Written_by VALUES(626,04);
INSERT INTO Written_by VALUES(101,05);
INSERT INTO Written_by VALUES(707,06);
INSERT INTO Written_by VALUES(143,07);


/*to test view*/

SELECT *
FROM vBookStatus;
