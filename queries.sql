/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE animals.name like '%mon';
SELECT name FROM animals WHERE animals.date_of_birth >= '2016-01-01' AND animals.date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE animals.neutered = true AND animals.escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE animals.name = 'Agumon' OR animals.name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE animals.weight_kg > 10.5;
SELECT * FROM animals WHERE animals.neutered = true;
SELECT * FROM animals WHERE animals.name != 'Gabumon';
SELECT * FROM animals WHERE animals.weight_kg >= 10.4 AND animals.weight_kg <= 17.3;
