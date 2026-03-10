CREATE OR REPLACE VIEW vw_monthly_claim_summary AS
SELECT
    DATE_TRUNC('month', service_from_date) AS service_month,
    m.product_line,
    COUNT(DISTINCT c.claim_id) AS claim_count,
    SUM(c.total_billed_amount) AS billed_amount,
    SUM(c.total_paid_amount) AS paid_amount
FROM claims c
JOIN members m
  ON c.member_id = m.member_id
GROUP BY 1, 2
ORDER BY 1, 2;
