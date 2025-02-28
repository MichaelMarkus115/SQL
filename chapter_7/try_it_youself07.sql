CREATE TABLE albums (
    album_id bigserial PRIMARY KEY,  -- primary key for albums
    album_catalog_code varchar(100) UNIQUE NOT NULL,  -- Unique and NOT NULL constraint on album catalog code
    album_title text NOT NULL,  -- NOT NULL constraint on album title
    album_artist text NOT NULL,  -- NOT NULL constraint on album artist
    album_release_date date NOT NULL,  -- NOT NULL constraint on album release date
    album_genre varchar(40) NOT NULL,  -- NOT NULL constraint on album genre
    album_description text
);

CREATE TABLE songs (
    song_id bigserial PRIMARY KEY,  -- primary key for songs
    song_title text NOT NULL,  -- NOT NULL constraint on song title
    song_artist text NOT NULL,  -- NOT NULL constraint on song artist
    album_id bigint,  -- foreign key reference to albums
    CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES albums (album_id)  -- foreign key constraint
);


--(question 2)

--(question 3)
--song_id and album_catalog_code
