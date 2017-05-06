--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: candidates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE candidates (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    lastname character varying NOT NULL,
    firstname character varying NOT NULL,
    othernames character varying,
    date_of_birth date,
    sex character varying DEFAULT 'mal'::character varying,
    highest_qualitfication character varying,
    occupation character varying,
    image_url character varying,
    is_presidential_candidate boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    election_id uuid,
    political_party_id uuid
);


--
-- Name: elections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE elections (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    year integer NOT NULL,
    started_at timestamp without time zone NOT NULL,
    ended_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: political_parties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE political_parties (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    slogan text NOT NULL,
    chairman text NOT NULL,
    general_secretary text NOT NULL,
    logo_url text NOT NULL,
    colors text[] NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: candidates candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);


--
-- Name: elections elections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY elections
    ADD CONSTRAINT elections_pkey PRIMARY KEY (id);


--
-- Name: political_parties political_parties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY political_parties
    ADD CONSTRAINT political_parties_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_candidates_on_election_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_candidates_on_election_id ON candidates USING btree (election_id);


--
-- Name: index_candidates_on_political_party_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_candidates_on_political_party_id ON candidates USING btree (political_party_id);


--
-- Name: index_elections_on_year; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_elections_on_year ON elections USING btree (year);


--
-- Name: index_political_parties_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_political_parties_on_name ON political_parties USING btree (name);


--
-- Name: candidates fk_rails_0a25b794fc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY candidates
    ADD CONSTRAINT fk_rails_0a25b794fc FOREIGN KEY (election_id) REFERENCES elections(id);


--
-- Name: candidates fk_rails_f740c7828d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY candidates
    ADD CONSTRAINT fk_rails_f740c7828d FOREIGN KEY (political_party_id) REFERENCES political_parties(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('0'),
('20170412110704'),
('20170412111942'),
('20170412141912'),
('20170412142316'),
('20170412142407'),
('20170505231914'),
('20170506012637');


