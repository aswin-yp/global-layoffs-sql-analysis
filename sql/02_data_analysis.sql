-- ======================================
-- GLOBAL LAYOFFS : EXPLORATORY ANALYSIS
-- ======================================

-- 1️⃣ Maximum layoffs observed
SELECT
    MAX(total_laid_off) AS max_total_laid_off,
    MAX(percentage_laid_off) AS max_percentage_laid_off
FROM layoffs_staging2;

-- 2️⃣ Top companies by total layoffs
SELECT
    company,
    SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY total_layoffs DESC;

-- 3️⃣ Country-wise layoffs
SELECT
    country,
    SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY total_layoffs DESC;

-- 4️⃣ Yearly layoff trend
SELECT
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY year
ORDER BY year;

-- 5️⃣ Rolling monthly layoffs trend
WITH monthly_layoffs AS (
    SELECT
        DATE_FORMAT(`date`, '%Y-%m') AS month,
        SUM(total_laid_off) AS layoffs
    FROM layoffs_staging2
    GROUP BY month
)
SELECT
    month,
    layoffs,
    SUM(layoffs) OVER (ORDER BY month) AS rolling_total
FROM monthly_layoffs;

-- 6️⃣ Top 5 companies by layoffs each year
WITH company_year AS (
    SELECT
        company,
        YEAR(`date`) AS year,
        SUM(total_laid_off) AS layoffs
    FROM layoffs_staging2
    GROUP BY company, year
)
SELECT
    company,
    year,
    layoffs
FROM (
    SELECT *,
           DENSE_RANK() OVER (
             PARTITION BY year
             ORDER BY layoffs DESC
           ) AS ranking
    FROM company_year
) ranked_companies
WHERE ranking <= 5;
