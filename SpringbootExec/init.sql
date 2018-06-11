/*
-- Query: SELECT * FROM test.user
LIMIT 0, 1000

-- Date: 2017-11-05 21:56
*/
INSERT INTO `user` (`id`,`account`,`nickname`,`password`) VALUES (1,'admin','Admin','admin');



INSERT INTO `course` (`sn`,`caption`,`path`,`teacher_account`) VALUES ('1','Matrix Computations','matrixcomputations','admin');
INSERT INTO `course` (`sn`,`caption`,`path`,`teacher_account`) VALUES ('2','DATA Analysis','dataanalysis','admin');
INSERT INTO `course` (`sn`,`caption`,`path`,`teacher_account`) VALUES ('3','Linear algebra','linearalgebra','admin');
INSERT INTO `course` (`sn`,`caption`,`path`,`teacher_account`) VALUES ('5','Numerical PDE','numericalpde','admin');
INSERT INTO `course` (`sn`,`caption`,`path`,`teacher_account`) VALUES ('6','Probability Theory','probabilitytheory','admin');



INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (1,'Matrix Computations','Chapter_01','','Chapter_01.pptx','第1章','',1);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (2,'Matrix Computations','Chapter_02','','Chapter_02.pptx','第2章','',2);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (3,'Matrix Computations','Chapter_03','','Chapter_03.pptx','第3章','',3);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (4,'Matrix Computations','Chapter_04','','Chapter_04.pptx','第4章','',4);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (5,'Matrix Computations','Chapter_05','','Chapter_05.pptx','第5章','',5);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (6,'Matrix Computations','Chapter_06','','Chapter_06.pptx','第6章','',6);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (7,'Matrix Computations','Chapter_07','','Chapter_07.pptx','第7章','',7);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (8,'Matrix Computations','Chapter_08','','Chapter_08.pptx','第8章','',8);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (9,'Matrix Computations','Chapter_09','','Chapter_09.pptx','第9章','',9);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (10,'Matrix Computations','Chapter_10','','Chapter_10.pptx','第10章','',10);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (11,'Matrix Computations','Chapter_11','','Chapter_11.pptx','第11章','',11);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (12,'Matrix Computations','Chapter_12','','Chapter_12.pptx','第12章','',12);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (13,'Matrix Computations','Chapter_13','','Chapter_13.pptx','第13章','',13);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (14,'Matrix Computations','Chapter_14','','Chapter_14.pptx','第14章','',14);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (15,'Matrix Computations','Chapter_15','','Chapter_15.pptx','第15章','',15);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (16,'Matrix Computations','Chapter_16','','Chapter_16.pptx','第16章','',16);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (17,'Matrix Computations','Chapter_17','','Chapter_17.pptx','第17章','',17);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (18,'Matrix Computations','Chapter_18','','Chapter_18.pptx','第18章','',18);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (19,'Matrix Computations','Chapter_19','','Chapter_19.pptx','第19章','',19);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (20,'Matrix Computations','Chapter_20','','Chapter_20.pptx','第20章','',20);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (21,'Matrix Computations','Chapter_21','','Chapter_21.pptx','第21章','',21);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (22,'Matrix Computations','Chapter_22','','Chapter_22.pptx','第22章','',22);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (23,'Matrix Computations','Chapter_23','','Chapter_23.pptx','第23章','',23);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (24,'Matrix Computations','AppendixA','','AppendixA.pptx','附录A','',24);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (25,'Matrix Computations','AppendixB','','AppendixB.pptx','附录B','',25);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (26,'Matrix Computations','AppendixC','','AppendixC.pptx','附录C','',26);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (27,'DATA Analysis','Chapter_01','','1.doc','第1章','',1);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (28,'DATA Analysis','Chapter_02','','2.pdf','第2章','',2);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (29,'DATA Analysis','Chapter_03','','3.pdf','第3章','',3);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (30,'DATA Analysis','Chapter_04','','4.pdf','第4章','',4);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (31,'DATA Analysis','Chapter_05','','5.pdf','第5章','',5);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (32,'DATA Analysis','Chapter_06','','6.pdf','第6章','',6);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (33,'DATA Analysis','Chapter_07','','7.pdf','第7章','',7);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (34,'DATA Analysis','Chapter_08','','8.pdf','第8章','',8);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (35,'DATA Analysis','Chapter_09','','9.pdf','第9章','',9);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (36,'DATA Analysis','Chapter_10','','10.pdf','第10章','',10);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (37,'Linear algebra','Matrices and Systems of Equations','','LinearA1.pdf','第1章','',1);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (38,'Linear algebra','Determinants','','LinearA2.pdf','第2章','',2);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (39,'Linear algebra','Vector Spaces','','LinearA3.pdf','第3章','',3);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (40,'Linear algebra','Linear Transformations','','LinearA4.pdf','第4章','',4);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (41,'Numerical PDE','Overview of PDEs','','1.pdf','第1章','',1);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (42,'Numerical PDE','Explicit methods for 1-D heat','','2.pdf','第2章','',2);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (43,'Numerical PDE','Implicit methods for 1-D heat','','3.pdf','第3章','',3);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (44,'Numerical PDE','Jacobi method','','4.pdf','第4章','',4);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (45,'Numerical PDE','2-D Finite Difference','','5.pdf','第5章','',5);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (46,'Numerical PDE','Analytical solutions to 1-DWave equation','','6.pdf','第6章','',6);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (47,'Numerical PDE','Flux conservative problems','','7.pdf','第7章','',7);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (48,'Numerical PDE','Numerical Solution of 1-D and 2-D Wave Equation','','8.pdf','第8章','',8);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (49,'Numerical PDE','Finite element method','','9.pdf','第9章','',9);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (50,'Numerical PDE','Example','','10.pdf','第10章','',10);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (51,'Numerical PDE','Example','','11.pdf','第11章','',11);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (52,'Numerical PDE','Example','','12.pdf','第12章','',12);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (53,'Probability Theory','Chapter 02','','ch2_12.pdf','第2章(1-2)','',1);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (54,'Probability Theory','Chapter 02','','ch2_34.pdf','第2章(3-4)','',2);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (55,'Probability Theory','Chapter 02','','ch2_5678.pdf','第2章(5-8)','',3);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (56,'Probability Theory','Chapter 03','','ch3_123.pdf','第3章(1-3)','',4);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (57,'Probability Theory','Chapter 03','','ch3_4.pdf','第3章(4)','',5);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (58,'Probability Theory','Chapter 04','','ch4_1.pdf','第4章(1)','',6);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (59,'Probability Theory','Chapter 04','','ch4_23.pdf','第4章(2-3)','',7);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (60,'Probability Theory','Chapter 04','','ch4_4.pdf','第4章(4)','',8);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (61,'Probability Theory','Chapter 05','','ch5.pdf','第5章','',9);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (62,'Probability Theory','Chapter 06','','ch6_12.pdf','第6章(1-2)','',10);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (63,'Probability Theory','Chapter 06','','ch6_3.pdf','第6章(3)','',11);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (64,'Probability Theory','Chapter 06','','ch6_4.pdf','第6章(4)','',12);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (65,'Probability Theory','Chapter 06','','ch6_567.pdf','第6章(567)','',13);
INSERT INTO `course_resource` (`id`,`course_caption`,`description`,`plan_filename`,`ppt_filename`,`title`,`video_filename`,`xh`) VALUES (66,'Probability Theory','Chapter 07','','ch7.pdf','第7章','',14);
