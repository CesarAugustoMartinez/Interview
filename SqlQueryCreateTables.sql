Create table States
(
	state_id int identity(1,1) constraint PK_states_state_id primary key clustered (state_id),
	state_code char(2)
)

Create table person
(
	person_id int identity(1,1) constraint PK_person_person_id primary key clustered (person_id),
	first_name varchar (50),
	last_name varchar(50),
	state_id int constraint FK_state_id_States foreign key (state_id) references States (state_id),
	gender char(1),
	dob datetime
) 