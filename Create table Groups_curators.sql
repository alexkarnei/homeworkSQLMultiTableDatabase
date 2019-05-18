-- Table: public."Groups_curators"

-- DROP TABLE public."Groups_curators";

CREATE TABLE public."Groups_curators"
(
    id integer NOT NULL DEFAULT nextval('groups_curators_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    curator_id integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT groups_curators_pkey PRIMARY KEY (id),
    CONSTRAINT link_group_curator_on_group FOREIGN KEY (group_id)
        REFERENCES public."Groups" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "link_group_curators_on curator" FOREIGN KEY (curator_id)
        REFERENCES public."Curators" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Groups_curators"
    OWNER to postgres;
