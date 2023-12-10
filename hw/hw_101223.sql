-- В рамках БД "видео-хостинг":

-- Создать таблицы реакций и комментариев

CREATE TABLE comments (
	comment_id int,
  	created_at timestamp,
  	author_id int,
  	content text,
  	video_id int
);

CREATE TABLE reactions (
	reaction_id int,
  	created_at timestamp,
  	author_id int,
  	value text,
  	video_id int
);

-- Добавить несколько записей в каждую таблицу выше

INSERT INTO comments (comment_id, created_at, author_id, content, video_id)
VALUES
	(12345, CURRENT_TIMESTAMP, 34567, "text_content", 234567);
	(23456, CURRENT_TIMESTAMP, 87654, "text_content", 987655);

   INSERT INTO reactions (reaction_id, created_at, author_id, value, video_id)
VALUES
	(19876, CURRENT_TIMESTAMP, 34567, "Like", 234567);
	(12345, CURRENT_TIMESTAMP, 87654, "Dislike", 45678);