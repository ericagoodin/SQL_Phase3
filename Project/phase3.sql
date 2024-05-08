CREATE TABLE COMPANY (
    CName VARCHAR(50) NOT NULL, -- Increased length to accommodate longer company names
    County CHAR(2) NOT NULL, -- Assuming a two-letter county code
    PRIMARY KEY (CName)
);

CREATE TABLE FACILITY (
    FNumber VARCHAR(8) NOT NULL,
    Phone VARCHAR(10), -- Changed length to 10 for 10-digit phone numbers
    City VARCHAR(50) NOT NULL, -- Increased length to accommodate longer city names
    Zip CHAR(5) NOT NULL, -- Changed data type to CHAR(5) for 5-digit zip codes
    St_Address VARCHAR(100), -- Increased length to accommodate longer addresses
    Suite VARCHAR(15),
    CName VARCHAR(50) NOT NULL,
    PRIMARY KEY (FNumber),
    FOREIGN KEY (CName) REFERENCES COMPANY(CName)
);

CREATE TABLE PROGRAM (
    Capacity INT, 
    PName VARCHAR(100), -- Increased length to accommodate longer program names
    PID VARCHAR(8) NOT NULL PRIMARY KEY, -- Added AUTO_INCREMENT for primary key
    FNumber VARCHAR(8),
    FOREIGN KEY (FNumber) REFERENCES FACILITY(FNumber)
);

CREATE TABLE SERVICE (
    SType VARCHAR(9) NOT NULL,
    Available_Spots INT CHECK (Available_Spots >= 0), -- Added CHECK constraint for non-negative spots
    PID VARCHAR(8) NOT NULL,
    PRIMARY KEY (SType,PID),
    FOREIGN KEY (PID) REFERENCES PROGRAM(PID)
);

CREATE TABLE POPULATION (
    PType VARCHAR(15),
    Occupancy INT CHECK (Occupancy >= 0), -- Added CHECK constraint for non-negative occupancy
    PID VARCHAR(8) NOT NULL,
    PRIMARY KEY (PType,PID),
    FOREIGN KEY (PID) REFERENCES PROGRAM(PID)
);

CREATE TABLE FACILITY_LOCATIONS (
    FNumber VARCHAR(8) NOT NULL,
    State CHAR(2) NOT NULL, 
    PRIMARY KEY (FNumber, State),
    FOREIGN KEY (FNumber) REFERENCES FACILITY(FNumber)
);

