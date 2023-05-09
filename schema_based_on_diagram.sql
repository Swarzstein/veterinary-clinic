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

create treatments (
  id serial primary key not null,
  type varchar(100),
  name varchar(100),
);

create medical_histories_treatments (
  medical_history_id integer references medical_histories(id),
  treatment_id integer references treatments(id),
  primary key (medical_history_id, treatment_id)
);
