CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(60),
  email VARCHAR(150),
  full_name VARCHAR(150),
  password VARCHAR(150)
);