PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
    user_id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT
    -- qf_id INTEGER,

    -- FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE questions(
    question_id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT,
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(user_id)
    -- qf_id INTEGER,

    -- FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    q_id INTEGER,
    u_id INTEGER,

    FOREIGN KEY (q_id) REFERENCES questions(question_id),  
    FOREIGN KEY (u_id) REFERENCES users(user_id)
);

CREATE TABLE replies(
    reply_id INTEGER PRIMARY KEY, -- pk is usually 'id'
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body_text TEXT,
    FOREIGN KEY (parent_id) REFERENCES replies(reply_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    q_id INTEGER,
    u_id INTEGER,

    FOREIGN KEY (q_id) REFERENCES questions(question_id),  
    FOREIGN KEY (u_id) REFERENCES users(user_id)
);

INSERT INTO users (
  user_id,
  fname,
  lname
)
VALUES (
  1,
  'Kenny',
  'Z'
);
INSERT INTO users (
  user_id,
  fname,
  lname
)
VALUES (
  2,
  'David',
  'C'
);
INSERT INTO users (
  user_id,
  fname,
  lname
)
VALUES (
  3,
  'Ryan',
  'Z'
);

    -- title TEXT,
    -- body TEXT,
    -- question_id INTEGER PRIMARY KEY

INSERT INTO questions (
  question_id,
  title,
  body,
  author_id
)
VALUES (
  1,
  'Kenny Question',
  'kennykennny',
  1
);
INSERT INTO questions (
  question_id,
  title,
  body,
  author_id
)
VALUES (
  2,
  'david Question',
  'davidvadivaivdiav',
  2
);
INSERT INTO questions (
  question_id,
  title,
  body,
  author_id
)
VALUES (
  3,
  'Ryan Question',
  'ryyananann',
  3
);