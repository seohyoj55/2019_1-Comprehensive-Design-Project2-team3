#Patient Table
CREATE TABLE Patient(                             /*환자 초기 정보*/
PID int(5) NOT NULL,                              /*환자 아이디*/
name char(4) NOT NULL,                            /*환자 이름*/
telecom int(11),                                  /*환자 전화번호*/
address varchar(50);                              /*환자 주소*/
gender enum('F','M') NOT NULL,                    /*환자 성별*/
birthDate int(8) NOT NULL,                        /*환자 생년월일*/
generalPractitioner char(4),                      /*배정된 주치의*/
bloodtype enum('A','B','O','AB'),                 /*환자 혈액형*/
PRIMARY KEY(PID)              
);              
              
#Doctor Table             
CREATE TABLE Doctor(                              /*의사 초기 정보*/
DID int(5) NOT NULL,                              /*의사 아이디*/
name char(4) NOT NULL,                            /*의사 이름*/
telecom int(11),                                  /*의사 전화번호*/
address varchar(50);                              /*의사 주소*/
gender enum('F','M') NOT NULL,                    /*의사 성별*/
birthDate int(8) NOT NULL,                        /*의사 생년월일*/
qualification int(5) NOT NULL,                    /*의사 면허번호*/
department varchar(30),                           /*의사 진료과목*/
PRIMARY KEY(DID)              
);              
              
#Nurse Table              
CREATE TABLE Nurse(                               /*간호사 초기 정보*/
NID int(5) NOT NULL,                              /*간호사 아이디*/
name char(4) NOT NULL,                            /*간호사 이름*/
telecom int(11),                                  /*간호사 전화번호*/
address varchar(50),                              /*간호사 주소*/
gender enum('F','M') NOT NULL,                    /*간호사 성별*/
birthDate int(8) NOT NULL,                        /*간호사 생년월일*/
qualification int(5) NOT NULL,                    /*간호사 면허번호*/
PRIMARY KEY(NID)
);

#Examination Table
CREATE TABLE Examination(                         /*문진 목록*/
EXID int(5), NOT NULL,                            /*문진 번호*/
PID int(5), NOT NULL,                             /*환자 번호*/
Edate DATE NOT NULL,                              /*일시*/
writer char(4),                                   /*작성자*/
imp varchar(20),                                  /*진단명*/
BP int,                                           /*혈압*/
RR int,                                           /*호흡수*/
BT int,                                           /*체온*/
PR int,                                           /*맥박*/
weight int,                                       /*체중*/
height int,                                       /*신장*/
Disability boolean,                               /*장애유무*/
Drug boolean,                                     /*투약 or 복용약물 유무*/
family boolean,                                   /*가족병력 유무*/
LOC enum('AL','DR','ST','SE','CO'),               /*의식상태-명료(AL), 기면(DR), 혼미(ST), 반혼수(SE), 혼수(CO)*/
PH varchar(50),                                   /*과거력*/
PRIMARY KEY(EXID),
FOREIGN KEY(PID) REFERENCES Patient(PID)
);

#Doctor's Input Table

#Nurse's Input Table
