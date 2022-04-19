-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XoYVjp
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "TEAMS" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "city" text   NOT NULL,
    CONSTRAINT "pk_TEAMS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Games" (
    "id" int   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "referee_id" int   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    "result" TEXT   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" int   NOT NULL,
    "start_date" text   NOT NULL,
    "end_date" text   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_game_id" FOREIGN KEY("game_id")
REFERENCES "Games" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_game_id" FOREIGN KEY("game_id")
REFERENCES "Games" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "TEAMS" ("id");

ALTER TABLE "Referees" ADD CONSTRAINT "fk_Referees_id" FOREIGN KEY("id")
REFERENCES "Games" ("referee_id");

