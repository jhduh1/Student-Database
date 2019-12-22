-- Comparing the number of male students to the number of female students from different departments for each year,
-- starting from 1990 and stating in which year they are active

select dh.stud_id, ss.gender, d.dept_name, dh.from_date,dh.to_date,s.calendar_year,
case
when year(dh.to_date) >= s.calendar_year and year(dh.from_date) <= s.calendar_year then 1 else 0
end as active
from
(select year(enrolment_date) as calendar_year
from students
group by calendar_year) s
cross join
dept_head dh
join departments d on dh.dept_no = d.dept_no
join students ss on dh.stud_id = ss.stud_id
order by dh.stud_id, calendar_year;

