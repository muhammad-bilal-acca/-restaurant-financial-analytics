# Restaurant Sector Financial Analytics

A comparative financial statement analysis of four U.S. publicly traded restaurant companies — Darden Restaurants, Cracker Barrel, The Cheesecake Factory, and Denny's — built entirely on primary-sourced SEC filings, using SQL, Excel, and Power BI.

## What This Project Demonstrates

This project combines two skill sets that rarely overlap: financial statement literacy (ACCA-level accounting training) and modern data analytics tooling (SQL, Power BI, DAX). Most data analytics projects can visualize numbers; this one interprets them — flagging where a ratio is misleading without accounting context, and explaining why, rather than presenting raw figures at face value.

## Data Sources

All financial data was extracted directly from each company's Form 10-K, filed with the U.S. Securities and Exchange Commission, via SEC EDGAR (sec.gov/edgar). No third-party or pre-aggregated datasets were used.

- Darden Restaurants, Inc. (NYSE: DRI)
- Cracker Barrel Old Country Store, Inc. (NASDAQ: CBRL)
- The Cheesecake Factory Incorporated (NASDAQ: CAKE)
- Denny's Corporation (NASDAQ: DENN)

## Tech Stack

- **SQL (MySQL)** — data structuring, ratio calculation via SQL views
- **Excel / Power Query** — data standardization and transformation
- **Power BI / DAX** — interactive dashboard, calculated measures (peer benchmarking, YoY growth, dynamic ranking)
- **GitHub** — version control and authorship record

## Repository Structure

```
/raw-data         Original extracted financial statements, per company (untouched)
/standardized     Standardized 21-line-item financial statement table + methodology notes
/import into sql  CSV exports (fact table + lookup tables) generated via Power Query, used to load data into MySQL
/sql              Database schema, ratio calculation queries (SQL views)
/powerbi          Power BI dashboard file (.pbix)
/narrative        Full written financial analysis and interpretation
```

## Key Findings

- **Denny's Return on Equity appears severely negative (-63.4% in the most recent year) — but this does not reflect losses.** Denny's is genuinely profitable, with the second-highest net margin of the four companies analyzed. The negative ROE is a capital structure effect caused by negative shareholders' equity from cumulative share buybacks, not declining performance. Full explanation in the narrative.
- **Darden's FY2025 revenue and liabilities increase is driven by its ~$605M acquisition of Chuy's Holdings** (closed November 2024), contributing a partial year (~6 months) of results — not organic like-for-like growth.
- **The four companies' fiscal years do not align** (May, August, and December year-ends across the group), meaning "most recent year" comparisons require careful interpretation rather than a naive side-by-side read.
- **Darden shows the strongest profitability but the weakest liquidity position of the group** — a reminder that no single ratio captures overall financial health.

Full analysis, methodology, and reasoning: see [`/narrative/narrative.md`](./narrative/narrative.md)

## Explore the Project

- **Interactive dashboard:** `/powerbi/Restaurant_Financial_Dashboard.pbix` (open in Power BI Desktop)
- **Full written analysis:** `/narrative/narrative.md`
- **SQL ratio logic:** `/sql/ratio_analysis.sql`

## About

Built by Muhammad Bilal — ACCA student (10 papers passed) with a background in accounting and financial reporting, currently building data analytics skills in Excel, Power BI, and SQL. This project reflects an intersection of both: applying financial statement literacy to structured data analysis.

Connect on [LinkedIn](https://www.linkedin.com/in/muhammad-bilal-69601529b)
