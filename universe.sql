--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    description text NOT NULL,
    galaxy_id integer,
    name character varying(50)
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance integer,
    constellation character varying(255),
    description_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    semi_major_axis numeric,
    discovery_year integer
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
    name character varying(255) NOT NULL,
    number_of_moon numeric,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    system character varying(255),
    solar_mass numeric
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galxy_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'This is the galaxy containing the Sun and its Solar System, and therefore Earth. Most things visible to the naked eye in the sky are part of it, including the Milky Way composing the Zone of Avoidance.', NULL, NULL);
INSERT INTO public.description VALUES (2, 'Visible only from the southern hemisphere. It is also the brightest patch of nebulosity in the sky', NULL, NULL);
INSERT INTO public.description VALUES (3, 'Visible only from the southern hemisphere.', NULL, NULL);
INSERT INTO public.description VALUES (4, 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.', NULL, NULL);
INSERT INTO public.description VALUES (5, 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution, ranging from easily visible in direct vision in truly dark skies to a difficult averted vision object in rural/suburban skies.', NULL, NULL);
INSERT INTO public.description VALUES (6, 'Centaurus A has been spotted with the naked eye by Stephen James O Meara.', NULL, NULL);
INSERT INTO public.description VALUES (7, 'Highly experienced amateur astronomers may be able to see Messier 81 under exceptional observing conditions.', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Sagittarius', 1);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 160, 'Dorado', 2);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 200, 'Tucana', 3);
INSERT INTO public.galaxy VALUES (5, 'Andromeda Galaxy', 3, 'Andromeda', 4);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 14, 'Centaurus', 6);
INSERT INTO public.galaxy VALUES (7, 'Bodes Galaxy', 12, 'Ursa Major', 7);
INSERT INTO public.galaxy VALUES (8, 'Triangulum Galaxy', 3, 'Triangulum', 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 11, 384, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 12, 9, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 23, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 13, 422, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 13, 671, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 13, 1070, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 13, 1883, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 13, 181, 1892);
INSERT INTO public.moon VALUES (9, 'Himalia', 13, 11461, 1904);
INSERT INTO public.moon VALUES (10, 'Elara', 13, 11741, 1905);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 13, 23624, 1908);
INSERT INTO public.moon VALUES (12, 'Titan', 14, 1222, 1655);
INSERT INTO public.moon VALUES (13, 'Rhea', 14, 527, 1672);
INSERT INTO public.moon VALUES (14, 'Iapetus', 14, 3561, 1671);
INSERT INTO public.moon VALUES (15, 'Dione', 14, 377, 1684);
INSERT INTO public.moon VALUES (16, 'Tethys', 14, 295, 1684);
INSERT INTO public.moon VALUES (17, 'Enceladus', 14, 238, 1789);
INSERT INTO public.moon VALUES (18, 'Titania', 15, 436, 1787);
INSERT INTO public.moon VALUES (19, 'Oberon', 15, 584, 1787);
INSERT INTO public.moon VALUES (20, 'Miranda', 15, 130, 1948);
INSERT INTO public.moon VALUES (21, 'Charon', 17, 19, 1978);
INSERT INTO public.moon VALUES (22, 'Nix', 17, 49, 2005);
INSERT INTO public.moon VALUES (23, 'Triton', 16, 355, 1846);
INSERT INTO public.moon VALUES (24, 'Dysnomia', 18, 37, 2005);
INSERT INTO public.moon VALUES (25, 'Hiʻiaka', 19, 49, 2005);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Mercury', 0, false, true, 77, 7);
INSERT INTO public.planet VALUES (10, 'Venus', 0, false, true, 38, 7);
INSERT INTO public.planet VALUES (11, 'Earth', 1, true, true, 0, 7);
INSERT INTO public.planet VALUES (12, 'Mars', 2, false, true, 225, 7);
INSERT INTO public.planet VALUES (13, 'Jupiter', 79, false, true, 628, 7);
INSERT INTO public.planet VALUES (14, 'Saturn', 83, false, true, 1275, 7);
INSERT INTO public.planet VALUES (15, 'Uranus', 27, false, true, 2724, 7);
INSERT INTO public.planet VALUES (16, 'Neptune', 14, false, true, 4351, 7);
INSERT INTO public.planet VALUES (17, 'Pluto', 5, false, true, 5906, 7);
INSERT INTO public.planet VALUES (18, 'Eris', 1, false, true, 10100, 7);
INSERT INTO public.planet VALUES (19, 'Haumea', 2, false, true, 6452, 7);
INSERT INTO public.planet VALUES (20, 'Makemake', 1, false, true, 6850, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 1, 'Solar System', 1);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 'Alpha Centauri', 0.122);
INSERT INTO public.star VALUES (9, 'Rigil Kentaurus', 1, 'Alpha Centauri', 1.079);
INSERT INTO public.star VALUES (10, 'Toliman', 1, 'Alpha Centauri', 0.909);
INSERT INTO public.star VALUES (11, 'Barnards Star', 1, 'Barnards Star', 0.144);
INSERT INTO public.star VALUES (12, 'A', 1, 'Luhman 16', 10.7);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 7, true);


--
-- Name: galaxy_galxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: description description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_unique UNIQUE (description);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: description description_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_id_fkey FOREIGN KEY (description_id) REFERENCES public.description(description_id);


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

