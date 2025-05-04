USE spotyfy_reduced;

INSERT INTO USER (email, password, username, birth_date, gender, country, zip_code, user_type)
VALUES ('ana@gmail.com', '123456', 'ana123', '1995-04-10', 'female', 'Spain', '08001', 'premium');


INSERT INTO PAYMENT_METHOD (user_id, payment_type, card_number, expiration_date, security_code)
VALUES (1, 'credit_card', '4111111111111111', '12/2026', '123');


INSERT INTO SUBSCRIPTION (user_id, start_date, renewal_date, payment_method_id)
VALUES (1, '2024-01-01', '2024-06-01', 1);


INSERT INTO PAYMENT_HISTORY (order_number, subscription_id, total, payment_date)
VALUES ('ORD001', 1, 9.99, '2024-01-01');


INSERT INTO ARTIST (name, artist_image)
VALUES ('Coldplay', 'coldplay.jpg');


INSERT INTO MUSIC_ALBUM (title, publication_year, cover_image_text, artist_id)
VALUES ('Parachutes', 2000, 'parachutes.jpg', 1);


INSERT INTO SONG (title, duration, play_count, music_album_id)
VALUES ('Yellow', '00:04:32', 10000, 1);


INSERT INTO PLAYLIST (user_id, title, song_number, create_date)
VALUES (1, 'Mis favoritas', 1, '2024-05-01');


INSERT INTO SHARED_PLAYLIST (playlist_id, user_id)
VALUES (1, 1);


INSERT INTO SHARED_PLAYLIST_SONG (playlist_id, song_id, user_id, date_shared)
VALUES (1, 1, 1, '2024-05-01');


INSERT INTO FAVORITE_SONG (user_id, song_id) VALUES (1, 1);
INSERT INTO FAVORITE_ALBUM (user_id, music_album_id) VALUES (1, 1);


INSERT INTO FOLLOW_ARTIST (user_id, artist_id) VALUES (1, 1);
