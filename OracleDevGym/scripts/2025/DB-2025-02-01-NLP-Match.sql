drop table if EXISTS qz_patients;

create table qz_patients (
  patient_id  integer primary key,
  given_names varchar2(20),
  family_name varchar2(20)
);

insert into qz_patients
values ( 1, 'Susan', 'Smith' ),
       ( 2, 'Sarah', 'Smyth' ),
       ( 3, 'Simon', 'Saxon' );

commit;

select * from qz_patients
where soundex ( family_name ) = soundex ( 'Smith' )
order by patient_id;


select * from qz_patients
where utl_match.edit_distance ( family_name, 'Smith' ) < 2
order by patient_id;


select * from qz_patients
where utl_match.jaro_winkler ( family_name, 'Smith' ) > 80
order by patient_id;


select * from qz_patients
where fuzzy_match ( jaro_winkler, family_name, 'Smith' ) > 80
order by patient_id;

select * from qz_patients
where phonic_encode ( double_metaphone, family_name ) = 'SM0'
order by patient_id;
