#Patient Table
CREATE TABLE Patient( /*환자 초기 정보*/
PID int(5) NOT NULL,
name char(4) NOT NULL,
telecom int(11),
address varchar(50);
gender enum('F','M') NOT NULL,
birthDate int(8) NOT NULL,
generalPractitioner char(4),
bloodtype enum('A','B','O','AB'),
PRIMARY KEY(PID)
);

#Doctor Table
CREATE TABLE Doctor( /*의사 초기 정보*/
DID int(5) NOT NULL,
name char(4) NOT NULL,
telecom int(11),
address varchar(50);
gender enum('F','M') NOT NULL,
birthDate int(8) NOT NULL,
qualification int(5) NOT NULL,
department varchar(30),
PRIMARY KEY(DID)
);

#Nurse Table
CREATE TABLE Nurse( /*간호사 초기 정보*/
NID int(5) NOT NULL,
name char(4) NOT NULL,
telecom int(11),
address varchar(50),
gender enum('F','M') NOT NULL,
birthDate int(8) NOT NULL,
qualification int(5) NOT NULL,
PRIMARY KEY(NID)
);

#Examination Table


#Doctor's Input Table

#Nurse's Input Table
