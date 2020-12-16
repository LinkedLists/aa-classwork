CREATE TABLE users(
    fname TEXT,
    lname TEXT,
    user_id INTEGER PRIMARY KEY,
    -- qf_id INTEGER,

    -- FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE questions(
    title TEXT,
    body TEXT,
    question_id INTEGER PRIMARY KEY,
    -- qf_id INTEGER,

    -- FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    q_id INTEGER,
    u_id INTEGER,

    FOREIGN_KEY (q_id) REFERENCES questions(question_id)  
    FOREIGN_KEY (u_id) REFERENCES users(user_id)
);

CREATE TABLE replies(
  question_id INTEGER NOT NULL,
  reply_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  body_text TEXT,
  FOREIGN_KEY (reply_id) REFERENCES replies(reply_id),
  FOREIGN_KEY (question_id) REFERENCES question_follows(q_id),
  FOREIGN_KEY (user_id) REFERENCES question_follows(u_id),
);

CREATE TABLE question_likes();

