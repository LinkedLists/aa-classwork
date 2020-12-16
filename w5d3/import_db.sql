CREATE TABLE users(
    fname TEXT;
    lname TEXT;
    user_id INTEGER;
    qf_id INTEGER;

    FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE questions(
    title TEXT;
    body TEXT;
    question_id INTEGER;
    qf_id INTEGER;

    FOREIGN_KEY (qf_id) REFERENCES question_follows(id)
);

CREATE TABLE question_follows(
    id INTEGER;
    q_id INTEGER;
    u_id INTEGER;    
);

CREATE TABLE replies();

CREATE TABLE question_likes();

