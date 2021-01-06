CREATE TABLE peeps (
  id SERIAL PRIMARY KEY, 
  user_id INT,
  peep VARCHAR(250), 
  created_at VARCHAR(6), 
  CONSTRAINT fk_user
    FOREIGN KEY(user_id) 
      REFERENCES users(id)
      ON DELETE CASCADE
);