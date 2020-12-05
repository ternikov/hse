# Lab 1. Saturday 13:00

#### Households Data

{% file src="../../.gitbook/assets/data01.csv" caption="data01.csv" %}

1. Upload the `data01.csv` into pandas DataFrame, and display the first 20 rows.
2. Remove all rows, which contain `NaN` in at least one of the columns. Provide the number of observations afterwards.
3. Hereinafter use your modified \(in exercise 2\) data frame. Calculate mean `age` and mean `earnings` by combinations of `sex` and `edcat` \(`edcat`: the level of education \[categorical variable\]\).
4. Calculate average earnings per hours for two groups of men: with age below 40, and with age 40 and older. _Hint_: remove `NaN` and `inf` values from your calculations.
5. Calculate the proportions of people by `edcat`-variable among the whole dataset, and create the pie chart.
6. Create the scatter-plot \(x-axis - `education`; y-axis - natural logarithm of `earnings` \[remove 0 earnings from your analysis\]\).
7. Add the `agegroup` column to your dataset as follows: `1` - indicates age 40 and below, `2` - indicates `(40, 45]` age interval, `3` - indicates age older than 45. Display frequency table for `agegroup` column.
8. Create pivot table: index - `agegroup`, columns - `edcat`, values - number of observations.
9. Check the hypothesis \(use `t`-test\): there is no difference in average `earnings` between men from the first \(`1`\) `agegroup` and men from the other age groups. Comment the result.
10. Find out the most frequent levels of education \(use `edcat`\) for each `agegroup`.

