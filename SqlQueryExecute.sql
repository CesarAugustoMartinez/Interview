execute uspStatesList;

execute uspPersonSearch '3','Martinez';


execute uspPersonUpsert 'Edit','5','Gaby','Castro','2','F','08/06/1987';
select * from person;
