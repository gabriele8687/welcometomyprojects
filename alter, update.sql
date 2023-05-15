select * from Employee

update Employee
set FirstName= 'Tony'
where FirstName ='Ken'
if @@error =0
begin
print ' warning: An error occured'
end
else
print 'update successful'

update Employee
set FirstName= 'ken'
where FirstName ='tony'
if @@rowcount =0
begin
print ' warning: An error occured'
end
else
print 'update successful'




alter table employee
add PPS int 

update Employee set PPS = 45468 where EmployeeNumber =1
update Employee set PPS = 55543 where EmployeeNumber =2
update Employee set PPS = 86871 where EmployeeNumber =3
update Employee set PPS = 33412 where EmployeeNumber =4
update Employee set PPS = 69854 where EmployeeNumber =5
update Employee set PPS = 46801 where EmployeeNumber =6
update Employee set PPS = 54199 where EmployeeNumber =7
update Employee set PPS = 76352 where EmployeeNumber =8
update Employee set PPS = 32132 where EmployeeNumber =9
update Employee set PPS = 91531 where EmployeeNumber =10
update Employee set PPS = 37823 where EmployeeNumber =11
update Employee set PPS = 62162 where EmployeeNumber =12

drop proc insertemployee

create proc insertemployee
@FirstName char (25),
@LatsName char (25),
@Department char (35),
@Phone char (12),
@Email char (100),
@isdeleted char(1),
@PSS char (10)
as
/*try to insert into the table*/
   insert into employee values (@FirstName, @LatsName, @Department,@Phone, @Email, @PSS, @isdeleted)
-- error checking for any issues 
if @@error  <> 0 or @@rowcount <> 1
begin
print 'something went wrong ' -- message if there is an error
return -1
end
else return 0 --all is well

execute insertemployee 'brendan', 'Duffy','Administration', '369-180-2025', 'BD@WPC.com', 'N', '48497'
execute insertemployee 'bb', 'dd','marketing', '369-180-2025', '@WPC.com', 'N', '48497'



