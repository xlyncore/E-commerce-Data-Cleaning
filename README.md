# **Background**
Data quality is crucial for accurate analysis and decision-making. In e-commerce, inconsistent, duplicate, or incorrect data can lead to misleading insights. This project focuses on cleaning and standardizing an e-commerce dataset to improve data accuracy and usability. This data can be downloaded at https://www.kaggle.com/datasets/oleksiimartusiuk/e-commerce-data-shein/data

Key tasks include:
- Handling missing values
- Renaming columns
- Converting data types
- Replacing inconsistent values
- Removing duplicates
- Filtering out invalid entries  

The cleaned data ensures reliability for analysis and decision-making.

---

# **Exploratory Data Cleaning**

## **1. Initial Inspection**
![Dirty Data](https://github.com/user-attachments/assets/6ab12459-8757-474a-9618-e4e366a766ea)  
There are missing values, inconsistent formats, and unnecessary text in columns.

---

## **2. Identifying Missing Values and Duplicates**
![Null data](https://github.com/user-attachments/assets/e0883f8e-db21-46d9-9f5e-46530ee55af6)  
![Duplicated Data](https://github.com/user-attachments/assets/cd012374-6ed0-4771-83bb-8114f53556fe)  
There are a lot of empty (NULL) data and duplicate records.

---

## **3. Data Cleaning (Adding a New Column) and Change colomn name**
![image](https://github.com/user-attachments/assets/bc28e0fc-92b4-44b5-9194-8e24f8d32766)  
A new column was added with a different data type because MS SQL could not identify the previous column due to special characters.

---

## **4. Handling Empty Columns & Special Characters**
![image](https://github.com/user-attachments/assets/27a185bc-aabf-439a-b940-ca4f161e4791)  
Empty values were replaced with appropriate defaults (e.g., "Not Ranked" for missing rankings). Special characters like `%`, `$` were removed.

---

## **5. Moving Values to the Correct Column**
![Screenshot 2025-03-10 100022](https://github.com/user-attachments/assets/bb76f34d-7c54-4d50-8d51-b65ef748c263)  
Filled empty `goods_title_link_jump` with values from `goods_title_link` (column name changed).

---

## **6. Converting Data Types for Price & Discount**
![Screenshot 2025-03-10 100454](https://github.com/user-attachments/assets/9e5efecf-22a2-4a03-a299-ff0dbe2d861c)  
Moved `price` and `discount` data from NVARCHAR type to new columns with appropriate integer/decimal data types.

---

## **7. Removing Duplicate Data**
![image](https://github.com/user-attachments/assets/5914a487-dfef-4800-b597-3052c708698e)  
After deleting duplicate records.

---

## **8. Removing Unreasonable Prices**
![image](https://github.com/user-attachments/assets/75521807-76ec-4d0f-9543-0234326e845a)  
Removed **7** unreasonable price entries.

---

## **9. Final Output**
![image](https://github.com/user-attachments/assets/47bd2061-ba82-4e89-b2c0-7634d2b17f98)  
The data has been cleaned by:
- Filling empty values (NULL)
- Removing special characters (except in `sold recently`, where the `+` sign indicates "more")
- Removing duplicate data
- Moving data to columns with the correct data types  

The dataset is now ready for analysis.

---

# **Tools & Technologies Used**
- **MS SQL Server** for querying and processing data.
