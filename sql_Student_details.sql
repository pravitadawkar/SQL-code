--Studentmastertable
Create table Student_Master(Id int ,name varchar(20),Email varchar(30),MobileNo varchar(10) ,Gender varchar(10),Education varchar(22),
DateOfBirth date,CreatedDate date,IsActive varchar(12));
select * from Student_Master; 
Insert into Student_Master (Id,name,Email,MobileNo,Gender,Education,DateOfBirth,CreatedDate,IsActive)Values
(01,'Pravita','pravi@gmail.com','9063253281','Female','MCA','1999-03-15','2021-08-14','true');
Insert into Student_Master (Id,name,Email,MobileNo,Gender,Education,DateOfBirth,CreatedDate,IsActive)Values
(02,'Rutuja','rutuja@gmail.com','9078953281','Female','MCA','1999-06-27','2021-08-14','false'),
(03,'Shruti','shruti@gmail.com','9096793281','Female','MCA','1999-07-05','2021-08-14','true'),
(04,'Shreyash','shreyash@gmail.com','9043253281','Male','MCA','1999-10-25','2021-08-14','false'),
(05,'Pranav','pranav@gmail.com','9063567881','Male','MCA','1999-11-17','2021-08-14','true');

--Studentaddress table
create table Studentaddress(StudentId int,Address varchar(30),Tahsil varchar(10),District varchar(12),ZipCode int);
insert into Studentaddress(StudentId,Address,Tahsil,District,ZipCode)values
(01,'Maulipark alandi','Khed','pune',67845),
(02,'VadgavRoad alandi','khed','pune',67845),
(03,'Dhayri','Khed','pune',58687),
(04,'Kothrud','pune','pune',58687),
(05,'Shivajinagar','pune','pune',58687);
select * from Studentaddress;

--Studentmark table
create table StudentMark(StudentId int,Subject varchar(15),Marks int,Percentage varchar(5),Grade char);
insert into StudentMark(StudentId,Subject,Marks,Percentage,Grade)values
(01,'English',67,'63%','C'),
(01,'Biology',87,'83%','B'),
(01,'Hindi',71,'76%','C'),
(01,'physics',87,'83%','B'),
(01,'Chemistry',91,'90%','A'),

(02,'English',87,'83%','B'),
(02,'Biology',77,'74%','C'),
(02,'Hindi',51,'54%','F'),
(02,'physics',81,'83%','B'),
(02,'Chemistry',72,'67%','C'),

(03,'English',60,'63%','C'),
(03,'Biology',86,'83%','B'),
(03,'Hindi',75,'76%','C'),
(03,'physics',47,'50%','F'),
(03,'Chemistry',69,'72%','C'),

(04,'English',67,'63%','C'),
(04,'Biology',64,'63%','C'),
(04,'Hindi',71,'76%','C'),
(04,'physics',87,'83%','B'),
(04,'Chemistry',67,'70%',''),

(05,'English',77,'79%','B'),
(05,'Biology',47,'53%','F'),
(05,'Hindi',63,'76%','C'),
(05,'physics',59,'63%','D'),
(05,'Chemistry',86,'90%','B');

select * from StudentMark;

-- Select all records from StudentMaster table
--Insert new record in StudentMaster table
--Update Student name using StudentId

select * from Student_Master;
Insert into Student_Master (Id,name,Email,MobileNo,Gender,Education,DateOfBirth,CreatedDate,IsActive)Values
(06,'Harshda','harshra@gmail.com','9063678281','Female','MCA','1998-08-15','2021-10-14','true');
update Student_Master set Education='MBA',name='pooja' where Id=3;

-- Write a join query to capture below resultset
--StudentName, Email, Mobile, Address, Tahsil, District, Zipcode

SELECT Student_Master.name,Student_Master.Email,Student_Master.MobileNo,Studentaddress.Address,Studentaddress.Tahsil,
Studentaddress.District,Studentaddress.ZipCode
FROM Student_Master
INNER JOIN Studentaddress ON Student_Master.Id=Studentaddress.StudentId;

--Write a sql query to find students whose percentage is greater than 50%

select Student_Master.Id,Student_Master.name,StudentMark.Percentage
from Student_Master
INNER JOIN StudentMark on Student_Master.Id=StudentMark.StudentId where StudentMark.Percentage>'50%';

-- Write a sql query to find students whose marks is greater than 200
select Student_Master.name,sum(StudentMark.Marks)
from Student_Master
INNER JOIN StudentMark on Student_Master.Id=StudentMark.StudentId Group by Student_Master.name;

--Write a sql query to find students total marks with descending order
select Student_Master.name,sum(StudentMark.Marks)
from Student_Master
INNER JOIN StudentMark on Student_Master.Id=StudentMark.StudentId Group by Student_Master.name 
Order by sum(StudentMark.Marks) desc

--Write a sql query to capture below resultset (Use scalar function)
--StudentName, Email, Mobile, TotalMarks
CREATE FUNCTION InformationOfStudent()
returns int
as
begin
return
(
select Student_Master.name,sum(StudentMark.Marks),Student_Master.Email,Student_Master.MobileNo
from Student_Master
INNER JOIN StudentMark on Student_Master.Id=StudentMark.StudentId Group by Student_Master.name 
)
end
select dbo.InformationOfStudent()


--Write a sql query to capture below resultset (Use user defined scalar function for total marks)
--StudentName, Email, Mobile, TotalMarks


 
 

