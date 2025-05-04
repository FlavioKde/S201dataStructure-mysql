CREATE DATABASE IF NOT EXISTS youtube_reduced;
USE youtube_reduced;


CREATE TABLE User (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('male', 'female', 'other') NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20)
);


CREATE TABLE Video (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    size DECIMAL(10,2) NOT NULL,
    filename VARCHAR(255) NOT NULL,
    duration INT NOT NULL, -- seconds
    thumbnail VARCHAR(255),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    state ENUM('public', 'hidden', 'private') NOT NULL DEFAULT 'public',
    upload_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id_user)
);


CREATE TABLE Labels (
    id_labels INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE
);


CREATE TABLE Video_Labels (
    video_id INT,
    labels_id INT,
    PRIMARY KEY (video_id, labels_id),
    FOREIGN KEY (video_id) REFERENCES Video(id_video),
    FOREIGN KEY (labels_id) REFERENCES Labels(id_labels)
);


CREATE TABLE Channels (
    id_channel INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id_user)
);


CREATE TABLE Subscription (
    user_id INT,
    channel_id INT,
    subscription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, channel_id),
    FOREIGN KEY (user_id) REFERENCES User(id_user),
    FOREIGN KEY (channel_id) REFERENCES Channels(id_channel)
);


CREATE TABLE Playlist (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    state ENUM('public', 'private') DEFAULT 'public',
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id_user)
);


CREATE TABLE Playlist_Videos (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(id_playlist),
    FOREIGN KEY (video_id) REFERENCES Video(id_video)
);


CREATE TABLE Comment (
    id_comment INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    video_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id_user),
    FOREIGN KEY (video_id) REFERENCES Video(id_video)
);


CREATE TABLE Comments_Reaction (
    comment_id INT,
    user_id INT,
    reaction ENUM('like', 'don\'t like'),
    reaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id, user_id),
    FOREIGN KEY (comment_id) REFERENCES Comment(id_comment),
    FOREIGN KEY (user_id) REFERENCES User(id_user)
);


CREATE TABLE Video_Reactions (
    video_id INT,
    user_id INT,
    reaction ENUM('like', 'dislike'),
    date_reactions DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (video_id, user_id),
    FOREIGN KEY (video_id) REFERENCES Video(id_video),
    FOREIGN KEY (user_id) REFERENCES User(id_user)
);
