CREATE TABLE users (
    id SERIAL NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO users (firstname, lastname, email, password, role)
VALUES ('steve', 'jobs', 'stevejobs@icloud.com', '1234', 'adopter'), ('mark', 'zuckerberg', 'markzuckerberg@meta.com', '1234', 'adopter'), ('jeff', 'bezos', 'jeffbezos@amazon.com', '1234', 'adopter'), ('bill', 'gates', 'billgates@microsoft.com', '1234', 'adopter');


CREATE TABLE shelterstaff (
    id SERIAL NOT NULL,
	uid INT NOT NULL REFERENCES users(id),
    animal VARCHAR(50) NOT NULL,
    breed VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    street VARCHAR(100) NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    image BYTEA,
    PRIMARY KEY(id)
);

-- CREATE TABLE shelterstaff (
--     id SERIAL NOT NULL,
-- 	uid INT NOT NULL REFERENCES users(id),
--     animal VARCHAR(50) NOT NULL,
--     breed VARCHAR(50) NOT NULL,
--     state VARCHAR(50) NOT NULL,
--     city VARCHAR(50) NOT NULL,
--     street VARCHAR(100) NOT NULL,
--     pincode VARCHAR(10) NOT NULL,
--     PRIMARY KEY(id)
-- );


CREATE TABLE interested(
	uid INT NOT NULL REFERENCES users(id),
	pid INT NOT NULL REFERENCES shelterstaff(id),
	PRIMARY KEY(uid, pid)
);


SELECT firstname, lastname, animal, breed, email
FROM interested AS i
INNER JOIN users AS u ON i.uid = u.id
INNER JOIN shelterstaff AS s ON i.pid = s.id
WHERE s.uid = 5;