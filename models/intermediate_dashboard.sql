SELECT 
    updated_at,
    opportunity_id,
    opportunity_name,
    value_amount,
    client,
    current_milestone,



FROM {{ ref('stg_dashboard')}}