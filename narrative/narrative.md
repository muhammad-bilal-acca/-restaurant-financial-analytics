# Restaurant Sector Financial Analytics: A Comparative Study of Darden Restaurants, Cracker Barrel, Cheesecake Factory, and Denny's

## Executive Summary

This project analyzes the financial performance of four U.S. publicly traded restaurant companies — Darden Restaurants (DRI), Cracker Barrel Old Country Store (CBRL), The Cheesecake Factory (CAKE), and Denny's Corporation (DENN) — using standardized financial statement data extracted directly from each company's SEC Form 10-K filings. The analysis combines SQL-based ratio computation, Power BI visualization, and financial statement interpretation to assess liquidity, profitability, leverage, and efficiency across the peer group.

Beyond the raw numbers, this analysis places particular emphasis on comparability limitations — factors that mean a surface-level ratio comparison across these four companies would be misleading without accounting-informed context.

## Data Sources and Methodology

All financial data was sourced directly from each company's Form 10-K, filed with the U.S. Securities and Exchange Commission and retrieved via SEC EDGAR (sec.gov/edgar). Data covers each company's three most recently available fiscal years at the time of analysis. Data was standardized into a consistent 21-line-item template, loaded into a MySQL database structured as a star schema, and connected to Power BI for visualization, with DAX measures computing peer averages, relative variance, and year-over-year growth.

## Key Limitation #1: Fiscal Year Misalignment

The four companies do not share a common fiscal year-end: Darden Restaurants' fiscal year ends in late May, Cracker Barrel's ends in early August, while Cheesecake Factory and Denny's both end in late December. As a result, "most recent fiscal year" figures represent different calendar windows across the four companies. Where a single-year snapshot was required, FY2024 was selected specifically because it is the one fiscal year all four companies have reported, minimizing this distortion.

## Key Limitation #2: Denny's Revenue Composition

Denny's Corporation operates a predominantly franchised business model: approximately 95% of its restaurants are operated by franchisees rather than the company directly. Denny's revenue therefore combines company restaurant sales (approximately $211.8 million in FY2024) with franchise and license revenue — royalties, fees, occupancy income, and advertising fund revenue (combined approximately $180 million in FY2024). Darden, Cracker Barrel, and Cheesecake Factory are predominantly company-operated, with revenue consisting almost entirely of direct restaurant sales. Franchise and royalty revenue carries substantially higher margins than company-operated restaurant sales, since it excludes direct food and labor costs. Denny's margin ratios should therefore not be read as directly comparable to the other three companies without this context.

## Key Finding: Denny's Negative Shareholders' Equity Distorts ROE

Denny's Return on Equity registered at approximately -31.8% and -63.4% across the two most recent years in this dataset — figures that, in isolation, suggest severe underperformance. However, Denny's net margin over the same period was positive, averaging approximately 8.5% — in fact the second-highest net margin of the four companies analyzed, behind only Darden. This combination — a genuinely profitable company with extreme negative ROE — is only mathematically possible when shareholders' equity itself is negative, which is the case for Denny's, a common outcome for companies whose cumulative share buybacks have exceeded retained earnings over time.

This is a critical accounting distinction: Denny's negative ROE does not reflect declining operational performance or losses — it reflects balance sheet structure. A dashboard without this context would present the number as an alarm signal; correctly read, Denny's is a profitable, franchise-driven business whose capital structure happens to distort one specific ratio. The same distortion mechanism affects Denny's Debt-to-Equity ratio for the identical underlying reason.

## Key Finding: Darden's FY2025 Revenue and Liabilities Increase — Chuy's Holdings Acquisition

Darden's revenue and total liabilities both increased notably between FY2024 and FY2025, directly attributable to Darden's acquisition of Chuy's Holdings, a Tex-Mex restaurant chain, announced July 17, 2024 for approximately $605 million, with the transaction closing in November 2024. Because Darden's fiscal year runs June to May, Chuy's contributed approximately six months of revenue to Darden's FY2025 results — a partial-year effect. A future analysis covering Darden's FY2026 results would show the first full year of Chuy's contribution and would not be directly comparable to FY2025's partial-year figure on a like-for-like basis.

## Minor Note: Darden Cash Flow Reconciliation

Across all three years analyzed, Darden's reported Net Change in Cash consistently differs from the sum of its Operating, Investing, and Financing cash flow components by a small, consistent margin (approximately $7,000-$10,000 thousand per year). Given the consistency of this gap across multiple independent years, this most likely reflects a minor reconciling item disclosed elsewhere in Darden's cash flow statement, rather than a data extraction error.

## Ratio Analysis Summary

**Liquidity.** Cracker Barrel shows the strongest liquidity position of the four companies, maintaining the highest Current Ratio across the period analyzed. Darden shows the weakest liquidity, with the lowest Current Ratio of the group. Notably, low current ratios below 1.0 are common in the restaurant industry generally, since customers pay cash immediately while suppliers are paid on delayed terms — a low ratio here is not automatically a red flag, though Darden's position specifically warrants attention given it sits at the lower end even within this already-lenient industry norm.

**Profitability.** Darden holds the strongest net profit margin of the four companies across the years analyzed. Denny's holds the second-highest net margin — a result that, per the revenue composition discussion above, is influenced by its franchise-royalty revenue mix rather than being a like-for-like measure of company-operated restaurant profitability. Cracker Barrel and Cheesecake Factory trail both companies on this measure.

**Return on Equity and Leverage.** Darden shows the strongest Return on Equity of the group. Denny's shows the weakest, and by a wide margin — but as detailed above, this reflects Denny's negative shareholders' equity from historical share buybacks, not underlying unprofitability. Read alongside Denny's genuinely positive net margin, this is the clearest illustration in this dataset of why a ratio must be interpreted in context rather than taken as a standalone performance signal.

**Earnings Quality (Cash Flow to Net Income).** Cracker Barrel shows the strongest cash-backed earnings quality across the most recent years analyzed, with Cheesecake Factory showing the strongest position in the earliest year in the dataset. This measure is a useful cross-check against the margin and ROE findings above: it indicates whether reported accounting profit is genuinely being converted into cash, independent of capital structure effects.

**Overall.** The most interesting finding in this analysis is the gap between what Denny's Return on Equity appears to show and what is actually happening at the company. Taken alone, Denny's ROE suggests a company in serious distress. Read alongside its net margin (second-best in the group) and its underlying cash generation, a more accurate picture emerges: a profitable, franchise-driven business whose equity has been reduced below zero by cumulative buybacks — a capital structure effect, not an operating one. The inverse pattern appears at Darden: the company with the strongest profitability in the group simultaneously carries the weakest liquidity position, a reminder that no single ratio tells the full story of a company's financial health, and that a complete assessment requires reading profitability, liquidity, leverage, and cash quality together rather than in isolation.

## Conclusion

This project demonstrates that meaningful financial statement comparison requires more than computing standard ratios — it requires understanding the business models, capital structures, and reporting conventions behind the numbers. The four companies analyzed here, while operating in the same broad sector, differ meaningfully in fiscal calendar, revenue model, and balance sheet structure, each of which materially affects how their ratios should be read. This report has aimed to make those distinctions explicit rather than leaving them for a reader to misinterpret.

## Data Sources

- Darden Restaurants, Inc. — Form 10-K, SEC EDGAR
- Cracker Barrel Old Country Store, Inc. — Form 10-K, SEC EDGAR
- The Cheesecake Factory Incorporated — Form 10-K, SEC EDGAR
- Denny's Corporation — Form 10-K, SEC EDGAR

All filings retrieved from sec.gov/edgar.
