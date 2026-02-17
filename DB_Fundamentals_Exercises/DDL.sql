use Holiday
--CREATE TABLE tourist
--(
--touristid INT
-- CONSTRAINT conPKTouristid PRIMARY KEY identity(1,1),

---- conPKTouristid is the name of the constraint

--tourName CHAR (20) not null,

--tourFirstN char(20),

--tourGender char(1)
-- constraint chgesl check(tourGender in ('M','F'))
-- constraint condfGender default('M') , -- meerdere constraints op 1 kolom, automatisch man als er niks is ingevuld

--tourGebdate DATE
-- check(tourGebdate < getdate()),

--tourPaspnr char(20) constraint conUNpasprnr unique
--)

------------------------------------------------------------------------------------------------------------------------

--CREATE TABLE Hotel 
--( 
--hotelId int identity(1,1) NOT NULL PRIMARY KEY, 
 
--hotelName CHAR(20) UNIQUE, 
 
--hotelcapacity int  
--); 

------------------------------------------------------------------------------------------------------------------------

--CREATE TABLE Room 
--( 
--roomId SMALLINT PRIMARY KEY identity(1,1), 
 
--roomNr VARCHAR(5)constraint chRoomNr  
-- check(RoomNr like '[A-Z][A-Z][0-9][0-9][0-9]') 
-- constraint conRoomNr unique, 
 
--roomPriceDay decimal(6,2)  
-- constraint conCHRoomPriceDay 
-- check(RoomPriceDay > 100) 
-- constraint conDefRoomPriceDay default(105), 
 
--roomCapac smallint  
-- constraint chRoomCap 
--     check(RoomCapac > 0 and RoomCapac < 5) , 
 
--hotelid int foreign key references Hotel(HotelId) 
--); 

------------------------------------------------------------------------------------------------------------------------

--CREATE TABLE Stay 
--( 
--stayId SMALLINT PRIMARY KEY  identity(1,1), 
 
--startdtm DATETIME not null, 
 
--einddtm DATETIME not null, 
 
--roomid smallint foreign key references Room(roomId) NOT NULL , 
 
--DayPrice decimal(6,2), 
 
--touristid INT foreign key references Tourist(touristid)NOT 
--NULL 
--);

------------------------------------------------------------------------------------------------------------------------

