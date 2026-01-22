# Dataset Information

This project uses a publicly available **Global Layoffs Dataset** containing information about company layoffs across industries, countries, and time periods.

## 📌 Dataset Source
- Source: Kaggle – Global Layoffs Dataset
- Original dataset compiled from public news reports and company disclosures.

> ⚠️ The raw dataset is **not included in this repository** to respect data licensing and GitHub best practices.

## 🧾 Dataset Description
The dataset includes the following fields:
- `company` – Name of the company
- `location` – City or region of the company
- `industry` – Industry category
- `total_laid_off` – Number of employees laid off
- `percentage_laid_off` – Percentage of workforce laid off
- `date` – Date of layoff announcement
- `stage` – Company funding stage
- `country` – Country of the company
- `funds_raised_millions` – Funds raised (in millions)

## 🛠 Data Preparation
Before analysis, the dataset was cleaned and processed using SQL:
- Removed duplicate records
- Standardized text fields (company, industry, country)
- Converted date column to proper DATE format
- Handled NULL values
- Removed records with insufficient layoff information

All data cleaning steps are documented in:
