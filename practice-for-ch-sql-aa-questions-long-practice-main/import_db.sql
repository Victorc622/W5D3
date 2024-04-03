DROP TABLE if exists users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

DROP TABLE if exists questions; 

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    questions_id INTEGER NOT NULL,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
)

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    users_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
)

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    liked BOOLEAN, 

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
)