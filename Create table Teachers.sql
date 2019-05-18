-- Table: public."Teachers"

-- DROP TABLE public."Teachers";

CREATE TABLE public."Teachers"
(
    id integer NOT NULL DEFAULT nextval('"Teachers_id_seq"'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(10485760) COLLATE pg_catalog."default" NOT NULL,
    salary money NOT NULL,
    surname character varying(10485760) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Teachers_pkey" PRIMARY KEY (id),
    CONSTRAINT check_teachers_solary CHECK (salary > 0::money),
    CONSTRAINT check_teachers_name CHECK (name::text <> ' '::text),
    CONSTRAINT check_teachers_surname CHECK (surname::text <> ' '::text)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Teachers"
    OWNER to postgres;
