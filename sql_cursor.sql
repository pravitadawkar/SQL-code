create table employee(eno int primary key,ename varchar(20),department varchar(30),salary int);
select * from employee;
insert into employee(eno,ename,department,salary)values
(10,'pravita','devloper',3000),
(20,'rutuja','hr',3000),
(30,'shruti','admin',6000),
(40,'mahesh','It',5000),
(50,'sharad','hr',9000);
ALTER TABLE employee DROP COLUMN eno;

ALTER TABLE employee
    ADD eno int identity not null;
select * from employee;

DECLARE @eno int,@ename varchar(20),@salary int
DECLARE emp_cursor CURSOR FOR
SELECT employee.eno,employee.ename,employee.salary from employee
order by employee.salary;
open emp_cursor
fetch next from emp_cursor into @eno,@ename,@salary

print'Eno Ename Esalary'
while @@fetch_status=0
 begin
 print ''+CAST(@eno as varchar(10)) +' '+ cast(@ename as varchar(20))+
 ' '+cast(@salary as varchar(15)) 
 fetch next from emp_cursor into @eno,@ename,@salary
 end
 close emp_cursor
 deallocate emp_cursor
 

 DECLARE @salary1 int;
 select @salary1=2000;


DECLARE Employee_Cursor CURSOR FOR select * from employee
OPEN Employee_Cursor;

FETCH NEXT from Employee_Cursor 

WHILE @@FETCH_STATUS = 0 
   BEGIN
      --select @salary1 = 500;
      --update employee set salary = employee.salary+@salary1;
	  --
	  --print 'Salary' + CAST(@salary as varchar(10)
     update employee set salary=@salary1
	 select @salary1=@salary1+500

	 FETCH NEXT from Employee_Cursor
   END;

CLOSE Employee_Cursor;
DEALLOCATE Employee_Cursor;


