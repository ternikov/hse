# Lab 1. Thursday 13:00

#### Flights Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataMon4.csv) into pandas DataFrame and display the first 5 rows.
2. Drop the last column and display all columns' names.
3. Calculate the frequency table \[number of airports for each carrier\] by `carrier`-column \(company-carrier of the flight\). Sort it in decreasing way by its values.
4. Calculate the number of arrival flights cancelled \(use `arr_cancelled`\) for each `carrier`. Sort the obtained result in decreasing way \(by values\).
5. Using previous calculations from ex.3-4, create the scatter-plot \(x-axis - number of airports for each carrier; y-axis - number of arrival flights cancelled for each carrier\).
6. The dataset contains 5 columns with several flight `delay` types \(measured in minutes\), that are aggregated in `arr_delay`-column. Calculate the shares of each `delay` type \(for the whole dataset\) and create the pie chart.
7. Calculate the number of airports that are carried with more than 2 `carrier`s.
8. Find out the most frequent word, that is used in `airport_name`s. _Hint_: remove commas and colons; then, split by space.
9. Calculate the mean `weather_delay` \(in hours\) and the share of `weather_delay` in `arr_delay` for each `carrier_name`. Make one table, sort by `carrier_name` from A to Z.
10. Check the hypothesis \(use `t`-test\): there is no difference in mean `weather_delay` between overloaded \[that carried not less than 100 airports\] carriers and underloaded \[that carried less than 100 airports\] carriers. _Hint_: use `.fillna(0)` for missing values.

