
INSERT INTO User (email, username, password, birth_date, gender, country, postal_code)
VALUES
('ana@example.com', 'anaYT', 'pass123', '1990-05-10', 'female', 'España', '08001'),
('juan@example.com', 'juanYT', 'pass456', '1988-08-22', 'male', 'Argentina', 'C1001');


INSERT INTO Channels (name, description, user_id)
VALUES
('Canal de Ana', 'Vlogs y viajes', 1),
('Tech con Juan', 'Tecnología y reviews', 2);


INSERT INTO Subscription (user_id, channel_id)
VALUES
(2, 1),  -- Juan se suscribe al canal de Ana
(1, 2);  -- Ana se suscribe al canal de Juan


INSERT INTO Video (title, description, size, filename, duration, thumbnail, views, likes, dislikes, state, user_id)
VALUES
('Mi primer viaje', 'Visitando Barcelona', 250.5, 'viaje1.mp4', 600, 'thumb1.jpg', 1000, 150, 10, 'public', 1),
('Unboxing nuevo móvil', 'Probando el nuevo modelo X', 150.0, 'unboxing.mp4', 300, 'thumb2.jpg', 2000, 300, 5, 'public', 2);


INSERT INTO Labels (name)
VALUES ('viajes'), ('tecnología');


INSERT INTO Video_Labels (video_id, labels_id)
VALUES
(1, 1),  -- Video 1 tiene etiqueta "viajes"
(2, 2);  -- Video 2 tiene etiqueta "tecnología"


INSERT INTO Video_Reactions (video_id, user_id, reaction)
VALUES
(1, 2, 'like'),  -- Juan le da like al video de Ana
(2, 1, 'dislike');  -- Ana le da dislike al video de Juan


INSERT INTO Playlist (name, state, user_id)
VALUES
('Favoritos de Ana', 'public', 1),
('Tech playlist de Juan', 'private', 2);


INSERT INTO Playlist_Videos (playlist_id, video_id)
VALUES
(1, 2),  -- Ana agrega el video de Juan
(2, 2);  -- Juan agrega su propio video


INSERT INTO Comment (text, user_id, video_id)
VALUES
('¡Qué buen video!', 2, 1),  -- Juan comenta en el video de Ana
('No me gustó mucho el sonido', 1, 2); -- Ana comenta en el video de Juan


INSERT INTO Comments_Reaction (comment_id, user_id, reaction)
VALUES
(1, 1, 'like'),   -- Ana le da like al comentario de Juan
(2, 2, 'don\'t like'); -- Juan no le gusta el comentario de Ana
