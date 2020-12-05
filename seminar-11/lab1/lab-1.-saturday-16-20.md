# Lab 1. Saturday 16:20

#### Store Data

{% file src="../../.gitbook/assets/data03.csv" caption="data03.csv" %}

1. Upload the `data03.csv` into pandas DataFrame, and display the first 10 rows.
2. Calculate average `Net Sales` and average `Age` by `Type of Customer`.
3. Create a histogram for natural logarithm of `Net Sales`.
4. Create the scatter-plot \(x-axis - `Age`; y-axis - natural logarithm of `Net Sales`\).
5. Create pivot table \(index - `Method of Payment`; columns - 1st level: `Gender`, 2nd level: `Marital Status`; values - mean `Net Sales`\). Fill `NaN` with zeros.
6. Add the column with calculated `unit price of item`s. Calculate the mean `unit price of item` for those customers, who has ordered more than 2 items.
7. Display all order\(s\) \[all columns\] with items, which unit price is among TOP-15 highest prices by `unit price of item`. Provide the number of observations in obtained dataset.
8. Find out the most popular \(frequent\) method\(s\) of payment for each combination of `Gender` and `Marital Status`.
9. Check the hypothesis \(use `t`-test\): there is no difference in average `Net Sales` between married men and married women. Comment the result.
10. Add the `agegroup` column to your dataset as follows: `1` - indicates age 30 and below, `2` - indicates `(30, 40]` age interval, `3` - indicates `(40, 50]` age interval, `4` - the rest. Display average `Net Sales` by `agegroup` column.

