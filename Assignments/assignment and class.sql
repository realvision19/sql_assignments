---Nnabugwu Daniel Ikenna

---Question One
select "account_name", sum("total") as "total"
from
(select a.name "account_name", o.occurred_at "occurred", o.total "total"
from accounts1 a
join orders o
on a.id = o.account_id
where occurred_at between ('2015-01-01') and ('2016-12-31')) as "table_one"
group by "account_name"
order by "total" desc

---Second Question
select count("channel") "direct_sales"
from "web_events"
where channel = 'direct' and  occurred_at between ('2015-01-01') and ('2016-12-31')


---Question 3
select channel, sum("total") as "total"
from
(select w.channel "channel", o.occurred_at "occurred_at", o.total_amt_usd as "total"
from web_events w
join orders o
on w.account_id = o.account_id
where o.occurred_at between ('2015-01-01') and ('2016-12-31')) as "table_one"
group by channel
order by total desc;

