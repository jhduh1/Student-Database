-- The following will be a procedure that will allow us to measure the average male and female
-- spending on tuition fees per department within a certain tuition range.The range will be two values 
-- that that user can insert when calling the procedure.

drop procedure if exists filter_tuition;
delimiter $$
create procedure filter_tuition(In p_min_tuition float, IN p_max_tuition float)
begin
select
s.gender,d.dept_name,avg(t.tuition) as avg_tuition
from tuitions t
join students s on s.stud_id = t.stud_id
join dept_stud ds on ds.stud_id = s.stud_id
join departments d on d.dept_no = ds.dept_no
where t.tuition between p_min_tuition and p_max_tuition
group by d.dept_no,s.gender;
end $$
delimiter ;

