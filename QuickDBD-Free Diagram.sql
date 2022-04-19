-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XoYVjp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Doctors" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" INT   NOT NULL,
    "name" TEXT   NOT NULL,
    "birthday" TEXT   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Vists" (
    "id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "date" int   NOT NULL,
    CONSTRAINT "pk_Vists" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" int   NOT NULL,
    "vist_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "notes" TEXT   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" int   NOT NULL,
    "name_of_disease" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_id" FOREIGN KEY("id")
REFERENCES "Vists" ("doctor_id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_id" FOREIGN KEY("id")
REFERENCES "Vists" ("patient_id");

ALTER TABLE "Vists" ADD CONSTRAINT "fk_Vists_id" FOREIGN KEY("id")
REFERENCES "Diagnoses" ("vist_id");

ALTER TABLE "Diseases" ADD CONSTRAINT "fk_Diseases_id" FOREIGN KEY("id")
REFERENCES "Diagnoses" ("disease_id");

