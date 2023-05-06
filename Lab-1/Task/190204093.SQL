CLEAR SCREEN;

DROP TABLE Track;
DROP TABLE Album;
DROP TABLE Artist;

CREATE TABLE Artist(
	artistID NUMBER PRIMARY KEY,
	name VARCHAR2(200),
	age NUMBER,
	gender VARCHAR2(200)
);

CREATE TABLE Album(
	albumID NUMBER PRIMARY KEY,
	albumTitle VARCHAR2(200),
	artistID NUMBER,
	certification VARCHAR2(200),
	numberOfTracks NUMBER,
	FOREIGN KEY (artistID) REFERENCES Artist(artistID)
);

CREATE TABLE Track(
	trackID NUMBER PRIMARY KEY,
	trackTitle VARCHAR2(200),
	genre VARCHAR2(200),
	albumID NUMBER,
	published DATE,
	FOREIGN KEY (albumID) REFERENCES Album(albumID)
);

INSERT INTO Artist VALUES (1, 'Michael Jackson', 50, 'Male');
INSERT INTO Artist VALUES (2, 'Madonna', 63, 'Female');
INSERT INTO Artist VALUES (3, 'Elton John', 74, 'Male');
INSERT INTO Artist VALUES (4, 'Adele', 33, 'Female');
INSERT INTO Artist VALUES (5, 'Queen', 50, 'Mixed');

INSERT INTO Album VALUES (1, 'Thriller', 1, 'Diamond', 9);
INSERT INTO Album VALUES (2, 'Like a Virgin', 2, 'Multi-Platinum', 9);
INSERT INTO Album VALUES (3, 'Goodbye Yellow Brick Road', 3, 'Platinum', 17);
INSERT INTO Album VALUES (4, '21', 4, 'Diamond', 11);
INSERT INTO Album VALUES (5, 'A Night at the Opera', 5, 'Gold', 12);

INSERT INTO Track VALUES (1, 'Beat It', 'Pop', 1, TO_DATE('1983-11-03', 'yyyy-mm-dd'));
INSERT INTO Track VALUES (2, 'Material Girl', 'Pop', 2, TO_DATE('1984-11-12', 'yyyy-mm-dd'));
INSERT INTO Track VALUES (3, 'Bennie and the Jets', 'Rock', 3, TO_DATE('1973-04-06', 'yyyy-mm-dd'));
INSERT INTO Track VALUES (4, 'Rolling in the Deep', 'Pop', 4, TO_DATE('2010-11-29', 'yyyy-mm-dd'));
INSERT INTO Track VALUES (5, 'Bohemian Rhapsody', 'Rock', 5, TO_DATE('1975-11-21', 'yyyy-mm-dd'));

SELECT name FROM Artist INNER JOIN Album ON Artist.artistID = Album.artistID AND Album.certification = 'Platinum'; 
SELECT trackTitle FROM Track INNER JOIN Album ON Track.albumID = Album.albumID AND Album.certification = 'Gold';

SELECT AVG(numberOfTracks) as average_tracks
FROM Album 
WHERE artistID IN (
    SELECT artistID 
    FROM Artist 
    WHERE age >= 30
);

commit; 