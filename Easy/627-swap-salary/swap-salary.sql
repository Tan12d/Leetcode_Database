update Salary
set sex = 
if (sex = 'f', 'm', if(sex  = "m", "f" ,""));