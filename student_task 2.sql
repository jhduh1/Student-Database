-- Comparing the average tuition fees paid by female vs male students in the entire company until year 2002,
-- and also adding a filter allowing us to see that per each department

select s.gender, d.dept_name,round(avg(t.tuition),2) as tuition,
year(t.from_date) as calendar_year
from
tuitions t
join students s on t.stud_id = s.stud_id
join dept_stud ds on ds.stud_id = s.stud_id
join departments d on d.dept_no = ds.dept_no
group by d.dept_no, s.gender,calendar_year
having calendar_year<= 2002
order by d.dept_no;

 