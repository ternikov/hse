# Lab 1. Saturday 14:40

#### Phone Market Dataset

{% file src="../../.gitbook/assets/data02.csv" caption="data02.csv" %}

1. Upload the `data02.csv` into pandas DataFrame, and display the last 15 rows.
2. Remove all rows, which contain `NaN` in at least one of the columns. Provide the number of observations afterwards.
3. Using data obtained in exercise 2, extract all rows, that contains **only one** `$`-symbol in the column `prices`. Display the obtained number of observations.
4. Hereinafter use your modified \(in exercise 3\) data frame. Create the frequency table by `brand` column \(sort values in decreasing order\).
5. Using data from exercise 4, create the bar chart.
6. Calculate average `prices` by `brand`. _Hint_: remove `$` and commas.
7. Calculate the number and average prices of `iPhone` and `iPad` \(filter by "Apple" `brand` at first\).
8. Using data from exercise 7 \(about the number of observations\), provide the pie chart.
9. Calculate summary statistics \(mean, min and max\) for `rating` column, grouping by `brand`.
10. Add the `pricegroup` column to your dataset as follows: `1` - indicates prices 100 and below, `2` - indicates `(100, 200]` prices interval, `3` - indicates `(200, 300]` prices interval, `4` - indicates the rest. Display frequency table for `pricegroup` column.

