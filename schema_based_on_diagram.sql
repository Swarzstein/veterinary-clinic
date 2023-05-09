create table patients (
  id serial primary key not null,
  name varchar(100), 
  date_of_birth date
);

create medical_histories (
  id serial primary key not null,
  admitted_at timestamp,
  patient_id integer references patients(id),
  status varchar(100)
);
