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
