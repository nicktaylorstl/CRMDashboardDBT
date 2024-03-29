with final as(
SELECT
  timestamp,
  JSON_EXTRACT_SCALAR(value, '$.event') AS ievent,
  JSON_EXTRACT_SCALAR(payload, '$.id') AS opportunity_id,
  JSON_EXTRACT_SCALAR(payload, '$.owner.id') AS owner_id,
  JSON_EXTRACT_SCALAR(payload, '$.owner.deleted') AS owner_is_deleted,
  JSON_EXTRACT_SCALAR(payload, '$.owner.username') AS owner_username,
  JSON_EXTRACT_SCALAR(payload, '$.owner.pictureURL') AS owner_pictureURL,
  JSON_EXTRACT_SCALAR(payload, '$.owner.name') AS owner_name,
  JSON_EXTRACT_SCALAR(payload, '$.team') AS team,
  JSON_EXTRACT_SCALAR(payload, '$.lastStageChangedAt') AS lastStageChangedAt,
  JSON_EXTRACT_SCALAR(payload, '$.party.id') AS party_id,
  JSON_EXTRACT_SCALAR(payload, '$.party.type') AS party_type,
  JSON_EXTRACT_SCALAR(payload, '$.party.name') AS client,
  JSON_EXTRACT_SCALAR(payload, '$.party.pictureURL') AS party_picture_url,
  JSON_EXTRACT_SCALAR(payload, '$.lostReason') AS lost_reason,
  JSON_EXTRACT_SCALAR(payload, '$.createdAt') AS created_at,
  JSON_EXTRACT_SCALAR(payload, '$.updatedAt') AS updated_at,
  JSON_EXTRACT_SCALAR(payload, '$.name') AS opportunity_name,
  JSON_EXTRACT_SCALAR(payload, '$.value.amount') AS value_amount,
  JSON_EXTRACT_SCALAR(payload, '$.value.currency') AS value_currency,
  JSON_EXTRACT_SCALAR(payload, '$.duration') AS duration,
  JSON_EXTRACT_SCALAR(payload, '$.durationBasis') AS duration_basis,
  JSON_EXTRACT_SCALAR(payload, '$.milestone.id') AS current_milestone_id,
  JSON_EXTRACT_SCALAR(payload, '$.milestone.name') AS current_milestone,
  JSON_EXTRACT_SCALAR(payload, '$.lastOpenMilestone.id') AS last_open_milestone_id,
  JSON_EXTRACT_SCALAR(payload, '$.lastOpenMilestone.name') AS last_open_milestone,
  JSON_EXTRACT_SCALAR(payload, '$.probability') AS probability,
  JSON_EXTRACT_SCALAR(payload, '$.expectedCloseOn') AS expected_close_on,
  JSON_EXTRACT_SCALAR(payload, '$.closedOn') AS actual_close_on,
  JSON_EXTRACT_SCALAR(payload, '$.description') AS description,
  JSON_EXTRACT_SCALAR(payload, '$.lastContactedAt') AS last_contacted_at
FROM
  `crmdashboardmlb.fromupstash.dashboard`,
  UNNEST(JSON_EXTRACT_ARRAY(value, '$.payload')) AS payload)

  select * from final
