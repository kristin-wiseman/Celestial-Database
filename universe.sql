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
    name character varying(50) NOT NULL,
    shape character varying(12),
    is_active boolean,
    dist_from_mw_m_lt_yrs numeric(6,1)
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
    name character varying(50),
    planet_id integer NOT NULL,
    has_atmosphere boolean,
    year_discovered integer
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
    name character varying(50),
    star_id integer NOT NULL,
    description text,
    radius_in_mi integer
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
-- Name: planets_with_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_with_moons (
    name character varying(50) NOT NULL,
    planets_with_moons_id integer[] NOT NULL,
    moon_list character varying[]
);


ALTER TABLE public.planets_with_moons OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    solar_mass numeric(6,2),
    type text
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', false, 0.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', true, 2.5);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'elliptical', true, 53.5);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'elliptical', true, 12.0);
INSERT INTO public.galaxy VALUES (5, 'Bodes', 'spiral', true, 11.8);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'spiral', true, 3.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, true, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 1892);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, false, 1789);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, true, 1789);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, false, 1684);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, 1684);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, true, 1672);
INSERT INTO public.moon VALUES (14, 'Titan', 6, true, 1655);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, false, 1671);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, false, 1851);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, false, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, false, 1787);
INSERT INTO public.moon VALUES (19, 'Triton', 8, true, 1846);
INSERT INTO public.moon VALUES (20, 'Himalia', 5, false, 1904);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'The home planet of humans.', 3963);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 'First planet from The Sun and smallest in the solar system', 1516);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'The second planet from The Sun.', 3760);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The red planet.', 2106);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in the solar system, and a gas giant', 43441);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'The one with the rings.', 36184);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'a gaseous cyan-coloured ice giant.', 15759);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The farthest planet from The Sun.', 15299);
INSERT INTO public.planet VALUES (9, 'Epsilon Eridani b', 4, 'The only confirmed planet orbiting Ran.', 0);
INSERT INTO public.planet VALUES (10, 'Gliese 15 Ab', 5, 'An extra-solar planet approximately 11 light years away in the Andromeda constellation', 0);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 2, 'One of the closest known exoplanets to Earth.', 3206);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 2, 'One of the closest known exoplanets to Earth.', 3959);


--
-- Data for Name: planets_with_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_with_moons VALUES ('Mars', '{2,3}', '{Phobos,Deimos}');
INSERT INTO public.planets_with_moons VALUES ('Jupiter', '{4,5,6,7,8,20}', '{Io,Europa,Ganymede,Callisto,Amalthea,Himalia}');
INSERT INTO public.planets_with_moons VALUES ('Uranus', '{16,17,18}', '{Ariel,Umbriel,Titania}');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 1.00, 'yellow dwarf');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.12, 'red dwarf');
INSERT INTO public.star VALUES (3, 'AE Andromedae', 2, 50.00, 'luminous blue variable');
INSERT INTO public.star VALUES (4, 'Ran (Epsilon Eridani)', 1, 0.82, 'orange dwarf');
INSERT INTO public.star VALUES (5, 'GX Andromedae', 1, 0.39, 'red dwarf');
INSERT INTO public.star VALUES (6, 'Tau Ceti', 1, 0.78, 'yellow dwarf');


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planets_with_moons planets_with_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_with_moons
    ADD CONSTRAINT planets_with_moons_pkey PRIMARY KEY (planets_with_moons_id);


--
-- Name: planets_with_moons planets_with_moons_planets_with_moons_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_with_moons
    ADD CONSTRAINT planets_with_moons_planets_with_moons_id_key UNIQUE (planets_with_moons_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

