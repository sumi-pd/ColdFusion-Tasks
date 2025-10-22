-- Table: public.words

-- DROP TABLE IF EXISTS public.words;

CREATE TABLE IF NOT EXISTS public.words
(
    word character varying(255) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.words
    OWNER to root;