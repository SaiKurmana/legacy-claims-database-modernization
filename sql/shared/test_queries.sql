-- duplicate claim IDs
SELECT claim_id, COUNT(*) AS cnt
FROM claims
GROUP BY claim_id
HAVING COUNT(*) > 1;

-- orphan claim lines
SELECT cl.claim_line_id
FROM claim_lines cl
LEFT JOIN claims c
  ON cl.claim_id = c.claim_id
WHERE c.claim_id IS NULL;

-- null critical fields
SELECT claim_id
FROM claims
WHERE member_id IS NULL
   OR provider_id IS NULL
   OR service_from_date IS NULL
   OR claim_status IS NULL;
