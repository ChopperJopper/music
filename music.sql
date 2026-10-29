create table albums (
    artist text,
    title text,
    year integer
);

insert into albums (artist, title, year) values
    ('Benny jamz', 'Booty Up', 2024),
    ('Kundo', 'Shen Mao', 2026),
    ('Kliken', 'PONY', 2026),
    ('De To Musketere', 'Haander', 2018),
    ('Bondemanden', 'Hestepik', 2019);

    insert into albums (artist, title) values
        ('Prospa', 'Freed Your Mind'),
        ('ASAP Rocky', 'Trunks'),
        ('Artigeardit', 'louisiana');

INSERT INTO albums (artist, title, year)
VALUES
('Kesi', 'Sovnlos', 2012),
('Kesi', 'Kom Over', 2013),
('Kesi', 'Fodt I Danmark', 2014),
('Kesi', 'God Dag', 2015),
('Kesi', 'Mamacita', 2016),
('Kesi', 'Folelsen', 2017),
('Kesi', 'Bla Himmel', 2018),
('Kesi', 'Lige Her', 2019),
('Kesi', 'Tarer', 2020),
('Kesi', 'Ibiza', 2021);


delete from albums where artist = 'Kesi' and year < 2016;

update albums set year = 2018 where artist = 'Kesi' and title = 'God Dag';

select stage_name, title, release_date from artists
join albums using (artist_id)
order by release_date desc
limit 10;

select title, release_date, riaa_certificate from albums
join artists using (artist_id)
where stage_name = 'Metallica'
order by title asc;

alter table tracks
add constraint tracks_milliseconds_check
check (milliseconds >= 0);

update tracks
set milliseconds = null
where track_id = 31;

alter table tracks
add constraint tracks_money
check (unit_price >= 0.50 + 0.13 * (bytes/10000000.0));

select * from tracks
where unit_price <= 0.50 + 0.13 * (bytes/10000000.0);

update tracks
set unit_price = 2
where track_id = 620 or track_id = 1666;

alter table artists 
alter column nationality
set not null;

select * from artists 
where nationality is null;

delete from artists 
where nationality is null;

alter table artists 
add column active boolean not null default true;

insert into artists (artist_id, stage_name, nationality)
values (300, 'Laufey', 'IS');

alter table artists 
add constraint unique_stage_name_nationality
unique(stage_name, nationality);

alter table artists
drop constraint unique_stage_name;

insert into artists (artist_id, stage_name, nationality)
values (301, 'Nirvana', 'GB');

select t.title, t.milliseconds from tracks t
join albums a using (album_id)
where a.title = 'The White Album'
order by t.milliseconds asc;

select t.title, t.milliseconds from tracks t
join albums using (album_id)
join artists using (artist_id)
where stage_name = 'The Beatles'
order by t.milliseconds asc;

select t.title as track, t.milliseconds as playing_time, g.name as genre from tracks t
join albums using (album_id)
join artists using (artist_id)
join genres g using (genre_id)
where stage_name = 'The Beatles'
order by t.milliseconds asc;

select distinct m.name from media_types m
join tracks using (media_type_id)
join albums using (album_id)
join artists using (artist_id)
join playlist_track using (track_id)
join playlists p using (playlist_id)
where nationality = 'GB' and p.name = 'Heavy Metal Classic';

select distinct nationality from artists
join albums using (artist_id)
join tracks using (album_id)
join genres g using (genre_id)
join playlist_track using (track_id)
join playlists using (playlist_id)
join users using (user_id)
where screen_name = 'Susanne' and g.name = 'Rock';

select stage_name, count(*) as album_count
from artists
join albums using (artist_id)
group by stage_name
order by album_count desc
limit 10;
