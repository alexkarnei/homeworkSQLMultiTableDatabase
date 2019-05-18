-- Table: public."Subject"

-- DROP TABLE public."Subject";

CREATE TABLE public."Subject"
(
    id integer NOT NULL DEFAULT nextval('"Subject_id_seq"'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Subject_pkey" PRIMARY KEY (id),
    CONSTRAINT unique_name UNIQUE (name)
,
    CONSTRAINT check_name_not_empty CHECK (name::text <> ' '::text)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Subject"
    OWNER to postgres;
