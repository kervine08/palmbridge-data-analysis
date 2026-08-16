with CategoryRankings as (
	select Customer_Segment, `Sub-Category`,
	ROUND(sum(Profit),2) as Total_Profit,
	dense_rank() over (
		partition by Customer_Segment
		order by sum(profit) DESC
	) as Profit_Rank
	from palmbridge_raw_data
	group by Customer_Segment, `Sub-Category` 
)
select *
from CategoryRankings
where Profit_Rank <=3;




