CREATE TABLE "readers" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "address" varchar,
  "birthday" timestamp
);

CREATE TABLE "libraries" (
  "id" SERIAL PRIMARY KEY
);

CREATE TABLE "books" (
  "isbn" int PRIMARY KEY,
  "title" varchar,
  "author" varchar,
  "year" int,
  "number_of_pages" int,
  "publisher_id" int
);

CREATE TABLE "copies" (
  "id" int PRIMARY KEY,
  "position" varchar,
  "isbn" int,
  "library_id" int
);

CREATE TABLE "publishers" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE "categories" (
  "name" varchar PRIMARY KEY,
  "parent_name" varchar
);

CREATE TABLE "takes" (
  "reader_id" int,
  "library_id" int,
  "copy_id" int,
  "return_date" timestamp,
  PRIMARY KEY ("reader_id", "library_id", "copy_id")
);

CREATE TABLE "assigns" (
  "library_id" int,
  "category_name" varchar,
  "isbn" int,
  PRIMARY KEY ("library_id", "category_name", "isbn")
);

ALTER TABLE "books" ADD FOREIGN KEY ("publisher_id") REFERENCES "publishers" ("id");

ALTER TABLE "copies" ADD FOREIGN KEY ("isbn") REFERENCES "books" ("isbn");

ALTER TABLE "copies" ADD FOREIGN KEY ("library_id") REFERENCES "libraries" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("parent_name") REFERENCES "categories" ("name");

ALTER TABLE "takes" ADD FOREIGN KEY ("copy_id") REFERENCES "copies" ("id");

ALTER TABLE "takes" ADD FOREIGN KEY ("reader_id") REFERENCES "readers" ("id");

ALTER TABLE "takes" ADD FOREIGN KEY ("library_id") REFERENCES "libraries" ("id");

ALTER TABLE "assigns" ADD FOREIGN KEY ("isbn") REFERENCES "books" ("isbn");

ALTER TABLE "assigns" ADD FOREIGN KEY ("category_name") REFERENCES "categories" ("name");

ALTER TABLE "assigns" ADD FOREIGN KEY ("library_id") REFERENCES "libraries" ("id");
