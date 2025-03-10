# Background
Data quality is crucial for accurate analysis and decision-making. In e-commerce, inconsistent, duplicate, or incorrect data can lead to misleading insights. This project focuses on cleaning and standardizing an e-commerce dataset to improve data accuracy and usability. Key tasks include handling missing values, renaming columns, converting data types, replacing inconsistent values, removing duplicates, and filtering out invalid entries. The cleaned data ensures reliability for analysis and decision-making.

#Exploratory Data Cleaning
1. Initial Inspection
  ![Dirty Data](https://github.com/user-attachments/assets/6ab12459-8757-474a-9618-e4e366a766ea)
  There are some missing values, inconsistent formats, and unnecessary text in columns.

2. Identifying Missing Values and Duplicates
   ![Null data](https://github.com/user-attachments/assets/e0883f8e-db21-46d9-9f5e-46530ee55af6)
   ![Duplicated Data](https://github.com/user-attachments/assets/cd012374-6ed0-4771-83bb-8114f53556fe)
   there are lots of empty or NULL data and duplicate data.

3. Data Cleaning (Add new colomn)
   ![image](https://github.com/user-attachments/assets/bc28e0fc-92b4-44b5-9194-8e24f8d32766)
   Added a new column with a new data type because MS SQL could not identify the previous column which had special characters.
   
4. Handle empty colomn and special character
   ![image](https://github.com/user-attachments/assets/27a185bc-aabf-439a-b940-ca4f161e4791)
   Handled empty data Replacing NULL or empty fields with appropriate default values (e.g., "Not Ranked" for missing rankings) and remove special characters like "%", "$"

6. Move the values
   ![Screenshot 2025-03-10 100022](https://github.com/user-attachments/assets/bb76f34d-7c54-4d50-8d51-b65ef748c263)
   Fill the empty goods_title_link_jump with the value from goods_title_link (the colomn name is change)

8. Move the Values
   ![Screenshot 2025-03-10 100454](https://github.com/user-attachments/assets/9e5efecf-22a2-4a03-a299-ff0dbe2d861c)
   Move the price and discount column data of type NVARCHAR to a new column with integer data type.

10. Deleting Duplicated data
    ![image](https://github.com/user-attachments/assets/5914a487-dfef-4800-b597-3052c708698e)
    After deleting duplicated data

12. Deleting Unreasonable price
    ![image](https://github.com/user-attachments/assets/75521807-76ec-4d0f-9543-0234326e845a)
    Remove 7 unreasonable prices on data

13. Output
   ![image](https://github.com/user-attachments/assets/47bd2061-ba82-4e89-b2c0-7634d2b17f98)
   The data has been cleaned by filling in empty values ​​(NULL), removing special characters except in the sold recently column because the + sign indicates (more), removing duplicate data and moving the data to a column with the correct data type.

# Tools & Technologies Used
MS SQL Server for querying and processing data.
