# Lab 1. Tuesday 13:00

#### Cars Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataMon2.csv) into pandas DataFrame, drop the first column and display the first 15 rows.
2. Calculate the number of unique `Brand`s.
3. Extract rows with maximum \(along the whole dataset\) `KMs Driven` values.
4. Extract the average `Price` \(in millions\) for cars 2000 and newer \(use `Year`-column\) by each `Brand`.
5. Using previous data from exercise 4, create the bar chart \(sort columns in increasing order\).
6. For `New` cars \(use `Condition` column\) calculate the average `KMs Driven` and average `Price` for each `Brand`; and create scatter plot \(X-axis: average price; Y-axis: average kms driven\).  _Hint_: use one table with Brand name column and two columns for average price and average kms driven.
7. Calculate the shares of `New` and `Used` models by `Brand`s.
8. Create pivot table: index - `Brand`, columns - `Fuel`, values - number of observations \(fill `NaN` with zeros; provide `int` type of data inside the table\).
9. Calculate the mean age \(calculate it for 2020 year\) for each Toyota `Model`. Example for some models:

   ```text
   Camry 14.0
   Prado 20.2
   Supra 51.0
   ```

10. Check the hypothesis \(use `t`-test\): there is no difference in mean `Price` between old \[older than 2010\] Toyota Corolla models \(all generations\) and new \[2010 and newer\] Toyota Corolla models \(all generations\).

