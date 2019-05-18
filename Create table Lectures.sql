-- Table: public."Lectures"

-- DROP TABLE public."Lectures";

CREATE TABLE public."Lectures"
(
    id integer NOT NULL DEFAULT nextval('"Lectures_id_seq"'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    lecture_room character varying(10485760) COLLATE pg_catalog."default" NOT NULL,
    subject_id integer NOT NULL,
    teacher_id integer NOT NULL,
    CONSTRAINT "Lectures_pkey" PRIMARY KEY (id),
    CONSTRAINT link_lecture_on_subject FOREIGN KEY (subject_id)
        REFERENCES public."Subject" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT link_lectures_on_teachers FOREIGN KEY (teacher_id)
        REFERENCES public."Teachers" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Lectures"
    OWNER to postgres;
