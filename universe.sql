--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    galaxy_type character varying(30),
    age_in_millions_years numeric(10,2),
    number_of_stars bigint
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    is_spherical boolean,
    distance_from_earth numeric(10,2),
    surface_temperature integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    has_life boolean,
    planet_type character varying(30),
    orbital_period integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    launch_date date,
    mission_type character varying(30),
    success boolean,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text,
    age_in_millions_years numeric(10,2),
    distance_from_earth numeric(10,2),
    luminosity integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy.', 'Spiral', 13600.00, 100000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy.', 'Spiral', 10000.00, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Part of the Local Group.', 'Spiral', 12000.00, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy.', 'Elliptical', 13000.00, 200000000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Famous for its spiral arms.', 'Spiral', 5000.00, 10000000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A bright, large galaxy.', 'Elliptical', 9000.00, 80000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite.', true, 0.38, -20, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger of the two Martian moons', false, 0.01, -40, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller Martian moon.', false, 0.02, -50, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 'An icy moon of Jupiter', true, 628.30, -160, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the Solar System.', true, 628.30, -163, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 'A heavy craratered moon of Jupiter.', true, 628.30, -139, 3);
INSERT INTO public.moon VALUES (7, 'lo', 'Most volcanically active body.', true, 628.30, -143, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon.', true, 1277.00, -180, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Has water plumes.', true, 4351.00, -235, 3);
INSERT INTO public.moon VALUES (10, 'Triton', 'Neptune''s largest moon.', true, 4351.00, -235, 3);
INSERT INTO public.moon VALUES (11, 'Charon', 'Pluto''s largest moon.', true, 5906.40, -220, 5);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Saturn''s moon with a giant crater.', true, 1277.00, -190, 4);
INSERT INTO public.moon VALUES (13, 'Dione', 'Saturn''s moon.', true, 1277.00, -186, 4);
INSERT INTO public.moon VALUES (14, 'lapetus', 'Half dark, half bright moon.', true, 2870.00, -143, 4);
INSERT INTO public.moon VALUES (15, 'Oberon', 'A moon of Uranus.', true, 2870.00, -203, 6);
INSERT INTO public.moon VALUES (16, 'Titania', 'Largest moon of Uranus.', true, 2870.00, -198, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Uranus''s highly deformed moon.', true, 2870.00, -187, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', 'A moon of Saturn', true, 1277.00, -174, 4);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'An irregular moon of Saturn.', false, 1277.00, -180, 4);
INSERT INTO public.moon VALUES (20, 'Proteus', 'A moon of Neptune.', false, 4351.00, -200, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet.', true, 'Terrestrial', 365, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet.', false, 'Terrestrial', 687, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in the Solar System.', false, 'Gas Giant', 4333, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Famous for its rings.', false, 'Gas Giant', 10759, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'Hottest planet in the Solar System.', false, 'Terrestrial', 225, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Closest planet to the Sun.', false, 'Terrestrial', 88, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-442b', 'Potential habitable exoplanet.', false, 'Terrestrial', 112, 2);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 'An exoplanet in the Gliese system.', false, 'Super-Earth', 37, 3);
INSERT INTO public.planet VALUES (9, 'HD 209458b', 'A hot Jupiter.', false, 'Gas Giant', 4, 4);
INSERT INTO public.planet VALUES (10, 'WASP-12b', 'One of the hottest exoplanets.', false, 'Gas Giant', 1, 5);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'Orbits Proxima Centauri.', false, 'Terrestrial', 11, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'Super-Earth in the habitable', false, 'Super-Earth', 290, 2);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (1, 'Apollo 11', 'First moon landing mission', '1969-07-16', 'Manned', true, 1, 1, 1, 1);
INSERT INTO public.space_mission VALUES (2, 'Curiosity Rover', 'Mars exploration rover', '2011-11-26', 'Exploration', true, 1, 1, 2, NULL);
INSERT INTO public.space_mission VALUES (3, 'Voyager 1', 'Deep space probe', '1977-09-05', 'Observation', true, 1, 1, NULL, NULL);
INSERT INTO public.space_mission VALUES (4, 'New Horizons', 'Pluto and Kuiper Belt mission', '2006-01-19', 'Exploration', true, 1, 1, 5, 11);
INSERT INTO public.space_mission VALUES (5, 'Parker Solar Probe', 'Studying the Sun', '2018-08-12', 'Observation', true, 1, 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star of our solar system.', 4600.00, 0.00, 1, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun.', 4850.00, 4.24, 0, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in the night sky.', 200.00, 8.60, 25, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant.', 8000.00, 642.50, 126000, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A bright white star.', 455.00, 25.00, 40, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant.', 8000.00, 860.00, 120000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_mission space_mission_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: space_mission space_mission_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: space_mission space_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: space_mission space_mission_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

