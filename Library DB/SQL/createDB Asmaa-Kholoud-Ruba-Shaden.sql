CREATE TABLE Publisher
(
  Pub_ID INT NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Pub_Name VARCHAR(50) NOT NULL,
  Website_URL VARCHAR,
  Pho_Number INT NOT NULL,
  Count_of_PBook NUMERIC NOT NULL,
  PRIMARY KEY (Pub_ID)
);

CREATE TABLE Classifcation
(
  ClasFic_ID INT NOT NULL,
  ClasFic_Type VARCHAR(50) NOT NULL,
  ClasFic_Descrip VARCHAR(200) NOT NULL,
  PRIMARY KEY (ClasFic_ID)
);

CREATE TABLE Author
(
  Auth_ID INT NOT NULL,
  Pho_Number INT,
  Count_of_ABook NUMERIC NOT NULL,
  BirthDate DATE,
  DeathDate DATE,
  Fname VARCHAR(20) NOT NULL,
  Lname VARCHAR(20) NOT NULL,
  PRIMARY KEY (Auth_ID)
);

CREATE TABLE Branch
(
  Bran_ID INT NOT NULL,
  Bran_Name VARCHAR(50) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  PRIMARY KEY (Bran_ID)
);

CREATE TABLE Staff
(
  Staff_Id INT NOT NULL,
  Pho_Number INT NOT NULL,
  Salary NUMERIC NOT NULL,
  Job_Title VARCHAR(50) NOT NULL,
  Fname VARCHAR(20) NOT NULL,
  Lname VARCHAR(20) NOT NULL,
  Bran_ID INT NOT NULL,
  PRIMARY KEY (Staff_Id),
  FOREIGN KEY (Bran_ID) REFERENCES Branch(Bran_ID)
);

CREATE TABLE Work_Record
(
  Start_Date DATE NOT NULL,
  Work_Hours NUMERIC NOT NULL,
  Permission VARCHAR(30) NOT NULL,
  H_Start_Date DATE NOT NULL,
  H_End_Date DATE NOT NULL,
  H_Duration INT NOT NULL,
  Staff_Id INT NOT NULL,
  PRIMARY KEY (Staff_Id),
  FOREIGN KEY (Staff_Id) REFERENCES Staff(Staff_Id)
);

CREATE TABLE Membership
(
  Mem_ID INT NOT NULL,
  Mem_Title VARCHAR(50) NOT NULL,
  Mem_Duration NUMERIC NOT NULL,
  Mem_Descrip VARCHAR(200) NOT NULL,
  Price FLOAT NOT NULL,
  PRIMARY KEY (Mem_ID)
);

CREATE TABLE Resources
(
  Reso_ID INT NOT NULL,
  Reso_number INT NOT NULL,
  URL_LInks VARCHAR NOT NULL,
  PRIMARY KEY (Reso_ID)
);

CREATE TABLE Client
(
  Clint_ID INT NOT NULL,
  Clinet_Role VARCHAR(50) NOT NULL,
  Pho_Number INT NOT NULL,
  C_Fname VARCHAR(20) NOT NULL,
  C_Lname VARCHAR(20) NOT NULL,
  Mem_ID INT NOT NULL,
  PRIMARY KEY (Clint_ID),
  FOREIGN KEY (Mem_ID) REFERENCES Membership(Mem_ID)
);

CREATE TABLE Loan_Recored
(
  L_Reco_Number INT NOT NULL,
  Loaned_Date DATE NOT NULL,
  Due_Date DATE NOT NULL,
  L_State VARCHAR(20) NOT NULL,
  Clint_ID INT NOT NULL,
  PRIMARY KEY (L_Reco_Number),
  FOREIGN KEY (Clint_ID) REFERENCES Client(Clint_ID)
);

CREATE TABLE Type
(
  Paper_Type VARCHAR(20) NOT NULL,
  Type_ID INT NOT NULL,
  PRIMARY KEY (Type_ID)
);

CREATE TABLE Rooms
(
  Room_Number INT NOT NULL,
  State VARCHAR(20) NOT NULL,
  Duration FLOAT NOT NULL,
  Type VARCHAR(15) NOT NULL,
  Bran_ID INT NOT NULL,
  PRIMARY KEY (Room_Number),
  FOREIGN KEY (Bran_ID) REFERENCES Branch(Bran_ID)
);

CREATE TABLE Fines
(
  State VARCHAR(20) NOT NULL,
  Due_Date DATE NOT NULL,
  Amount FLOAT NOT NULL,
  Description_ VARCHAR(150),
  L_Reco_Number INT NOT NULL,
  PRIMARY KEY (L_Reco_Number),
  FOREIGN KEY (L_Reco_Number) REFERENCES Loan_Recored(L_Reco_Number)
);

CREATE TABLE R_Available_in
(
  Reso_ID INT NOT NULL,
  Type_ID INT NOT NULL,
  PRIMARY KEY (Reso_ID, Type_ID),
  FOREIGN KEY (Reso_ID) REFERENCES Resources(Reso_ID),
  FOREIGN KEY (Type_ID) REFERENCES Type(Type_ID)
);

CREATE TABLE CanAccess_R
(
  Clint_ID INT NOT NULL,
  Reso_ID INT NOT NULL,
  PRIMARY KEY (Clint_ID, Reso_ID),
  FOREIGN KEY (Clint_ID) REFERENCES Client(Clint_ID),
  FOREIGN KEY (Reso_ID) REFERENCES Resources(Reso_ID)
);

CREATE TABLE Visit
(
  Clint_ID INT NOT NULL,
  Bran_ID INT NOT NULL,
  PRIMARY KEY (Clint_ID, Bran_ID),
  FOREIGN KEY (Clint_ID) REFERENCES Client(Clint_ID),
  FOREIGN KEY (Bran_ID) REFERENCES Branch(Bran_ID)
);

CREATE TABLE Branch_Pho_Number
(
  Pho_Number INT NOT NULL,
  Bran_ID INT NOT NULL,
  PRIMARY KEY (Pho_Number, Bran_ID),
  FOREIGN KEY (Bran_ID) REFERENCES Branch(Bran_ID)
);

CREATE TABLE Resources_Referenc_Books
(
  Referenc_Books INT NOT NULL,
  Reso_ID INT NOT NULL,
  PRIMARY KEY (Referenc_Books, Reso_ID),
  FOREIGN KEY (Reso_ID) REFERENCES Resources(Reso_ID)
);

CREATE TABLE Book
(
  ISBN VARCHAR(50) NOT NULL,
  Book_Title VARCHAR(100) NOT NULL,
  State VARCHAR(20) NOT NULL,
  Book_ID INT NOT NULL,
  Pub_Date DATE NOT NULL,
  Rate VARCHAR(20) NOT NULL,
  Version_number INT NOT NULL,
  Copies_Count NUMERIC NOT NULL,
  Pages_Count NUMERIC NOT NULL,
  Pub_ID INT NOT NULL,
  PRIMARY KEY (Book_ID),
  FOREIGN KEY (Pub_ID) REFERENCES Publisher(Pub_ID),
  UNIQUE (ISBN)
);

CREATE TABLE B_Available_in
(
  Type_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  PRIMARY KEY (Type_ID, Book_ID),
  FOREIGN KEY (Type_ID) REFERENCES Type(Type_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE B_Has_Class
(
  Book_ID INT NOT NULL,
  ClasFic_ID INT NOT NULL,
  PRIMARY KEY (Book_ID, ClasFic_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
  FOREIGN KEY (ClasFic_ID) REFERENCES Classifcation(ClasFic_ID)
);

CREATE TABLE B_Has_R
(
  Book_ID INT NOT NULL,
  Reso_ID INT NOT NULL,
  PRIMARY KEY (Book_ID, Reso_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
  FOREIGN KEY (Reso_ID) REFERENCES Resources(Reso_ID)
);

CREATE TABLE Written_by
(
  Book_ID INT NOT NULL,
  Auth_ID INT NOT NULL,
  PRIMARY KEY (Book_ID, Auth_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
  FOREIGN KEY (Auth_ID) REFERENCES Author(Auth_ID)
);

CREATE TABLE Provide
(
  Bran_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  PRIMARY KEY (Bran_ID, Book_ID),
  FOREIGN KEY (Bran_ID) REFERENCES Branch(Bran_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);

CREATE TABLE CanAccess_B
(
  Clint_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  PRIMARY KEY (Clint_ID, Book_ID),
  FOREIGN KEY (Clint_ID) REFERENCES Client(Clint_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);


