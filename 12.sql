-- Table: public.names

-- DROP TABLE IF EXISTS public.names;

CREATE TABLE IF NOT EXISTS public.names
(
    firstname text COLLATE pg_catalog."default",
    lastname text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.names
    OWNER to root;