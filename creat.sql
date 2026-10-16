CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(20) UNIQUE NOT NULL,
  email VARCHAR(20) UNIQUE NOT NULL,
  password VARCHAR(250) NOT NULL
);


-- Inserting sample data
INSERT INTO users (username, email, password)
VALUES ('Rohh', 'rohn@example.com', 'securepassword123');
