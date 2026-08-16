select 
	case
		when discount = 0  then 'O (No Discount)'
		when discount <= 0.15 then '1-15% (Moderate Discount)'
		else '>15% (Heavy Discount)'
	end as Discount_Tier,
	count (Order_ID) as Total_Orders,
	round(sum(Profit),2) as Total_Profit,
	round(avg(Net_Profitabilty),2) as Avg_Margin
from palmbridge_raw_data
group by 1
order by Avg_Margin desc;


