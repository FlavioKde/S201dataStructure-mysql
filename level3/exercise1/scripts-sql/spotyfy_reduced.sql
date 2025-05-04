DROP DATABASE IF EXISTS spotify_reduced;
CREATE DATABASE spotyfy_reduced CHARACTER SET utf8mb4;
USE spotyfy_reduced;

CREATE TABLE USER (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('female', 'male', 'other'),
    country VARCHAR(100),
    zip_code VARCHAR(20),
    user_type ENUM('premium', 'free') NOT NULL
);


CREATE TABLE PAYMENT_METHOD (
    id_payment_method INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    payment_type ENUM('paypal', 'credit_card') NOT NULL,
    card_number VARCHAR(20),
    expiration_date VARCHAR(7),
    security_code VARCHAR(10),
    paypal_username VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES USER(id_user)
);


CREATE TABLE SUBSCRIPTION (
    id_subscription INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    start_date DATE,
    renewal_date DATE,
    payment_method_id INT,
    FOREIGN KEY (user_id) REFERENCES USER(id_user),
    FOREIGN KEY (payment_method_id) REFERENCES PAYMENT_METHOD(id_payment_method)
);


CREATE TABLE PAYMENT_HISTORY (
    id_payment_history INT AUTO_INCREMENT PRIMARY KEY,
    order_number VARCHAR(100) UNIQUE,
    subscription_id INT,
    total DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (subscription_id) REFERENCES SUBSCRIPTION(id_subscription)
);


CREATE TABLE ARTIST (
    id_artist INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    artist_image TEXT
);


CREATE TABLE SIMILAR_ARTIST (
    id_similar_artist INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    similar_artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES ARTIST(id_artist),
    FOREIGN KEY (similar_artist_id) REFERENCES ARTIST(id_artist)
);

-- Álbumes musicales
CREATE TABLE MUSIC_ALBUM (
    id_music_album INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    publication_year INT,
    cover_image_text TEXT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES ARTIST(id_artist)
);


CREATE TABLE SONG (
    id_song INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    duration TIME,
    play_count INT DEFAULT 0,
    music_album_id INT,
    FOREIGN KEY (music_album_id) REFERENCES MUSIC_ALBUM(id_music_album)
);


CREATE TABLE PLAYLIST (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    song_number INT,
    create_date DATE,
    soft_delete_date DATE,
    FOREIGN KEY (user_id) REFERENCES USER(id_user)
);


CREATE TABLE SHARED_PLAYLIST (
    playlist_id INT,
    user_id INT,
    PRIMARY KEY (playlist_id, user_id),
    FOREIGN KEY (playlist_id) REFERENCES PLAYLIST(id_playlist),
    FOREIGN KEY (user_id) REFERENCES USER(id_user)
);

--
CREATE TABLE SHARED_PLAYLIST_SONG (
    playlist_id INT,
    song_id INT,
    user_id INT,
    date_shared DATE,
    PRIMARY KEY (playlist_id, song_id, user_id),
    FOREIGN KEY (playlist_id) REFERENCES PLAYLIST(id_playlist),
    FOREIGN KEY (song_id) REFERENCES SONG(id_song),
    FOREIGN KEY (user_id) REFERENCES USER(id_user)
);


CREATE TABLE FAVORITE_SONG (
    user_id INT,
    song_id INT,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES USER(id_user),
    FOREIGN KEY (song_id) REFERENCES SONG(id_song)
);

CREATE TABLE FAVORITE_ALBUM (
    user_id INT,
    music_album_id INT,
    PRIMARY KEY (user_id, music_album_id),
    FOREIGN KEY (user_id) REFERENCES USER(id_user),
    FOREIGN KEY (music_album_id) REFERENCES MUSIC_ALBUM(id_music_album)
);


CREATE TABLE FOLLOW_ARTIST (
    user_id INT,
    artist_id INT,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES USER(id_user),
    FOREIGN KEY (artist_id) REFERENCES ARTIST(id_artist)
);
