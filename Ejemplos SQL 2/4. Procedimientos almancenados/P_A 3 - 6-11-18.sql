use test

create procedure multi(@a int)
as 
begin
	declare @b int
	declare @n int 
	declare @r int
	set @b=@a
	
	while @n<11
		begin
			set @n=@n+1
			set @r = @r*@n
			print concat(@b,' x ', ' = ',@r)
		end

end

exec multi 3

print 'ya'
