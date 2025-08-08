--Demo Table
select * from Employees

--Display the Maximum Salary is giving to Employee
Select Max(Sal) as Salary From Employees Where Sal is not null

--Display the least Salary is giving to Employee
Select Min(Sal) as Salary From Employees Where Sal is not null

--Display the Total Salary company spends on Employees
Select Sum(Sal) as [Total Salary] From Employees

--Display the Average Salary Company spends
Select Round(Avg(Sal),0) as [Average Salary] From Employees

--Display the Average Salary of Manager
Select Avg(Sal) as [Average Salary] From Employees Where Job='Manager'

--Display the Total Number of Employee Working in Company
Select Count(*) as [Total Employee] from Employees

-- How many employees joined in 1981 year ?
select Count(*) as [No of Employees] From Employees Where Hiredate Like '1981%'
		--OR
select Count(*) as [No of Employees] From Employees Where Hiredate Between '1981-01-01' And '1981-12-31'

--Joining Week with Days
Select Hiredate,Datename(DW,Hiredate) as [Week Day] From Employees Where Hiredate is not null

--No. of employees joined on Thursday ?
Select Count(*) as [No of Employees] From Employees Where Datename(DW,Hiredate)='Thursday'
				--OR
Select Count(*) as [No of Employees] From Employees Where Datepart(DW,Hiredate)=5

--Hiredate with Quarted List
select  Hiredate,Datepart(QQ,Hiredate) as [Quarter] from Employees Where Hiredate is not null

--No. of employees joined in 2nd quarter of  1981 year ?
Select Count(*) as [No of Employee] From Employees Where Datepart(QQ,Hiredate)=2 
				--OR
Select Count(*) as [No of Employee] From Employees Where Datename(QQ,Hiredate)=2 

--Display dept wise no of employees ?
Select Deptno,Count(*) as [No of Employee] From Employees Group By Deptno

--Display job wise  min sal,max sal,total sal and no of employees ?
Select Job,Min(Sal) as [Min Salary],Max(Sal) as [Max Salary],Sum(Sal) as [Total Salary],Count(*) as [Total Employee] From Employees
Group By Job

--Display year wise no of employees joined ?
Select Datepart(YY,Hiredate) as Years, Count(*) as [No of Employee] From Employees 
Where HIREDATE IS NOT NULL Group By Datepart(YY,Hiredate)

--Display day wise no of employees joined ?
Select Datename(DW,Hiredate) as Day,Count(*) as [No of Employee] From Employees 
Where Hiredate IS NOT NULL Group By Datename(DW,Hiredate),Datepart(DW,Hiredate) Order By Datepart(DW,Hiredate)

--Display no of employees joined in each month in the year 1981 ?
Select Datename(MM,Hiredate) as Month, Count(*) as [No of Employee] From Employees Where Hiredate IS NOT Null
Group By Datename(MM,Hiredate), Datepart(MM,Hiredate) Order By Datepart(MM,Hiredate)

--Find the departments having more than 3 employees ?
Select Deptno,Count(*) as [No of Employee] From Employees Group By Deptno Having Count(*)>3

--Display job wise no of employees where job = clerk,manager and no of employees > 3 ? 
Select Job, Count(*) as [No of Employee] From Employees Where Job IN ('Clerk','Manager') Group By Job
Having Count(*)>3

--Display year wise and with in year quarter wise no of employees ?
Select Datepart(YY,Hiredate) as Year,Datepart(QQ,Hiredate) as Quarter, Count(*) as [No of Employee] From Employees
Where Hiredate IS NOT NULL
Group By Datepart(YY,Hiredate),Datepart(QQ,Hiredate) Order By Datepart(YY,Hiredate)



