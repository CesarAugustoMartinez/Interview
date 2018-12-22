create procedure uspStatesList as 
select * from States ;


create procedure uspPersonSearch  
	@State_Id int
as
	select *
	from person 
	where state_id = @State_Id;
go

		
create procedure uspPersonUpsert 
	@Type varchar(10),
	@PersonId int,
	@FirstName varchar(50),
	@LastName varchar(50),
	@StateId int,
	@Gender char(1),
	@Dob datetime
as
	if @Type = 'Add'
		insert into person (first_name, last_name, state_id, gender, dob) values (@FirstName,@LastName,@StateId,@Gender,@Dob);
	else if @Type = 'Edit'
		update person
		set first_name = @FirstName, last_name = @LastName, state_id = @StateId, gender = @Gender , dob = @Dob where person_id = @PersonId;
	
go

