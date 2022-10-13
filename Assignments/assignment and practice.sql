select count("channel") "direct_sales"
from "web_events"
where channel = 'direct' and  occurred_at between ('2015-01-01') and ('2016-12-31')

select "account_name", sum("total") as "total"
from
(select a.name "account_name", o.occurred_at "occurred", o.total "total"
from accounts1 a
join orders o
on a.id = o.account_id
where occurred_at between ('2015-01-01') and ('2016-12-31')) as "table_one"
group by "account_name"
order by "total" desc

select "account_name", sum("new_total"), occurred_at "date"
case 
 when date between ('2015-01-01') and ('2016-12-31')
 extract(to_char(date '2020-12-27', 'Day') AS "Day_Name")
  
  where Day_Name in ('Saturday') 
else Day_Name = 'unspecified'
end case
FROM
(
select a.name "account_name", o.occurred_at "occurred_at", o.total_amt_usd "new_total"
from accounts1 a
join orders o 
on a.id = o.account_id
where occurred_at between ('2015-01-01') and ('2016-12-31'))as "table_one"

 
group by "account_name", "occurred_at","new_total"
order by "Day_Name" asc
