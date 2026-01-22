# Global Layoffs Analysis using SQL

## Problem Statement
Analyze global layoffs data to identify trends across companies, industries, countries, and time periods using SQL.

## Dataset
- Global layoffs dataset containing company, industry, country, date, and layoff details

## Approach
### Data Cleaning
- Created staging tables
- Removed duplicate records using ROW_NUMBER()
- Standardized company, industry, and country fields
- Converted date formats
- Handled missing and null values

### Data Analysis
- Analyzed total layoffs by company and country
- Identified yearly and monthly layoff trends
- Calculated rolling totals using window functions
- Identified top companies by layoffs per year using DENSE_RANK()

## SQL Concepts Used
- CTEs
- Window Functions (ROW_NUMBER, DENSE_RANK, SUM OVER)
- Aggregations
- Date functions

## Tools
- SQL (MySQL / PostgreSQL compatible)

## Key Insights
- Identified industries and companies with highest layoffs
- Observed major layoff spikes across specific years
- Analyzed cumulative layoff trends over time

## Future Improvements
- Visualize results using BI tools
- Automate data refresh
- Integrate with Python for advanced analysis
