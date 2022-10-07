CREATE TABLE "cities" (
  "region" varchar,
  "name" varchar,
  PRIMARY KEY ("region", "name")
);

CREATE TABLE "stations" (
  "name" varchar PRIMARY KEY,
  "tracks" int,
  "region" varchar,
  "city_name" varchar
);

CREATE TABLE "trains" (
  "train_nr" int PRIMARY KEY,
  "length" int,
  "start_station_name" varchar,
  "end_station_name" varchar
);

CREATE TABLE "connections" (
  "station1_name" varchar,
  "station2_name" varchar,
  "train_nr" int,
  "departure" timestamp,
  "arrival" timestamp,
  PRIMARY KEY ("station1_name", "station2_name", "train_nr")
);

ALTER TABLE "connections" ADD FOREIGN KEY ("station1_name") REFERENCES "stations" ("name");

ALTER TABLE "connections" ADD FOREIGN KEY ("station2_name") REFERENCES "stations" ("name");

ALTER TABLE "connections" ADD FOREIGN KEY ("train_nr") REFERENCES "trains" ("train_nr");

ALTER TABLE "trains" ADD FOREIGN KEY ("start_station_name") REFERENCES "stations" ("name");

ALTER TABLE "trains" ADD FOREIGN KEY ("end_station_name") REFERENCES "stations" ("name");

ALTER TABLE "stations" ADD FOREIGN KEY ("region", "city_name") REFERENCES "cities" ("region", "name");
