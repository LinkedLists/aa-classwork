PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;


CREATE TABLE users(
    fname TEXT,
    lname TEXT,
    user_id INTEGER PRIMARY KEY
    -- qf_id INTEGER,

    -- FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE questions(
    title TEXT,
    body TEXT,
    question_id INTEGER PRIMARY KEY
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
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    reply_id INTEGER PRIMARY KEY,
    user_id INTEGER,
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

