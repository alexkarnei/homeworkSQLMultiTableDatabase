-- Table: public."Curators"

-- DROP TABLE public."Curators";

CREATE TABLE public."Curators"
(
    id integer NOT NULL DEFAULT nextval('"Curators_id_seq"'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(10485760) COLLATE pg_catalog."default" NOT NULL,
    surname character varying(10485760) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Curators_pkey" PRIMARY KEY (id),
    CONSTRAINT check_surname_not_empty CHECK (surname::text <> ' '::text) NOT VALID,
    CONSTRAINT check_name_not_empty CHECK (name::text <> ' '::text)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Curators"
    OWNER to postgres;
