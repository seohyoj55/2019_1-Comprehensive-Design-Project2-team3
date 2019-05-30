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

CREATE TABLE Doctor (
    DID INT(5) NOT NULL AUTO_INCREMENT,
    name CHAR(4) NOT NULL,
    telecom CHAR(13),
    address VARCHAR(50),
    gender ENUM('F', 'M') NOT NULL,
    birthDate DATE NOT NULL,
    qualification INT(5) NOT NULL,
    department VARCHAR(30),
    PW VARCHAR(15),
    PRIMARY KEY (DID)
);

CREATE TABLE Nurse (
    NID INT(5) NOT NULL AUTO_INCREMENT,
    name CHAR(4) NOT NULL,
    telecom CHAR(13),
    address VARCHAR(50),
    gender ENUM('F', 'M') NOT NULL,
    birthDate DATE NOT NULL,
    qualification INT(5) NOT NULL,
    department VARCHAR(30),
    PW VARCHAR(15),
    PRIMARY KEY (NID)
);

CREATE TABLE Patient (
    PID INT(5) NOT NULL AUTO_INCREMENT,
    name CHAR(4) NOT NULL,
    telecom CHAR(13),
    address VARCHAR(50),
    gender ENUM('F', 'M') NOT NULL,
    birthDate DATE NOT NULL,
    generalPractitioner INT(5),
    bloodtype ENUM('A', 'B', 'O', 'AB'),
    PRIMARY KEY (PID),
    FOREIGN KEY (generalPractitioner)
        REFERENCES Doctor (DID)
);

CREATE TABLE Examination (
    ExNo INT(5) NOT NULL AUTO_INCREMENT,
    PID INT(5) NOT NULL,
    DID INT(5) NOT NULL,
    Edate TIMESTAMP DEFAULT NOW(),
    imp VARCHAR(20),
    weight INT,
    height INT,
    Disability BOOLEAN,
    Drug BOOLEAN,
    family BOOLEAN,
    PH VARCHAR(50),
    opinion VARCHAR(500),
    PRIMARY KEY (ExNo),
    FOREIGN KEY (PID)
        REFERENCES Patient (PID),
    FOREIGN KEY (DID)
        REFERENCES Doctor (DID)
);

CREATE TABLE DocInput (
    DINo INT(5) NOT NULL AUTO_INCREMENT,
    PID INT(5) NOT NULL,
    DID INT(5) NOT NULL,
    Ddate TIMESTAMP DEFAULT NOW(),
    opinion VARCHAR(500),
    prescription VARCHAR(500),
    PRIMARY KEY (DINo),
    FOREIGN KEY (PID)
        REFERENCES Patient (PID),
    FOREIGN KEY (DID)
        REFERENCES Doctor (DID)
);

CREATE TABLE NurInput (
    NINo INT(5) NOT NULL AUTO_INCREMENT,
    PID INT(5) NOT NULL,
    NID INT(5) NOT NULL,
    Ndate TIMESTAMP DEFAULT NOW(),
    BP INT,
    RR INT,
    BT DECIMAL(3 , 1 ),
    PR INT,
    BS INT,
    IT INT,
    OP INT,
    SpO2 DECIMAL(3 , 1 ),
    PRIMARY KEY (NINo),
    FOREIGN KEY (PID)
        REFERENCES Patient (PID),
    FOREIGN KEY (NID)
        REFERENCES Nurse (NID)
);
