-- Table: public.employment_applications

-- DROP TABLE IF EXISTS public.employment_applications;

CREATE TABLE IF NOT EXISTS public.employment_applications
(
    id integer NOT NULL DEFAULT nextval('employment_applications_id_seq'::regclass),
    first_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(150) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "position" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    relocate character varying(10) COLLATE pg_catalog."default" NOT NULL,
    start_date date NOT NULL,
    portfolio character varying(255) COLLATE pg_catalog."default",
    resume character varying(255) COLLATE pg_catalog."default",
    salary_dollars numeric(10,0) NOT NULL,
    salary_cents numeric(2,0) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT employment_applications_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employment_applications
    OWNER to root;