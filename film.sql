create table film (
    film_id integer primary key,
    skuespiller_id integer not null references skuespiller (skuespiller_id),
    instruktør_id integer not null references instruktør (instruktør_id),
    varighed    integer,
    udgivelsesår    integer,
    genre_id    integer,
    titel   text,
    platform_id integer,
    favortiter  text
);

create table skuespiller (
    skuespiller_id  integer primary key,
    film_id integer not null references film (film_id),
    navn    text,
    nationalitet    char
);

create table instruktør (
    instruktør_id   integer primary key,
    film_id integer,
    navn    text,
    nationalitet    char
);

create table genre (
    genre_id    integer,
    film_id     integer,
    navn    text
);

create table favoriter (
    favoriter   text,
    user_id integer,
    film_id integer
);

create table platform (
    platform_id integer,
    film_id integer
    streamintjenester   text
);

create table user (
    user_id integer,
    email   text,
    screen_name text,
    favortiter  text
);
