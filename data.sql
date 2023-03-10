/* Populate database with sample data. */

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Agumon', '2020-02-03', 0, true, 10.23);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Gabumon', '2018-11-15', 2, true, 8);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Pikachu', '2021-01-07', 1, false, 15.04);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Devimon', '2017-05-12', 5, true, 11);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Charmander', '2020-02-08', 0, false, -11);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Plantmon', '2021-11-15', 2, true, -5.7);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Squirtle', '1993-04-02', 3, false, -12.13);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Angemon', '2005-06-12', 1, true, -45);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Boarmon', '2005-06-07', 7, true, 20.4);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Blossom', '1998-10-13', 3, true, 17);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Ditto', '2022-05-14', 4, true, 22);

insert into owners (full_name, age) values ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
update animals set species_id = species.id from species where species.name = 'Digimon' and animals.name like '%mon';
update animals set species_id = species.id from species where species.name = 'Pokemon' and animals.species_id is null;
update animals set owner_id = owners.id from owners where owners.full_name = 'Sam Smith' and animals.name = 'Agumon';
update animals set owner_id = owners.id from owners where owners.full_name = 'Jennifer Orwell' and (animals.name = 'Gabumon' or animals.name = 'Pikachu');
update animals set owner_id = owners.id from owners where owners.full_name = 'Bob' and (animals.name = 'Devimon' or animals.name = 'Plantmon');
update animals set owner_id = owners.id from owners where owners.full_name = 'Melody Pond' and (animals.name = 'Charmander' or animals.name = 'Squirtle' or animals.name = 'Blossom');
update animals set owner_id = owners.id from owners where owners.full_name = 'Dean Winchester' and (animals.name = 'Angemon' or animals.name = 'Boarmon');
