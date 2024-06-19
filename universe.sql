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
-- Name: celestial_events; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_events (
    celestial_events_id integer NOT NULL,
    name character varying(100) NOT NULL,
    event_date date NOT NULL,
    event_time time without time zone,
    location character varying(255),
    event_type character varying(50),
    visibility character varying(100),
    notes text
);


ALTER TABLE public.celestial_events OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_events_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_events_event_id_seq OWNED BY public.celestial_events.celestial_events_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric(12,2),
    is_spherical boolean,
    years integer,
    discovered_date date,
    type character varying(50) NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric(12,2),
    is_spherical boolean,
    moon_width integer,
    type character varying(50) NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric(12,2),
    is_spherical boolean,
    planet_width integer,
    number_of_moons integer,
    type character varying(50) NOT NULL,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric(12,2),
    is_spherical boolean,
    star_width integer,
    temperature numeric,
    type character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: celestial_events celestial_events_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events ALTER COLUMN celestial_events_id SET DEFAULT nextval('public.celestial_events_event_id_seq'::regclass);


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
-- Data for Name: celestial_events; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_events VALUES (1, 'Perseid Meteor Shower', '2024-08-12', '22:00:00', 'Northern Hemisphere', 'Meteor Shower', 'High', 'One of the most prolific meteor showers, best viewed in dark skies away from light pollution');
INSERT INTO public.celestial_events VALUES (2, 'Total Lunar Eclipse', '2024-05-15', '03:00:00', 'Various locations', 'Lunar Eclipse', 'Visible in some regions', 'Occurs when the Earth passes between the Sun and the Moon, casting a shadow on the Moon');
INSERT INTO public.celestial_events VALUES (3, 'Geminid Meteor Shower', '2024-12-14', '23:00:00', 'Worldwide', 'Meteor Shower', 'High', 'Produces bright, colorful meteors and is one of the best meteor showers of the year');
INSERT INTO public.celestial_events VALUES (4, 'Solar Eclipse', '2024-04-08', '12:00:00', 'North America', 'Solar Eclipse', 'Visible in North America', 'Occurs when the Moon passes between the Earth and the Sun, blocking all or part of the Sun');
INSERT INTO public.celestial_events VALUES (5, 'Transit of Mercury', '2024-11-13', '08:00:00', 'Visible from Earth', 'Planetary Alignment', 'Visible', 'Mercury passes directly between the Earth and the Sun, appearing as a small black dot against the Sun''s disk');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System', 0.00, true, 13000, '1000-01-01', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way', 2200.00, true, 13000, '1200-01-01', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy near the Milky Way and Andromeda', 3000.00, true, 13000, '1500-01-01', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A massive elliptical galaxy in the Virgo Cluster', 5500.00, true, 13000, '1800-01-01', 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'A peculiar galaxy with an active galactic nucleus', 8000.00, true, 13000, '1900-01-01', 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A spiral galaxy with a prominent bulge resembling a sombrero', 9000.00, true, 13000, '2000-01-01', 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'A classic spiral galaxy with distinct spiral arms', 10000.00, true, 13000, '2100-01-01', 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', 384.40, true, 3475, 'Natural', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and innermost moon of Mars', 9378.00, true, 22, 'Natural', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost moon of Mars', 23460.00, true, 12, 'Natural', 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The innermost of the four Galilean moons of Jupiter', 421600.00, true, 3637, 'Natural', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'The second Galilean moon of Jupiter', 671100.00, true, 3121, 'Natural', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon of Jupiter and in the Solar System', 1070400.00, true, 5262, 'Natural', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second-largest moon of Jupiter', 1882700.00, true, 4820, 'Natural', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'A moon of Saturn known for its large impact crater Herschel', 185520.00, true, 396, 'Natural', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'An icy moon of Saturn with active geysers', 238040.00, true, 504, 'Natural', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'A moon of Saturn with a large impact basin named Odysseus', 294660.00, true, 1062, 'Natural', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'A moon of Saturn known for its heavily cratered surface', 377420.00, true, 1122, 'Natural', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'The second-largest moon of Saturn', 527040.00, true, 1528, 'Natural', 6);
INSERT INTO public.moon VALUES (13, 'Titan', 'The largest moon of Saturn and the only moon with a dense atmosphere', 1250100.00, true, 5150, 'Natural', 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'A moon of Saturn with a two-tone coloration', 3560800.00, true, 1469, 'Natural', 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'A moon of Uranus known for its complex surface', 78840.00, true, 472, 'Natural', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'A moon of Uranus with the brightest and possibly youngest surface among Uranian moons', 191020.00, true, 1157, 'Natural', 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'A moon of Uranus with a dark surface and cratered terrain', 266300.00, true, 1169, 'Natural', 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'The largest moon of Uranus', 435910.00, true, 1578, 'Natural', 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'The second-largest moon of Uranus', 583520.00, true, 1522, 'Natural', 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'The largest moon of Neptune and the only large moon with a retrograde orbit', 354760.00, true, 2707, 'Natural', 8);
INSERT INTO public.moon VALUES (21, 'Nereid', 'A moon of Neptune with an unusually elongated orbit', 5513400.00, true, 340, 'Natural', 8);
INSERT INTO public.moon VALUES (22, 'Charon', 'The largest moon of Pluto and part of a binary system with Pluto', 39000.00, true, 1212, 'Natural', 9);
INSERT INTO public.moon VALUES (23, 'Hydra', 'A moon of Pluto with an irregular shape', 64700.00, true, 55, 'Natural', 9);
INSERT INTO public.moon VALUES (24, 'Styx', 'A moon of Pluto with a highly elliptical orbit', 48640.00, true, 16, 'Natural', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System', 77.30, true, 4879, 0, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun', 38.00, true, 12104, 0, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 0.00, true, 12756, 1, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun', 56.30, true, 6792, 2, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System', 628.70, false, 139820, 79, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun', 1276.00, false, 116460, 82, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun', 2726.00, false, 50724, 27, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the Sun', 4352.00, false, 49244, 14, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper belt', 4800.00, true, 2374, 5, 'Dwarf', 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'An exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22', 600.00, true, 29000, 0, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'An exoplanet known for its evaporating atmosphere', 159.00, false, 71492, 0, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'A hot Jupiter exoplanet with a high carbon-to-oxygen ratio', 870.00, false, 129491, 0, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (13, 'TrES-4', 'A transiting exoplanet with low density and a large radius', 1400.00, true, 170918, 0, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (14, 'Gliese 436 b', 'A Neptune-sized exoplanet known for its low density and close orbit to its parent star', 33.00, false, 45465, 0, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (15, '55 Cancri e', 'An exoplanet with extreme temperatures and likely composed of carbon-rich material', 40.00, true, 198457, 0, 'Exoplanet', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System', 0.00, true, 1392000, 5778, 'G-type main-sequence', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', 8.60, true, 18200, 9940, 'A-type main-sequence', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'The primary star in the Alpha Centauri system', 4.37, true, 19700, 5790, 'G-type main-sequence', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'The secondary star in the Alpha Centauri system', 4.37, true, 17600, 5260, 'K-type main-sequence', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The closest star to the Sun', 4.24, true, 2480, 3042, 'M-type main-sequence', 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the constellation of Lyra', 25.00, true, 23700, 9602, 'A-type main-sequence', 2);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 'A red supergiant star in the constellation of Orion', 643.00, true, 1180000, 3500, 'M-type supergiant', 2);


--
-- Name: celestial_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_events_event_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: celestial_events celestial_events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT celestial_events_pkey PRIMARY KEY (celestial_events_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: celestial_events unique_name_event; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_events
    ADD CONSTRAINT unique_name_event UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

