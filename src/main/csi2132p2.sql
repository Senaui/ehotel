CREATE TABLE hotelchain
(
    addressofcentraloffice VARCHAR(100) PRIMARY KEY,
    totalHotel             INTEGER,
    email                  VARCHAR(50),
    phoneNum               VARCHAR(20)
);

CREATE TABLE hotel
(
    address                VARCHAR(50) PRIMARY KEY,
    category               INTEGER CHECK (category BETWEEN 1 AND 5),
    area                   INTEGER CHECK (category BETWEEN 1 AND 8),
    totalRoom              INTEGER,
    email                  VARCHAR(50),
    phoneNum               VARCHAR(20),
    addressOfCentralOffice VARCHAR(100),
    FOREIGN KEY (addressOfCentralOffice) REFERENCES hotelchain (addressofcentraloffice)
);

CREATE TABLE room
(
    roomID      INTEGER PRIMARY KEY,
    roomNum     INTEGER,
    price       FLOAT,
    amenity     TEXT,
    capacity    INTEGER,
    description TEXT,
    status      VARCHAR(10) CHECK (status IN ('booked', 'available')),
    viewofroom  VARCHAR(50),
    addingBed   INTEGER CHECK (addingBed >= 0),
    hAddress    VARCHAR(50),
    FOREIGN KEY (hAddress) REFERENCES hotel (address)
);

CREATE TABLE person
(
    email    VARCHAR(50) PRIMARY KEY,
    fullName VARCHAR(50),
    pAddress VARCHAR(100)
);

CREATE TABLE manager
(
    email    VARCHAR(50),
    hAddress VARCHAR(50),
    FOREIGN KEY (hAddress) REFERENCES hotel (address),
    FOREIGN KEY (email) REFERENCES person (email)
);

CREATE TABLE employee
(
    email          VARCHAR(50),
    roleofemployee TEXT,
    FOREIGN KEY (email) REFERENCES person (email)
);

CREATE TABLE customer
(
    email        VARCHAR(50) UNIQUE,
    registerDate DATE,
    FOREIGN KEY (email) REFERENCES person (email)
);

CREATE TABLE record
(
    recordID    INTEGER PRIMARY KEY,
    bookingDate Date,
    startDate   DATE,
    endDate     DATE,
    roomID     INTEGER,
    eemail      VARCHAR(50),
    cemail      VARCHAR(50),
    payment     FLOAT,
    FOREIGN KEY (eemail) REFERENCES person (email),
    FOREIGN KEY (cemail) REFERENCES person (email),
    FOREIGN KEY (roomNum) REFERENCES room (roomNum)
);

CREATE TABLE changeroomstatus
(
    roomID INTEGER,
    status  VARCHAR(10) CHECK (status IN ('booked', 'available')),
    FOREIGN KEY (roomID) REFERENCES room (roomNum)
);




-- Add employees
INSERT INTO person (email, fullName, pAddress)
VALUES ('987654321', 'Jane Doe', '456 Oak Ave');

INSERT INTO employee (email, roleofemployee)
VALUES ('987654321', 'Front Desk');

INSERT INTO person (email, fullName, pAddress)
VALUES ('900004321', 'John Han', '88 Ike Street');

INSERT INTO employee (email, roleofemployee)
VALUES ('900004321', 'Front Desk');

INSERT INTO person (email, fullName, pAddress)
VALUES ('94523520', 'Patrick June', '81 Claudia Street');

INSERT INTO employee (email, roleofemployee)
VALUES ('94523520', 'Floor Manager');

-- Add a customer
INSERT INTO person (email, fullName, pAddress)
VALUES ('111222333', 'Alice Johnson', '789 Elm St');

INSERT INTO customer (email, registerDate)
VALUES ('111222333', '2022-03-26');


-- Hotel Chain 1
INSERT INTO hotelchain(addressofcentraloffice, totalHotel, email, phoneNum)
VALUES ('123 Rideau Street', 8, 'hotelchain1@gmail.com', '123-456-7890');

-- Hotel 1
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('1000 Bay Street', 3, 1, 5, 'hotel1@hotelchain1.com', '416-143-4537', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (101, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 2, 'Standard room with 1 double bed', 'available', 'city', 1,
        '1000 Bay Street'),
       (102, 250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Deluxe room with 2 double beds', 'booked',
        'ocean',
        0, '1000 Bay Street'),
       (103, 350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 4, 'Family room with 2 double beds', 'available',
        'mountain', 0, '1000 Bay Street'),
       (104, 100, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Economy room with 1 emailgle bed', 'available', 'city',
        0,
        '1000 Bay Street'),
       (105, 300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 1 double bed and ocean view', 'booked', 'ocean', 1, '1000 Bay Street');

-- Hotel 2
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('2000 Bay Street', 5, 2, 5, 'hotel2@hotelchain1.com', '416-294-5178', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (201, 1200, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Standard room with 1 double bed', 'available',
        'city', 0, '2000 Bay Street'),
       (202, 2150, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 1, '2000 Bay Street'),
       (203, 3510, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'booked',
        'mountain', 0, 200, '2000 Bay Street'),
       (204, 4100, 'Free Wi-Fi, TV, Air conditioning', 4, 'Family room with 4 emailgle beds', 'booked', 'city', 0,
        '2000 Bay Street'),
       (205, 5300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 3 double beds and ocean view', 'available', 'ocean', 0, '2000 Bay Street');

-- Hotel 3
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('3000 Yonge Street', 4, 3, 5, 'hotel3@hotelchain1.com', '456-345-4789', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (301, 1300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Standard room with 1 double bed', 'booked',
        'ocean',
        0, '3000 Yonge Street'),
       (302, 1250, 200, 'Free Wi-Fi, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 1,
        '3000 Yonge Street'),
       (303, 3150, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '3000 Yonge Street'),
       (304, 2100, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 5, 'Economy room with 5 emailgle beds', 'booked',
        'city',
        0, '3000 Yonge Street'),
       (305, 3100, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 4,
        'Luxury room with 2 double beds and ocean view', 'available', 'ocean', 0, '3000 Yonge Street');

-- Hotel 4
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('4000 Dundas Street', 2, 4, 5, 'hotel4@hotelchain1.com', '416-456-7550', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (401, 200, 200, 'Free Wi-Fi, Air conditioning', 2, 'Standard room with 2 double beds', 'available', 'city', 0,
        '4000 Dundas Street'),
       (402, 250, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Deluxe room with 2 double beds', 'available', 'city', 0,
        '4000 Dundas Street'),
       (403, 350, 200, 'Free TV, Air conditioning', 1, 'emailgle room with 1 emailgle bed', 'available', 'city', 0,
        '4000 Dundas Street'),
       (404, 100, 200, 'Free Wi-Fi, TV', 4, 'Family room with 2 double beds', 'booked', 'city', 0,
        '4000 Dundas Street'),
       (405, 300, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds', 'booked', 'city', 0,
        '4000 Dundas Street');

-- Hotel 5
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('5000 Somerset Street', 1, 5, 5, 'hotel5@hotelchain1.com', '416-327-8901', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (501, 210, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'city', 0,
        '5000 Somerset Street'),
       (502, 250, 200, 'Free Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'city', 0,
        '5000 Somerset Street'),
       (503, 170, 200, 'Free Air conditioning', 3, 'Economy room with 1 double bed', 'available', 'city', 0,
        '5000 Somerset Street'),
       (504, 370, 200, 'Free Air conditioning', 4, 'Family room with 2 double beds', 'available', 'city', 0,
        '5000 Somerset Street'),
       (505, 400, 200, 'Free Air conditioning', 5, 'Luxury room with 2 double beds', 'available', 'city', 1,
        '5000 Somerset Street');

-- Hotel 6
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('6000 Elgin Street', 3, 6, 5, 'hotel6@hotelchain1.com', '416-678-2342', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (601, 1200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain', 1,
        '6000 Elgin Street'),
       (602, 2250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'booked',
        'ocean',
        0, '6000 Elgin Street'),
       (603, 2150, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'ocean', 0, '6000 Elgin Street'),
       (604, 1100, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'mountain',
        0,
        '6000 Elgin Street'),
       (605, 1230, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5, 'Luxury room with 2 double beds',
        'booked',
        'ocean', 1, '6000 Elgin Street');

-- Hotel 7
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('7000 Danforth Avenue', 5, 7, 5, 'hotel7@hotelchain1.com', '416-789-1203', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (701, 5200, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Standard room with 1 double bed', 'booked',
        'mountain', 5, '7000 Danforth Avenue'),
       (702, 5250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 5, '7000 Danforth Avenue'),
       (703, 6350, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available',
        'mountain', 5,
        '7000 Danforth Avenue'),
       (704, 7100, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Family room with 3 double beds', 'booked', 'mountain',
        5,
        '7000 Danforth Avenue'),
       (705, 8300, 200, 'Free Wi-Fi, TV, Air conditioning, Balcony', 5, 'Luxury room with 5 double beds and ocean view',
        'booked', 'ocean', 5, '7000 Danforth Avenue');

-- Hotel 8
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('8000 Steeles Avenue', 1, 8, 5, 'hotel8@hotelchain1.com', '416-532-3456', '123 Rideau Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (801, 20, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'city', 0,
        '8000 Steeles Avenue'),
       (802, 50, 200, 'Free Air conditioning', 2, 'Economy room with 1 double bed', 'available', 'city', 0,
        '8000 Steeles Avenue'),
       (803, 55, 200, 'Free Air conditioning', 3, 'Family room with 2 emailgle beds', 'available', 'city', 0,
        '8000 Steeles Avenue'),
       (804, 100, 200, 'Free Air conditioning', 4, 'Family room with 4 emailgle beds', 'booked', 'city', 0,
        '8000 Steeles Avenue'),
       (805, 130, 200, 'Free Air conditioning', 5, 'Luxury room with 2 double beds', 'booked', 'city', 0,
        '8000 Steeles Avenue');


-- Hotel chain 2
INSERT INTO hotelchain(addressOfCentralOffice, totalHotel, email, phoneNum)
VALUES ('312 Laurier Street', 8, 'hotelchain2@gmail.com', '213-456-7890');

-- Hotel 1
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('234 St. Patrick Street', 1, 8, 5, 'hotel1@hotelchain2.com', '416-012-3456', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (1201, 200, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'city', 1,
        '234 St. Patrick Street'),
       (1202, 250, 200, 'Free Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'city', 0,
        '234 St. Patrick Street'),
       (1203, 350, 200, 'Free Air conditioning', 3, 'Family room with 2 double beds', 'available', 'city', 0,
        '234 St. Patrick Street'),
       (1204, 500, 200, 'Free Air conditioning', 4, 'Economy room with 4 emailgle beds', 'booked', 'city', 0,
        '234 St. Patrick Street'),
       (1205, 900, 200, 'Free Air conditioning', 5, 'Luxury room with 2 double beds', 'booked', 'city', 0,
        '234 St. Patrick Street');

-- Hotel 2
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('275 St. Joseph Street', 2, 8, 5, 'hotel2@hotelchain2.com', '416-012-9996', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2201, 800, 200, 'Free Wi-Fi, Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'mountain',
        0,
        '275 St. Joseph Street'),
       (2202, 850, 200, 'Free Wi-Fi, TV, Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'ocean', 2,
        '275 St. Joseph Street'),
       (2203, 950, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available', 'city', 0,
        '275 St. Joseph Street'),
       (2204, 1000, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '275 St. Joseph Street'),
       (2205, 1300, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 1 double bed', 'available',
        'mountain', 0,
        '275 St. Joseph Street');

-- Hotel 3
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('275 Hamilton Street', 4, 1, 5, 'hotel3@hotelchain2.com', '416-113-9796', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2301, 2100, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available',
        'mountain',
        3, '275 Hamilton Street'),
       (2302, 2150, 200, 'Free Wi-Fi, TV, Minibar, Kitchen', 2, 'Deluxe room with 1 double bed', 'available', 'ocean',
        0,
        '275 Hamilton Street'),
       (2303, 3150, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'city', 0, '275 Hamilton Street'),
       (2304, 4100, 200, 'Free Wi-Fi, Air conditioning, Kitchen', 4, 'Economy room with 3 double beds', 'booked',
        'city', 0,
        '275 Hamilton Street'),
       (2305, 5300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5, 'Luxury room with 3 double beds',
        'booked',
        'ocean', 0, '275 Hamilton Street');

-- Hotel 4
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('286 Vancouver Street', 1, 2, 5, 'hotel4@hotelchain2.com', '416-023-1236', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2401, 200, 200, 'Free TV, Air conditioning', 1, 'Standard room with 1 emailgle bed', 'booked', 'mountain', 0,
        '286 Vancouver Street'),
       (2402, 250, 200, 'Free TV, Balcony, Minibar', 2, 'Deluxe room with 1 double bed', 'booked', 'ocean', 0,
        '286 Vancouver Street'),
       (2403, 350, 200, 'Free TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available', 'city',
        0,
        '286 Vancouver Street'),
       (2404, 100, 200, 'Free Air conditioning', 4, 'Economy room with 1 emailgle bed', 'booked', 'city', 0,
        '286 Vancouver Street'),
       (2405, 300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 1 double bed and ocean view', 'booked', 'ocean', 0, '286 Vancouver Street');

-- Hotel 5
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('269 Toronto Street', 3, 3, 5, 'hotel5@hotelchain2.com', '416-993-1236', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2501, 1100, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Standard room with 1 double bed', 'available',
        'mountain', 0, '269 Toronto Street'),
       (2502, 1130, 200, 'Free Wi-Fi, TV, Air conditioning, Balcony, Minibar', 2, 'Deluxe room with 1 double bed',
        'available', 'ocean', 0, '269 Toronto Street'),
       (2503, 1390, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'city', 0, '269 Toronto Street'),
       (2504, 2120, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '269 Toronto Street'),
       (2505, 3300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and ocean view', 'booked', 'ocean', 1, '269 Toronto Street');

-- Hotel 6
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('100 Mary Street', 5, 4, 5, 'hotel6@hotelchain2.com', '416-000-1236', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2601, 1000, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available',
        'mountain',
        0, '100 Mary Street'),
       (2602, 1230, 200, 'Free Wi-Fi, TV, Balcony, Minibar', 2, 'Deluxe room with 1 double bed', 'available', 'ocean',
        0,
        '100 Mary Street'),
       (2603, 3190, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'ocean', 0, '100 Mary Street'),
       (2604, 4020, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 4 emailgle beds', 'booked', 'city',
        0,
        '100 Mary Street'),
       (2605, 5000, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and ocean view', 'booked', 'ocean', 1, '100 Mary Street');

-- Hotel 7
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('700 Alex Street', 1, 5, 5, 'hotel7@hotelchain2.com', '416-001-1986', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2701, 100, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'mountain', 0,
        '700 Alex Street'),
       (2702, 123, 200, 'Free Balcony, Minibar', 2, 'Deluxe room with 1 double bed', 'available', 'city', 0,
        '700 Alex Street'),
       (2703, 310, 200, 'Free Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available', 'city', 0,
        '700 Alex Street'),
       (2704, 400, 200, 'Free Wi-Fi', 4, 'Economy room with 4 emailgle beds', 'booked', 'city', 0, '700 Alex Street'),
       (2705, 500, 200, 'Free Wi-Fi, Air conditioning', 5, 'Luxury room with 2 double beds and ocean view', 'booked',
        'ocean', 0, '700 Alex Street');

-- Hotel 8
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('800 Alex Street', 2, 6, 5, 'hotel8@hotelchain2.com', '416-001-0006', '312 Laurier Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (2801, 200, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'mountain', 0,
        '800 Alex Street'),
       (2802, 223, 200, 'Free Balcony, Minibar', 2, 'Deluxe room with 1 double bed', 'available', 'city', 0,
        '800 Alex Street'),
       (2803, 319, 200, 'Free Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available', 'city', 0,
        '800 Alex Street'),
       (2804, 400, 200, 'Free Wi-Fi', 4, 'Economy room with 2 double beds', 'booked', 'city', 1, '800 Alex Street'),
       (2805, 600, 200, 'Free Wi-Fi, Air conditioning', 5, 'Luxury room with 2 double beds and city view', 'available',
        'city', 0, '800 Alex Street');


-- Hotel Chain 3
INSERT INTO hotelchain(addressofcentraloffice, totalHotel, email, phoneNum)
VALUES ('99 Ottawa Street', 8, 'hotelchain3@gmail.com', '333-456-7890');

-- Hotel 1
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('90 Father Street', 3, 7, 5, 'hotel1@hotelchain3.com', '416-222-4537', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3101, 2100, 200, 'Free Wi-Fi, TV, Air conditioning', 2, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '90 Father Street'),
       (3102, 2350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Deluxe room with 2 double beds', 'available',
        'ocean', 0, '90 Father Street'),
       (3103, 3050, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 4, 'Family room with 2 double beds', 'available',
        'mountain', 0, '90 Father Street'),
       (3104, 4100, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Economy room with 1 emailgle bed', 'available', 'city',
        0,
        '90 Father Street'),
       (3105, 4300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 3 double beds and ocean view', 'booked', 'ocean', 0, '90 Father Street');

-- Hotel 2
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('30 Father Street', 1, 8, 5, 'hotel2@hotelchain3.com', '416-002-4537', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3201, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '30 Father Street'),
       (3202, 250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 0, '30 Father Street'),
       (3203, 350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '30 Father Street'),
       (3204, 100, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '30 Father Street'),
       (3205, 300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and ocean view', 'booked', 'ocean', 1, '30 Father Street');

-- Hotel 3
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('87 Mother Street', 4, 8, 5, 'hotel3@hotelchain3.com', '456-000-3389', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3301, 1200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        1,
        '87 Mother Street'),
       (3302, 1250, 200, 'Free Wi-Fi, Air conditioning, Minibar', 2, 'Deluxe room with 2 double beds', 'available',
        'ocean',
        0, '87 Mother Street'),
       (3303, 1350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'ocean', 0, '87 Mother Street'),
       (3304, 1500, 200, 'Free Wi-Fi, TV ', 4, 'Economy room with 2 double beds', 'booked', 'ocean', 0,
        '87 Mother Street'),
       (3305, 1600, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 3 double beds and ocean view', 'booked', 'ocean', 0, '87 Mother Street');

-- Hotel 4
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('700 Father Street', 5, 8, 5, 'hotel4@hotelchain3.com', '416-456-7440', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3401, 2700, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Standard room with 2 double beds', 'available', 'city',
        0,
        '700 Father Street'),
       (3402, 2050, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 1, '700 Father Street'),
       (3403, 2500, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Family room with 1 double bed', 'available',
        'mountain', 0, '700 Father Street'),
       (3404, 3050, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar ', 4, 'Economy room with 2 double beds', 'booked',
        'city', 0, '700 Father Street'),
       (3405, 3300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 3 double beds and ocean view', 'booked', 'ocean', 0, '700 Father Street');

-- Hotel 5
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('930 Somerset Street', 1, 1, 5, 'hotel5@hotelchain3.com', '416-930-8901', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3501, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '930 Somerset Street'),
       (3502, 250, 200, 'Free Wi-Fi, TV, Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'ocean', 0,
        '930 Somerset Street'),
       (3503, 350, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0,
        '930 Somerset Street'),
       (3504, 400, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'ocean', 0,
        '930 Somerset Street'),
       (3505, 500, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds and ocean view',
        'booked',
        'ocean', 0, '930 Somerset Street');

-- Hotel 6
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('600 Elgin Street', 2, 2, 5, 'hotel6@hotelchain3.com', '416-678-1142', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3601, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain', 0,
        '600 Elgin Street'),
       (3602, 250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 2 emailgle beds', 'available',
        'ocean', 0, '600 Elgin Street'),
       (3603, 350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'booked',
        'mountain', 1, '600 Elgin Street'),
       (3604, 410, 200, 'Free Wi-Fi, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '600 Elgin Street'),
       (3605, 430, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and ocean view', 'booked', 'ocean', 0, '600 Elgin Street');

-- Hotel 7
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('49 Wyatt Avenue', 5, 2, 5, 'hotel7@hotelchain3.com', '416-111-1233', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3701, 2800, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain',
        0, '49 Wyatt Avenue'),
       (3702, 2250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 0, '49 Wyatt Avenue'),
       (3703, 3350, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0,
        '49 Wyatt Avenue'),
       (3704, 4400, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 4 emailgle beds', 'booked', 'city',
        0,
        '49 Wyatt Avenue'),
       (3705, 5050, 200, 'Free Wi-Fi, TV, Air conditioning, Balcony', 5,
        'Luxury room with 2 double beds and ocean view',
        'booked', 'ocean', 0, '49 Wyatt Avenue');

-- Hotel 8
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('89 Steeles Avenue', 1, 2, 5, 'hotel8@hotelchain3.com', '416-500-3050', '99 Ottawa Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (3801, 200, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'mountain', 0,
        '89 Steeles Avenue'),
       (3802, 250, 200, 'Free Air conditioning, Kitchen, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean',
        0, '89 Steeles Avenue'),
       (3803, 350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '89 Steeles Avenue'),
       (3804, 450, 200, 'Free Wi-Fi, Air conditioning', 4, 'Economy room with 3 emailgle beds', 'booked', 'mountain', 0,
        '89 Steeles Avenue'),
       (3805, 500, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds', 'booked', 'mountain',
        0,
        '89 Steeles Avenue');


-- Hotel Chain 4
INSERT INTO hotelchain(addressofcentraloffice, totalHotel, email, phoneNum)
VALUES ('9 Hong Kong Street', 8, 'hotelchain4@gmail.com', '333-444-7890');

-- Hotel 1
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('2 Jack Street', 3, 2, 5, 'hotel1@hotelchain4.com', '416-201-4997', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4101, 1200, 200, 'Free Wi-Fi, TV, Air conditioning', 2, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '2 Jack Street'),
       (4102, 1250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Deluxe room with 1 double bed', 'available',
        'ocean', 1, '2 Jack Street'),
       (4103, 1350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 4, 'Family room with 2 double beds', 'available',
        'mountain', 0, '2 Jack Street'),
       (4104, 1500, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Economy room with 1 emailgle bed', 'available', 'city',
        0,
        '2 Jack Street'),
       (4105, 2000, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 5,
        'Luxury room with 2 double beds and ocean view',
        'booked', 'ocean', 0, '2 Jack Street');

-- Hotel 2
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('3 Jack Street', 1, 2, 5, 'hotel2@hotelchain4.com', '416-111-4037', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4201, 700, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '3 Jack Street'),
       (4202, 750, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 0, '3 Jack Street'),
       (4203, 850, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '3 Jack Street'),
       (4204, 1000, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'mountain',
        0,
        '3 Jack Street'),
       (4205, 1300, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and ocean view', 'booked', 'ocean', 0, '3 Jack Street');

-- Hotel 3
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('11 John Street', 4, 2, 5, 'hotel3@hotelchain4.com', '456-993-2179', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4301, 1200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        1,
        '11 John Street'),
       (4302, 1250, 200, 'Free Wi-Fi, Air conditioning, Minibar', 2, 'Deluxe room with 2 double beds', 'available',
        'ocean',
        0, '11 John Street'),
       (4303, 1350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '11 John Street'),
       (4304, 1100, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '11 John Street'),
       (4305, 1300, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and ocean view', 'booked', 'ocean', 0, '11 John Street');

-- Hotel 4
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('6 King Street', 5, 2, 5, 'hotel4@hotelchain4.com', '647-456-0110', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4401, 2700, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Standard room with 2 double beds', 'booked', 'ocean',
        0,
        '6 King Street'),
       (4402, 2050, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'booked',
        'ocean',
        0, '6 King Street'),
       (4403, 1500, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Family room with 1 double bed', 'available',
        'mountain', 0, '6 King Street'),
       (4404, 3050, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 4, 'Economy room with 2 double beds', 'booked',
        'city',
        1, '6 King Street'),
       (4405, 3090, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 2 double beds and mountain view', 'booked', 'mountain', 2, '6 King Street');

-- Hotel 5
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('11 Austin Street', 1, 2, 5, 'hotel5@hotelchain4.com', '647-900-8901', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4501, 100, 200, 'Free Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city', 0,
        '11 Austin Street'),
       (4502, 200, 200, 'Free Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'ocean', 0,
        '11 Austin Street'),
       (4503, 300, 200, 'Free Air conditioning', 3, 'Family room with 2 double beds', 'available', 'ocean', 0,
        '11 Austin Street'),
       (4504, 400, 200, 'Free Air conditioning', 4, 'Economy room with 3 emailgle bed', 'booked', 'city', 0,
        '11 Austin Street'),
       (4505, 500, 200, 'Free Air conditioning', 5, 'Luxury room with 2 double beds and ocean view', 'booked', 'ocean',
        0,
        '11 Austin Street');

-- Hotel 6
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('67 Sixty Street', 2, 2, 5, 'hotel6@hotelchain4.com', '416-111-1111', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4601, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain', 0,
        '67 Sixty Street'),
       (4602, 250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 0, '67 Sixty Street'),
       (4603, 350, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'booked', 'mountain',
        0,
        '67 Sixty Street'),
       (4604, 400, 200, 'Free Wi-Fi, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '67 Sixty Street'),
       (4605, 500, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds', 'booked', 'ocean', 0,
        '67 Sixty Street');

-- Hotel 7
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('45 Wyatt Avenue', 5, 2, 5, 'hotel7@hotelchain4.com', '416-000-0003', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4701, 2800, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain',
        0, '45 Wyatt Avenue'),
       (4702, 2250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 0, '45 Wyatt Avenue'),
       (4703, 3350, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0,
        '45 Wyatt Avenue'),
       (4704, 3400, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 0,
        '45 Wyatt Avenue'),
       (4705, 4050, 200, 'Free Wi-Fi, TV, Air conditioning, Balcony', 5,
        'Luxury room with 5 emailgle beds and ocean view',
        'booked', 'ocean', 2, '45 Wyatt Avenue');

-- Hotel 8
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('8 Joseph Avenue', 1, 2, 5, 'hotel8@hotelchain4.com', '416-534-3050', '9 Hong Kong Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (4801, 200, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'mountain', 0,
        '8 Joseph Avenue'),
       (4802, 250, 200, 'Free Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'mountain', 0,
        '8 Joseph Avenue'),
       (4803, 350, 200, 'Free Wi-Fi, TV, Air conditioning,', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0,
        '8 Joseph Avenue'),
       (4804, 400, 200, 'Free Wi-Fi, Air conditioning', 4, 'Economy room with 4 emailgle beds', 'booked', 'city', 0,
        '8 Joseph Avenue'),
       (4805, 500, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds', 'booked', 'mountain',
        0,
        '8 Joseph Avenue');


-- Hotel Chain 5
INSERT INTO hotelchain(addressofcentraloffice, totalHotel, email, phoneNum)
VALUES ('37 Autumn Street', 8, 'hotelchain5@gmail.com', '647-900-2358');

-- Hotel 1
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('98 Coffee Street', 3, 2, 5, 'hotel1@hotelchain5.com', '416-335-7434', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5101, 600, 200, 'Free Wi-Fi, Air conditioning', 2, 'Standard room with 1 double bed', 'available', 'city', 0,
        '98 Coffee Street'),
       (5102, 650, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Deluxe room with 1 double bed', 'available',
        'ocean', 0, '98 Coffee Street'),
       (5103, 750, 200, 'Free Wi-Fi, Air conditioning, Minibar', 4, 'Family room with 2 double beds', 'available',
        'mountain', 0, '98 Coffee Street'),
       (5104, 800, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Economy room with 1 double bed', 'available',
        'ocean', 0, '98 Coffee Street'),
       (5105, 900, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 3 double beds and ocean view', 'booked', 'ocean', 0, '98 Coffee Street');

-- Hotel 2
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('22 Python Street', 1, 2, 5, 'hotel2@hotelchain5.com', '416-101-9090', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5201, 100, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '22 Python Street'),
       (5202, 150, 200, 'Free Wi-Fi, TV, Air conditioning', 2, 'Deluxe room with 1 double bed', 'booked', 'ocean', 0,
        '22 Python Street'),
       (5203, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0,
        '22 Python Street'),
       (5204, 250, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 4 emailgle beds', 'booked', 'city', 0,
        '22 Python Street'),
       (5205, 300, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds and ocean view',
        'booked',
        'ocean', 0, '22 Python Street');

-- Hotel 3
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('11 Joker Street', 4, 2, 5, 'hotel3@hotelchain5.com', '409-101-2179', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5301, 1200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city',
        0,
        '11 Joker Street'),
       (5302, 1250, 200, 'Free Wi-Fi, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean',
        1, '11 Joker Street'),
       (5303, 1350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '11 Joker Street'),
       (5304, 1500, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 5 emailgle beds', 'booked', 'city',
        0,
        '11 Joker Street'),
       (5305, 1700, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5,
        'Luxury room with 1 double bed and ocean view', 'available', 'ocean', 0, '11 Joker Street');

-- Hotel 4
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('14 Robot Street', 5, 2, 5, 'hotel4@hotelchain5.com', '647-202-0410', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5401, 2700, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Standard room with 3 double beds', 'booked', 'ocean',
        0,
        '14 Robot Street'),
       (5402, 2050, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 2 double beds', 'booked',
        'ocean',
        0, '14 Robot Street'),
       (5403, 3500, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 1, 'Family room with 2 double beds', 'available',
        'mountain', 0, '14 Robot Street'),
       (5404, 1050, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 2 double beds', 'booked', 'city', 1,
        '14 Robot Street'),
       (5405, 3030, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar, Balcony', 5, 'Luxury room with 3 double beds',
        'booked',
        'city', 0, '14 Robot Street');

-- Hotel 5
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('1 Theo Street', 1, 2, 5, 'hotel5@hotelchain5.com', '627-901-5901', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5501, 100, 200, 'Free Air conditioning', 1, 'Standard room with 1 double bed', 'available', 'city', 0,
        '1 Theo Street'),
       (5502, 130, 200, 'Free Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'ocean', 0,
        '1 Theo Street'),
       (5503, 200, 200, 'Free Air conditioning', 3, 'Family room with 2 double beds', 'available', 'ocean', 0,
        '1 Theo Street'),
       (5504, 230, 200, 'Free Air conditioning', 4, 'Economy room with 4 emailgle bed', 'available', 'city', 0,
        '1 Theo Street'),
       (5505, 300, 200, 'Free TV, Air conditioning', 5, 'Luxury room with 2 double beds and ocean view', 'available',
        'ocean', 0, '1 Theo Street');

-- Hotel 6
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('69 Sky Street', 4, 2, 5, 'hotel6@hotelchain5.com', '416-101-1100', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5601, 200, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain', 1,
        '69 Sky Street'),
       (5602, 250, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 2 emailgle beds', 'available',
        'ocean', 0, '69 Sky Street'),
       (5603, 350, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'booked', 'mountain',
        0,
        '69 Sky Street'),
       (5604, 500, 200, 'Free Wi-Fi, Air conditioning', 4, 'Economy room with 3 double beds', 'available', 'city', 0,
        '69 Sky Street'),
       (5605, 550, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 3 double beds', 'booked', 'city', 0,
        '69 Sky Street');

-- Hotel 7
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('923 Disney Avenue', 5, 2, 5, 'hotel7@hotelchain5.com', '416-023-6803', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5701, 1234, 200, 'Free Wi-Fi, TV, Air conditioning', 1, 'Standard room with 1 double bed', 'available',
        'mountain',
        3, '923 Disney Avenue'),
       (5702, 5632, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 2, 'Deluxe room with 1 double bed', 'available',
        'ocean', 4, 200, '923 Disney Avenue'),
       (5703, 6854, 200, 'Free Wi-Fi, TV, Air conditioning', 3, 'Family room with 2 double beds', 'available',
        'mountain', 2,
        '923 Disney Avenue'),
       (5704, 7239, 200, 'Free Wi-Fi, TV, Air conditioning', 4, 'Economy room with 6 emailgle beds', 'booked', 'city',
        1,
        '923 Disney Avenue'),
       (5705, 8309, 200, 'Free Wi-Fi, TV, Air conditioning, Balcony', 5,
        'Luxury room with 7 emailgle beds and ocean view',
        'booked', 'ocean', 3, '923 Disney Avenue');

-- Hotel 8
INSERT INTO hotel(address, category, area, totalRoom, email, phoneNum, addressOfCentralOffice)
VALUES ('903 Disney Avenue', 1, 2, 5, 'hotel8@hotelchain5.com', '416-777-7777', '37 Autumn Street');

INSERT INTO room(roomID, roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)
VALUES (5801, 200, 200, 'Free Air conditioning', 1, 'Standard room with 1 emailgle bed', 'available', 'mountain', 0,
        '903 Disney Avenue'),
       (5802, 250, 200, 'Free Air conditioning', 2, 'Deluxe room with 1 double bed', 'available', 'ocean', 0,
        '903 Disney Avenue'),
       (5803, 350, 200, 'Free Wi-Fi, TV, Air conditioning, Minibar', 3, 'Family room with 2 double beds', 'available',
        'mountain', 0, '903 Disney Avenue'),
       (5804, 400, 200, 'Free Wi-Fi, Air conditioning', 4, 'Economy room with 4 emailgle beds', 'booked', 'city', 0,
        '903 Disney Avenue'),
       (5805, 500, 200, 'Free Wi-Fi, TV, Air conditioning', 5, 'Luxury room with 2 double beds and ocean view',
        'booked',
        'ocean', 0, '903 Disney Avenue');


-- Add managers
INSERT INTO person (email, fullName, pAddress)
VALUES ('111111110', 'Ian Chan', '69 Mirror Street');
INSERT INTO manager (email, hAddress)
VALUES ('111111110', '1000 Bay Street');

INSERT INTO person (email, fullName, pAddress)
VALUES ('222222220', 'Mary Chan', '456 Park Ave');
INSERT INTO manager (email, hAddress)
VALUES ('222222220', '2000 Bay Street');

INSERT INTO person (email, fullName, pAddress)
VALUES ('333333330', 'Edan Lui', '8 Opera Street');
INSERT INTO manager (email, hAddress)
VALUES ('333333330', '3000 Yonge Street');

INSERT INTO person (email, fullName, pAddress)
VALUES ('444444440', 'Stephy Williams', '98 Computer Street');
INSERT INTO manager (email, hAddress)
VALUES ('444444440', '4000 Dundas Street');

INSERT INTO person (email, fullName, pAddress)
VALUES ('555555550', 'Shawn Mendes', '38 emailger Street');
INSERT INTO manager (email, hAddress)
VALUES ('555555550', '5000 Somerset Street');


-- add reservation
INSERT INTO record (recordID, bookingDate, startDate, endDate, roomID, roomNum, eemail, cemail, payment)
VALUES (0, '2023-03-30', '2023-03-30', '2023-04-04', 5501, '987654321', '111222333', 1.00);

-- view 1
CREATE VIEW available_rooms_per_area AS
SELECT hotel.address, hotel.category, room.viewofroom, COUNT(room.status) AS num_available
FROM hotel
         JOIN room ON hotel.address = room.hAddress
WHERE room.status = 'available'
GROUP BY hotel.address, hotel.category, room.viewofroom;

-- View 2
CREATE VIEW room_capacity_per_hotel AS
SELECT hotel.address, SUM(room.capacity) AS total_capacity
FROM hotel
         JOIN room ON hotel.address = room.hAddress
GROUP BY hotel.address;






















