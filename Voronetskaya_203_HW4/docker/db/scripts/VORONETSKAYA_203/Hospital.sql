CREATE TABLE "personnel" (
  "pers_nr" int PRIMARY KEY,
  "name" varchar,
  "stat_nr" int
);

CREATE TABLE "stations" (
  "stat_nr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "caregivers" (
  "pers_nr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctors" (
  "pers_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "rooms" (
  "room_nr" int PRIMARY KEY,
  "number_of_beds" int,
  "stat_nr" int
);

CREATE TABLE "patients" (
  "patient_nr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "pers_nr" int,
  "room_nr" int,
  "from" timestamp,
  "to" timestamp
);

ALTER TABLE "patients" ADD FOREIGN KEY ("pers_nr") REFERENCES "doctors" ("pers_nr");

ALTER TABLE "patients" ADD FOREIGN KEY ("room_nr") REFERENCES "rooms" ("room_nr");

ALTER TABLE "rooms" ADD FOREIGN KEY ("stat_nr") REFERENCES "stations" ("stat_nr");

ALTER TABLE "personnel" ADD FOREIGN KEY ("stat_nr") REFERENCES "stations" ("stat_nr");

ALTER TABLE "caregivers" ADD FOREIGN KEY ("pers_nr") REFERENCES "personnel" ("pers_nr");

ALTER TABLE "doctors" ADD FOREIGN KEY ("pers_nr") REFERENCES "personnel" ("pers_nr");
