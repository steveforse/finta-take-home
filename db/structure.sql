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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_transactions (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    date date NOT NULL,
    amount_cents integer NOT NULL,
    amount_currency character varying NOT NULL,
    description character varying,
    status character varying,
    category_id bigint,
    account_type character varying NOT NULL,
    account_id bigint NOT NULL,
    remote_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: account_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_transactions_id_seq OWNED BY public.account_transactions.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bank_accounts (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    name character varying,
    bank_name character varying,
    account_number character varying,
    routing_number character varying,
    display_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying NOT NULL,
    category_group_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category_groups (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: category_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_groups_id_seq OWNED BY public.category_groups.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credit_cards (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    name character varying,
    last_4 character varying,
    brand character varying,
    expiration_month integer,
    expiration_year integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: account_transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_transactions ALTER COLUMN id SET DEFAULT nextval('public.account_transactions_id_seq'::regclass);


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: category_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_groups ALTER COLUMN id SET DEFAULT nextval('public.category_groups_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: account_transactions account_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_transactions
    ADD CONSTRAINT account_transactions_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_groups category_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_groups
    ADD CONSTRAINT category_groups_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_account_transactions_on_account; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_account_transactions_on_account ON public.account_transactions USING btree (account_type, account_id);


--
-- Name: index_account_transactions_on_amount_cents; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_account_transactions_on_amount_cents ON public.account_transactions USING btree (amount_cents);


--
-- Name: index_account_transactions_on_amount_currency; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_account_transactions_on_amount_currency ON public.account_transactions USING btree (amount_currency);


--
-- Name: index_account_transactions_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_account_transactions_on_category_id ON public.account_transactions USING btree (category_id);


--
-- Name: index_account_transactions_on_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_account_transactions_on_date ON public.account_transactions USING btree (date);


--
-- Name: index_account_transactions_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_account_transactions_on_status ON public.account_transactions USING btree (status);


--
-- Name: index_account_transactions_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_account_transactions_on_uuid ON public.account_transactions USING btree (uuid);


--
-- Name: index_bank_accounts_on_account_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bank_accounts_on_account_number ON public.bank_accounts USING btree (account_number);


--
-- Name: index_bank_accounts_on_bank_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bank_accounts_on_bank_name ON public.bank_accounts USING btree (bank_name);


--
-- Name: index_bank_accounts_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bank_accounts_on_name ON public.bank_accounts USING btree (name);


--
-- Name: index_bank_accounts_on_routing_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bank_accounts_on_routing_number ON public.bank_accounts USING btree (routing_number);


--
-- Name: index_bank_accounts_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bank_accounts_on_uuid ON public.bank_accounts USING btree (uuid);


--
-- Name: index_categories_on_category_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_category_group_id ON public.categories USING btree (category_group_id);


--
-- Name: index_categories_on_category_group_id_and_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_categories_on_category_group_id_and_name ON public.categories USING btree (category_group_id, name);


--
-- Name: index_category_groups_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_category_groups_on_name ON public.category_groups USING btree (name);


--
-- Name: index_credit_cards_on_brand; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_brand ON public.credit_cards USING btree (brand);


--
-- Name: index_credit_cards_on_expiration_month; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_expiration_month ON public.credit_cards USING btree (expiration_month);


--
-- Name: index_credit_cards_on_expiration_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_expiration_year ON public.credit_cards USING btree (expiration_year);


--
-- Name: index_credit_cards_on_last_4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_last_4 ON public.credit_cards USING btree (last_4);


--
-- Name: index_credit_cards_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_name ON public.credit_cards USING btree (name);


--
-- Name: index_credit_cards_on_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_credit_cards_on_uuid ON public.credit_cards USING btree (uuid);


--
-- Name: account_transactions fk_rails_4faf1153be; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_transactions
    ADD CONSTRAINT fk_rails_4faf1153be FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: categories fk_rails_564eeef2fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_564eeef2fe FOREIGN KEY (category_group_id) REFERENCES public.category_groups(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20251101074431'),
('20251101074311'),
('20251101074305'),
('20251101070548'),
('20251101070236');

