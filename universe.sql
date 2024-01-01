-- PostgreSQL database dump

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

-- Table Definitions

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    light_years_from_earth integer,
    description text,
    size numeric(20,2)
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    planet character varying(100),
    radius numeric(15,2)
);
ALTER TABLE public.moon OWNER TO freecodecamp;

CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    has_moon boolean,
    number_of_moons integer,
    has_atmosphere boolean
);
ALTER TABLE public.planet OWNER TO freecodecamp;

CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_operational boolean
);
ALTER TABLE public.space_station OWNER TO freecodecamp;

CREATE SEQUENCE public.space_station_station_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.space_station_station_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.space_station_station_id_seq OWNED BY public.space_station.space_station_id;

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    distance_light_yrs integer,
    constellation character varying(100)
);
ALTER TABLE public.star OWNER TO freecodecamp;

CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

-- Default Values

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_station_id_seq'::regclass);
ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);

-- Data Insertion

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2480000, 'Also known as Messier 31, a spiral galaxy that is the brightest external galaxy you can see', 110000.00);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 25800, 'A spiral galaxy in which we live, appearing as a milky band of light in the sky', 52850.00);
-- ... (inserts for other galaxies)

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 'Earth', 1079.60);
-- ... (inserts for other moons)

INSERT INTO public.planet VALUES (2, 'Pluto', NULL, true, 5, true);
-- ... (inserts for other planets)

INSERT INTO public.space_station VALUES (1, 'International Space Station', true);
-- ... (inserts for other space stations)

INSERT INTO public.star VALUES (1, 'UY Scuti', NULL, 9500, 'Scutum');
-- ... (inserts for other stars)

-- Sequence Resets

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);
SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);
SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);
SELECT pg_catalog.setval('public.space_station_station_id_seq', 3, true);
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

-- Primary Key Constraints

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
-- ... (constraints for other tables)

-- Unique Constraints

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);
-- ... (constraints for other tables)

-- Foreign Key Constraints

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
-- ... (constraints for other tables)

-- PostgreSQL database dump complete
