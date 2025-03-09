#  E-commerce-Data-Cleaning
This project focuses on cleaning and preprocessing raw e-commerce data to improve data quality and ensure consistency for further analysis. The dataset contains product details, rankings, prices, discounts, and sales information, but includes inconsistencies, missing values, duplicates, and incorrect data types. The goal is to refine the dataset by handling these issues and preparing it for accurate reporting and analysis.

Key Tasks:
1. Handling Missing Values
Replacing NULL or empty fields with appropriate default values.
Ensuring categorical fields have meaningful placeholders (e.g., "Not Ranked" for missing rankings).

2. Data Type Standardization
Converting price and discount columns to proper numeric formats.
Ensuring rank values are stored as integers rather than text.

3. Removing Duplicates
Identifying and eliminating duplicate records based on key attributes such as product name, ranking, and price.

4. Cleaning Text Fields
Removing unwanted characters (e.g., #, extra spaces, or unnecessary symbols).
Standardizing text formats for consistency.

5. Correcting Logical Errors
Ensuring price values are within a valid range (e.g., filtering out unrealistic values below $0.5 or above $5000).
Updating ranking formats to align with the expected structure.

6. Exporting Cleaned Data
Saving the final cleaned dataset as an Excel or CSV file for further use in analytics, reporting, or machine learning.

Tools & Technologies Used
MS SQL Server for querying and processing data.
