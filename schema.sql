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


CREATE TABLE owners (
  id serial primary key not null,
  full_name varchar(100) not null,
  age numeric not null
);
CREATE TABLE species (
  id serial primary key not null,
  name varchar(100) not null
);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);


create table vets (
  id serial primary key not null,
  name varchar(100) not null, 
  age integer not null, 
  date_of_graduation date not null
);
create table specializations (
  species_id int, 
  vets_id int, 
  constraint specializations_pk primary key (species_id, vets_id), 
  constraint fk_species foreign key (species_id) references species (id), 
  constraint fk_vets foreign key (vets_id) references vets (id)
);
CREATE TABLE visits ( 
  id serial primary key not null,
  animals_id int, 
  vets_id int, 
  date_of_visit date,  
  CONSTRAINT fk_animals FOREIGN key(animals_id) REFERENCES animals(id), 
  CONSTRAINT fk_vets FOREIGN key(vets_id) REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

/* Create Indexes for Tables */
CREATE INDEX animal_visits_index ON visits(animal_id);
CREATE INDEX visits_index ON visits(vet_id);
CREATE INDEX owners_index ON owners(email);