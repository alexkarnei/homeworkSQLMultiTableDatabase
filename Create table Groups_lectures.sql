-- Table: public."Groups_lectures"

-- DROP TABLE public."Groups_lectures";

CREATE TABLE public."Groups_lectures"
(
    id integer NOT NULL DEFAULT nextval('"Groups_lectures_id_seq"'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    group_id integer NOT NULL,
    lecture_id integer NOT NULL,
    CONSTRAINT "Groups_lectures_pkey" PRIMARY KEY (id),
    CONSTRAINT link_groups_lecture_on_group FOREIGN KEY (group_id)
        REFERENCES public."Groups" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Groups_lectures"
    OWNER to postgres;
