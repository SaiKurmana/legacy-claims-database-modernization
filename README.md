# Legacy Claims Database Modernization

Modernization of a legacy healthcare claims environment into a reproducible, analytics-ready data pipeline using **R**, **PostgreSQL**, **SQL validation**, and **Quarto reporting**.

This project demonstrates how fragmented healthcare data workflows can be transformed into a structured, reproducible analytics pipeline suitable for modernization and future cloud deployment.

---

# Overview

This project simulates modernization of a legacy healthcare claims database into a structured data engineering workflow.

The pipeline:

- Ingests raw claims-related CSV files
- Loads and stages the data in PostgreSQL
- Performs validation checks and transformations
- Builds monthly reporting metrics
- Renders an HTML analytics report using Quarto

The repository is designed as a portfolio project demonstrating practical skills in:

- healthcare data modernization
- ETL pipeline design in R
- SQL-based validation and reporting logic
- PostgreSQL schema design
- analytical reporting with Quarto
- reproducible data workflows
- multi-environment project structure for future cloud deployment

---

# Business Problem

Legacy healthcare claims systems frequently rely on:

- fragmented flat-file data sources
- inconsistent validation logic
- manual reporting workflows
- poorly documented transformations

This project demonstrates how such an environment can be modernized into a repeatable analytics pipeline with:

- standardized ingestion
- explicit validation checks
- structured metric generation
- automated report rendering
- reproducible execution

---

# Project Workflow

The pipeline follows this sequence:

1. Extract and stage raw claims data from CSV source files  
2. Load and validate data in PostgreSQL  
3. Build monthly claims metrics for reporting  
4. Render an HTML report with Quarto  
5. Write run logs for traceability  

---

# Architecture Overview

```text
┌─────────────────────┐
│   Legacy Source     │
│   CSV Claim Files   │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  R Extraction Layer │
│  (Staging Scripts)  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│   PostgreSQL Data   │
│   Staging Schema    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Data Validation &   │
│ SQL Quality Checks  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Metrics Layer       │
│ Monthly Aggregates  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Quarto Reporting    │
│ HTML Analytics      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Output + Run Logs   │
└─────────────────────┘
```

---

# Tech Stack

## Language
- R

## Database
- PostgreSQL

## SQL
- schema creation
- validation checks
- reporting views

## Reporting
- Quarto  
- ggplot2  
- knitr  

## Testing
- testthat  

## Version Control
- Git  
- GitHub  

## Cloud Structure
- AWS scaffolding  
- Azure scaffolding  
- Terraform infrastructure templates  
- Bicep infrastructure templates  

---

# Repository Structure

```text
legacy-claims-database-modernization/
├─ README.md
├─ .gitignore
├─ config/
├─ data-raw/
├─ data/
├─ sql/
│  ├─ aws/
│  ├─ azure/
│  └─ shared/
├─ R/
│  ├─ 00_packages.R
│  ├─ 01_extract_stage.R
│  ├─ 02_transform_validate.R
│  ├─ 03_build_metrics.R
│  ├─ 04_render_report.R
│  ├─ 05_write_run_log.R
│  └─ utils.R
├─ reports/
│  ├─ claims_report.qmd
│  └─ templates/
├─ tests/
├─ docs/
├─ infra/
├─ logs/
└─ output/
```

---

# Data Sources

Synthetic source files simulate a legacy claims environment:

- `members.csv`
- `providers.csv`
- `claims.csv`
- `claim_lines.csv`
- `claim_diagnoses.csv`

These represent typical healthcare operational datasets used for:

- billing workflows  
- utilization analysis  
- provider reporting  
- payer reconciliation  
- operational analytics  

---

# Core Data Model

The project simulates a simplified healthcare claims schema.

| Table | Description |
|------|-------------|
| members | Member demographic information |
| providers | Provider directory and specialty |
| claims | Claim header submission data |
| claim_lines | Service-level claim line items |
| claim_diagnoses | Diagnosis codes tied to claims |

Relationships:

```text
members → claims → claim_lines
                 → claim_diagnoses

providers → claims
```

---

# Key Features

- staged ingestion of raw healthcare claims data  
- PostgreSQL schema creation and loading  
- SQL-based validation rules  
- reporting views for downstream analysis  
- monthly claims summary metrics  
- automated HTML reporting with Quarto  
- modular R scripts for reproducible execution  
- unit tests for pipeline utilities and validation logic  

---

# Example Output

The pipeline produces:

- monthly claims summary extracts  
- validation run logs  
- rendered HTML analytics report  

The report includes:

- monthly summary tables  
- paid ratio trends  
- product line comparisons  

---

# How to Run

## 1 Clone the repository

```bash
git clone https://github.com/SaiKurmana/legacy-claims-database-modernization.git
cd legacy-claims-database-modernization
```

## 2 Install required R packages

Run in R:

```r
source("R/00_packages.R")
```

## 3 Configure database connection

Update values in:

```
config/config.yml
```

Example environment files:

```
config/aws.env.example
config/azure.env.example
```

## 4 Run the pipeline

Execute scripts in order:

```r
source("R/01_extract_stage.R")
source("R/02_transform_validate.R")
source("R/03_build_metrics.R")
source("R/04_render_report.R")
source("R/05_write_run_log.R")
```

## 5 Review outputs

Generated files appear in:

```
output/extracts/
output/logs/
reports/
```

---

# Testing

Run unit tests:

```r
testthat::test_dir("tests/testthat")
```

---

# Architecture Notes

This repository is structured for **future cloud deployment patterns**.

Included scaffolding:

- AWS SQL deployment scripts  
- Azure SQL deployment scripts  
- Terraform infrastructure templates  
- Bicep infrastructure templates  
- GitHub Actions placeholders for CI/CD  

The current version focuses on a **local reproducible analytics pipeline** suitable for demonstration and future cloud deployment.

---

# Why This Project Matters

This project demonstrates how legacy healthcare data workflows can be transformed into a maintainable analytics pipeline.

It highlights practical data engineering skills across:

- healthcare operations analytics  
- data quality validation  
- reporting automation  
- reproducible analytics pipelines  

---

# Decision Intelligence Context

Although the current implementation focuses on reporting automation, the architectural pattern supports broader decision intelligence workflows, including:

- healthcare utilization monitoring  
- provider performance analysis  
- payer contract evaluation  
- operational reporting automation  
- population health analytics  

The structured pipeline demonstrates how legacy healthcare data environments can evolve into **decision-ready data platforms**.

---

# Future Enhancements

- containerize the pipeline with Docker  
- automated CI testing with GitHub Actions  
- deploy PostgreSQL + pipeline runtime in AWS  
- scheduled report generation  
- automated publishing of rendered HTML reports  
- additional metrics such as denial rates and utilization trends  

---

# Author

**Sai Kurmana**

GitHub  
https://github.com/SaiKurmana
