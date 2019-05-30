SET @tables = NULL;
SELECT
    GROUP_CONCAT(table_schema, '.', table_name)
INTO @tables FROM
    information_schema.tables
WHERE
    table_schema = 'emr_db'; -- specify DB name here.

SET @tables = CONCAT('DROP TABLE ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

CREATE TABLE Doctor (                                                      /*의사 초기 정보*/
    DID INT(5) NOT NULL AUTO_INCREMENT,                   /*의사 아이디*/
    name CHAR(4) NOT NULL,                                              /*의사 이름*/
    telecom CHAR(13),                                                           /*의사 전화번호*/
    address VARCHAR(50),                                                    /*의사 주소*/
    gender ENUM('F', 'M') NOT NULL,                                  /*의사 성별*/
    birthDate DATE NOT NULL,                                             /*의사 생년월일*/
    qualification INT(5) NOT NULL,                                      /*의사 면허번호*/
    department VARCHAR(30),                                            /*의사 진료과목*/
    PW VARCHAR(15),                                                            /*의사 비밀번호*/
    PRIMARY KEY (DID) 
);

CREATE TABLE Nurse (                                                       /*간호사 초기 정보*/
    NID INT(5) NOT NULL AUTO_INCREMENT,                  /*간호사 아이디*/
    name CHAR(4) NOT NULL,                                              /*간호사 이름*/
    telecom CHAR(13),                                                          /*간호사 전화번호*/
    address VARCHAR(50),                                                   /*간호사 주소*/
    gender ENUM('F', 'M') NOT NULL,                                 /*간호사 성별*/
    birthDate DATE NOT NULL,                                            /*간호사 생년월일*/
    qualification INT(5) NOT NULL,                                     /*간호사 면허번호*/
    department VARCHAR(30),                                           /*간호사 진료과목*/
    PW VARCHAR(15),                                                          /*간호사 비밀번호*/
    PRIMARY KEY (NID)
);

CREATE TABLE Patient (                                                    /*환자 초기 정보*/  
    PID INT(5) NOT NULL AUTO_INCREMENT,                 /*환자 아이디*/
    name CHAR(4) NOT NULL,                                            /*환자 이름*/
    telecom CHAR(13),                                                         /*환자 전화번호*/   
    address VARCHAR(50),                                                 /*환자 주소*/        
    gender ENUM('F', 'M') NOT NULL,                               /*환자 성별*/              
    birthDate DATE NOT NULL,                                         /*환자 생년월일*/          
    generalPractitioner INT(5),                                         /*배정된 주치의*/                  
    bloodtype ENUM('A', 'B', 'O', 'AB'),                               /*환자 혈액형*/            
    PRIMARY KEY (PID),                                            
    FOREIGN KEY (generalPractitioner)                               
        REFERENCES Doctor (DID)                                               
);

CREATE TABLE Examination (                                              /*문진 목록*/
    ExNo INT(5) NOT NULL AUTO_INCREMENT,                 /*문진 번호*/
    PID INT(5) NOT NULL,                                                        /*환자 번호*/
    DID INT(5) NOT NULL,                                                        /*의사 번호*/
    Edate TIMESTAMP DEFAULT NOW(),                             /*일시*/
    imp VARCHAR(20),                                                             /*진단명*/
    weight INT,                                                                          /*체중*/
    height INT,                                                                           /*신장*/
    Disability BOOLEAN,                                                          /*장애유무*/
    Drug BOOLEAN,                                                                 /*투약 or 복용약물 유무*/
    family BOOLEAN,                                                               /*가족병력 유무*/
    PH VARCHAR(50),                                                              /*과거력*/
    opinion VARCHAR(500),                                                   /*의사 소견*/
    PRIMARY KEY (ExNo),
    FOREIGN KEY (PID)
        REFERENCES Patient (PID),
    FOREIGN KEY (DID)
        REFERENCES Doctor (DID)
);

CREATE TABLE DocInput (                                                  /*의사 입력*/
    DINo INT(5) NOT NULL AUTO_INCREMENT,                /*일반진료 번호*/
    PID INT(5) NOT NULL,                                                      /*환자 번호*/
    DID INT(5) NOT NULL,                                                      /*의사 번호*/
    Ddate TIMESTAMP DEFAULT NOW(),                           /*일시*/
    opinion VARCHAR(500),                                                  /*의사 소견*/
    prescription VARCHAR(500),                                         /*의사 처방*/
    PRIMARY KEY (DINo),
    FOREIGN KEY (PID)
        REFERENCES Patient (PID),
    FOREIGN KEY (DID)
        REFERENCES Doctor (DID)
);

CREATE TABLE NurInput (                                                  /*간호사 입력*/
    NINo INT(5) NOT NULL AUTO_INCREMENT,                /*바이탈 체크 번호*/
    PID INT(5) NOT NULL,                                                      /*환자 번호*/
    NID INT(5) NOT NULL,                                                      /*간호사 번호*/
    Ndate TIMESTAMP DEFAULT NOW(),                          /*일시*/
    BP INT,                                                                               /*혈압*/
    RR INT,                                                                               /*호흡수*/
    BT DECIMAL(3 , 1 ),                                                         /*체온*/
    PR INT,                                                                               /*맥박*/
    BS INT,                                                                              /*혈당량*/
    IT INT,                                                                                /*섭취량*/
    OP INT,                                                                              /*배설량*/
    SpO2 DECIMAL(3 , 1 ),                                                   /*산소 포화도*/
    PRIMARY KEY (NINo),
    FOREIGN KEY (PID)
        REFERENCES Patient (PID),
    FOREIGN KEY (NID)
        REFERENCES Nurse (NID)
);
