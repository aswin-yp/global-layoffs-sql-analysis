
-- GLOBAL LAYOFFS : DATA CLEANING

-- 1️. Create staging table
CREATE TABLE layoffs_staging LIKE layoffs;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

-- 2️⃣ Remove duplicates using ROW_NUMBER
CREATE TABLE layoffs_staging2 AS
SELECT *,
       ROW_NUMBER() OVER (
         PARTITION BY company,
                      location,
                      industry,
                      total_laid_off,
                      percentage_laid_off,
                      `date`,
                      stage,
                      country,
                      funds_raised_millions
       ) AS row_num
FROM layoffs_staging;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

-- 3️⃣ Standardize text fields
UPDATE layoffs_staging2
SET company = TRIM(company);

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- 4️⃣ Convert date column to DATE type
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- 5️⃣ Handle NULL values in industry
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
  ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;

-- 6️⃣ Remove records with no layoff data
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
