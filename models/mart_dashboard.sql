SELECT row.* FROM(
    SELECT ARRAY_AGG(d ORDER BY updated_at desc limit 1)[OFFSET(0)] as row
    FROM {{ref("intermediate_dashboard")}} as d
    GROUP BY opportunity_id
)