
select "account_name", sum("new_total") "total", "day"
from
(
select "account_name", "occurred_at", "new_total", "weekday",
case
	when "weekday" = 0 then 'Sunday'
	when "weekday" = 1 then 'Monday'
	when "weekday" = 2 then 'Tuesday'
	when "weekday" = 3 then 'Wednesday'
	when "weekday" = 4 then 'Thursday'
	when "weekday" = 5 then 'Friday'
	else 'Saturday' end as "day"
	
FROM
(
select "account_name", "occurred_at", "new_total", extract(dow from "occurred_at") as "weekday"
from
(
select a.name "account_name", o.occurred_at "occurred_at", o.total_amt_usd "new_total"
from "accounts1" a
join "orders" o 
on a.id = o.account_id)as table_one)as table_two)as table_three

where "day" = 'Saturday'

group by "account_name", "day"
order by "total" desc