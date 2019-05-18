-- Table: public."Groups"

-- DROP TABLE public."Groups";

CREATE TABLE public."Groups"
(
    id integer NOT NULL DEFAULT nextval('"Groups_id_seq"'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(10) COLLATE pg_catalog."default" NOT NULL,
    year integer NOT NULL,
    department_id integer NOT NULL,
    CONSTRAINT "Groups_pkey" PRIMARY KEY (id),
    CONSTRAINT groups_name_unique UNIQUE (name)
,
    CONSTRAINT link_groups_on_departments FOREIGN KEY (department_id)
        REFERENCES public."Departments" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT check_name_not_empty CHECK (name::text <> ' '::text),
    CONSTRAINT check_year_valid CHECK (year > 0 AND year < 6)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Groups"
    OWNER to postgres;
