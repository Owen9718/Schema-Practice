-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XoYVjp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Regions" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" int   NOT NULL,
    "name" TEXT   NOT NULL,
    "preffered_region_id" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" int   NOT NULL,
    "title" TEXT   NOT NULL,
    "text" TEXT   NOT NULL,
    "location" TEXT   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" int   NOT NULL,
    "Category" TEXT   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Regions" ADD CONSTRAINT "fk_Regions_id" FOREIGN KEY("id")
REFERENCES "Posts" ("region_id");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_id" FOREIGN KEY("id")
REFERENCES "Posts" ("user_id");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_preffered_region_id" FOREIGN KEY("preffered_region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Categories" ADD CONSTRAINT "fk_Categories_id" FOREIGN KEY("id")
REFERENCES "Posts" ("category_id");

