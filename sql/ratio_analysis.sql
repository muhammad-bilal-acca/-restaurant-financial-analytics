SET SQL_SAFE_UPDATES = 0;

UPDATE fact_financials
SET LineItem = 'Total Liabilities'
WHERE LineItem = 'Total libilities';

SELECT DISTINCT LineItem FROM fact_financials WHERE LineItem LIKE '%iabilit%';

DROP VIEW IF EXISTS company_year_wide;

CREATE VIEW company_year_wide AS
SELECT
    Company,
    Year,
    MAX(CASE WHEN TRIM(LineItem) = 'Total Revenue' THEN Value END)                  AS total_revenue,
    MAX(CASE WHEN TRIM(LineItem) = 'Operating Income' THEN Value END)               AS operating_income,
    MAX(CASE WHEN TRIM(LineItem) = 'Net Income' THEN Value END)                     AS net_income,
    MAX(CASE WHEN TRIM(LineItem) = 'Total current assets' THEN Value END)           AS total_current_assets,
    MAX(CASE WHEN TRIM(LineItem) = 'Total assets' THEN Value END)                   AS total_assets,
    MAX(CASE WHEN TRIM(LineItem) = 'Total current liabilities' THEN Value END)      AS total_current_liabilities,
    MAX(CASE WHEN TRIM(LineItem) = 'Total Liabilities' THEN Value END)              AS total_liabilities,
    MAX(CASE WHEN TRIM(LineItem) = 'Total stakeholders'' Equity' THEN Value END)    AS total_equity,
    MAX(CASE WHEN TRIM(LineItem) = 'Inventories' THEN Value END)                    AS inventories,
    MAX(CASE WHEN TRIM(LineItem) = 'Net Cash - Operating' THEN Value END)           AS cash_from_operations
FROM fact_financials
GROUP BY Company, Year;

SELECT * FROM company_year_wide ORDER BY Company, Year;

DROP VIEW IF EXISTS ratio_analysis;

CREATE VIEW ratio_analysis AS
SELECT
    Company,
    Year,
    ROUND(total_current_assets / total_current_liabilities, 2)      AS current_ratio,
    ROUND(operating_income / total_revenue * 100, 2)                AS operating_margin_pct,
    ROUND(net_income / total_revenue * 100, 2)                      AS net_margin_pct,
    ROUND(net_income / total_equity * 100, 2)                       AS roe_pct,
    ROUND(net_income / total_assets * 100, 2)                       AS roa_pct,
    ROUND(total_liabilities / total_equity, 2)                      AS debt_to_equity,
    ROUND(total_liabilities / total_assets, 2)                      AS debt_to_assets,
    ROUND(total_revenue / total_assets, 2)                          AS asset_turnover,
    ROUND(cash_from_operations / net_income, 2)                     AS cash_flow_to_net_income
FROM company_year_wide;

SELECT * FROM ratio_analysis ORDER BY Company, Year;
