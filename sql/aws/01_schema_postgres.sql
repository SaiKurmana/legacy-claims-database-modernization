CREATE TABLE IF NOT EXISTS members (
    member_id VARCHAR(50) PRIMARY KEY,
    dob DATE,
    sex VARCHAR(10),
    product_line VARCHAR(50),
    coverage_start DATE,
    coverage_end DATE
);

CREATE TABLE IF NOT EXISTS providers (
    provider_id VARCHAR(50) PRIMARY KEY,
    npi VARCHAR(20),
    provider_name VARCHAR(255),
    specialty VARCHAR(100),
    network_status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS claims (
    claim_id VARCHAR(50) PRIMARY KEY,
    member_id VARCHAR(50) REFERENCES members(member_id),
    provider_id VARCHAR(50) REFERENCES providers(provider_id),
    claim_received_date DATE,
    service_from_date DATE,
    service_to_date DATE,
    claim_status VARCHAR(20),
    total_billed_amount NUMERIC(12,2),
    total_paid_amount NUMERIC(12,2),
    adjudication_date DATE
);

CREATE TABLE IF NOT EXISTS claim_lines (
    claim_line_id VARCHAR(50) PRIMARY KEY,
    claim_id VARCHAR(50) REFERENCES claims(claim_id),
    line_number INT,
    procedure_code VARCHAR(20),
    revenue_code VARCHAR(20),
    units INT,
    line_billed_amount NUMERIC(12,2),
    line_paid_amount NUMERIC(12,2),
    denial_reason_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS claim_diagnoses (
    claim_diag_id VARCHAR(50) PRIMARY KEY,
    claim_id VARCHAR(50) REFERENCES claims(claim_id),
    diag_sequence INT,
    icd10_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS report_runs (
    run_id BIGSERIAL PRIMARY KEY,
    run_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    environment_name VARCHAR(20),
    report_name VARCHAR(100),
    git_commit_hash VARCHAR(100),
    input_batch_id VARCHAR(100),
    run_status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS validation_results (
    validation_id BIGSERIAL PRIMARY KEY,
    run_id BIGINT REFERENCES report_runs(run_id),
    test_name VARCHAR(255),
    severity VARCHAR(20),
    expected_value VARCHAR(255),
    actual_value VARCHAR(255),
    pass_flag BOOLEAN,
    details TEXT
);
