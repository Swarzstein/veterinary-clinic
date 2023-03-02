/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
\c vet_clinic;
CREATE TABLE animals (
    id serial primary key not null,
    name varchar(100) not null,
    date_of_birth date not null,
    escape_attempts int not null,
    neutered bool not null,
    weight_kg decimal not null
);

ALTER TABLE animals ADD COLUMN species varchar(50);
