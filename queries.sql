/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE animals.name like '%mon';
SELECT name FROM animals WHERE animals.date_of_birth >= '2016-01-01' AND animals.date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE animals.neutered = true AND animals.escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE animals.name = 'Agumon' OR animals.name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE animals.weight_kg > 10.5;
SELECT * FROM animals WHERE animals.neutered = true;
SELECT * FROM animals WHERE animals.name != 'Gabumon';
SELECT * FROM animals WHERE animals.weight_kg >= 10.4 AND animals.weight_kg <= 17.3;


BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint_1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint_1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species;


select name from animals inner join owners on animals.owner_id = owners.id where owners.full_name = 'Melody Pond';
select animals.name from animals inner join species on animals.species_id = species.id where species.name = 'Pokemon';
select owners.full_name, animals.name from owners left join animals on owners.id = animals.owner_id;
select species.name, count(*) from species inner join animals on animals.species_id = species.id group by species.name;
select animals.name from animals inner join owners on animals.owner_id = owners.id inner join species on animals.species_id = species.id where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';
select owners.full_name from owners inner join animals on owners.id = animals.owner_id group by owners.full_name order by count(*) desc limit 1;


SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT COUNT(animals.id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';
SELECT vet.name, spec.name From vets vet LEFT JOIN specializations s ON vet.id = s.vets_id LEFT JOIN species spec ON s.species_id = spec.id;
SELECT a.name FROM animals a JOIN visits v ON a.id = v.animals_id JOIN vets ON v.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND (v.date_of_visit >= '2020-04-01' AND v.date_of_visit <= '2020-08-30');
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;
SELECT a.name AS animal, a.date_of_birth AS Birth, s.name AS Specie, o.full_name AS Owner, vet.name AS veterinary, vet.date_of_graduation AS Graduation, v.date_of_visit AS Consult_date FROM animals a JOIN species s ON a.species_id = s.id JOIN owners o ON a.owner_id = o.id JOIN visits v ON a.id = v.animals_id JOIN vets vet ON v.vets_id = vet.id ORDER BY v.date_of_visit DESC LIMIT 1;
SELECT COUNT(*) AS unspecialized_visits FROM animals a JOIN visits v ON v.animals_id = a.id JOIN vets ON v.vets_id = vets.id LEFT JOIN specializations s ON vets.id = s.vets_id AND a.species_id = s.species_id WHERE s.vets_id IS NULL;
SELECT s.name From species s JOIN animals a ON s.id = a.species_id JOIN visits v ON a.id = v.animals_id JOIN vets ON v.vets_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY s.name ORDER BY COUNT(*) DESC LIMIT 1;
