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


INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '2000-04-23'), 
  ('Maisy Smith', 26, '2019-01-17'), 
  ('Stephanie Mendez', 64, '1981-05-04'), 
  ('Jack Harkness', 38, '2008-06-08');
  
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON (s.name = 'Pokemon' AND v.name = 'William Tatcher');
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v 
  ON ((s.name = 'Pokemon' OR s.name = 'Digimon') AND v.name = 'Stephanie Mendez');
  
WITH ins (date, animal, vet) 
AS (
  VALUES 
  (date '2020-05-24', text 'Agumon', text 'William Tatcher'),
  (date '2020-07-22', text 'Agumon', text 'Stephanie Mendez'),
  (date '2021-02-02', text 'Gabumon', text 'Jack Harkness'),
  (date '2020-01-05', text 'Pikachu', text 'Maisy Smith'),
  (date '2020-03-08', text 'Pikachu', text 'Maisy Smith'),
  (date '2020-05-14', text 'Pikachu', text 'Maisy Smith'),
  (date '2021-05-04', text 'Devimon', text 'Stephanie Mendez'),
  (date '2021-02-24', text 'Charmander', text 'Jack Harkness'),
  (date '2019-12-21', text 'Plantmon', text 'Maisy Smith'),
  (date '2020-08-10', text 'Plantmon', text 'William Tatcher'),
  (date '2021-04-07', text 'Plantmon', text 'Maisy Smith'),
  (date '2019-09-29', text 'Squirtle', text 'Stephanie Mendez'),
  (date '2020-10-03', text 'Angemon', text 'Jack Harkness'),
  (date '2020-11-04', text 'Angemon', text 'Jack Harkness'),
  (date '2019-01-24', text 'Boarmon', text 'Maisy Smith'),
  (date '2019-05-15', text 'Boarmon', text 'Maisy Smith'),
  (date '2020-02-27', text 'Boarmon', text 'Maisy Smith'),
  (date '2020-08-03', text 'Boarmon', text 'Maisy Smith'),
  (date '2020-05-24', text 'Blossom', text 'Stephanie Mendez'),
  (date '2021-01-11', text 'Blossom', text 'William Tatcher')
) INSERT INTO visits (
  date_of_visit, 
  animals_id, 
  vets_id
) SELECT ins.date, animals.id, vets.id FROM ins JOIN animals ON ins.animal = animals.name JOIN vets ON ins.vet = vets.name;


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
