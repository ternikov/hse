# Lab 1. Saturday 11:10

#### Countries Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataTue0.csv) into pandas DataFrame, and display the last 10 rows.
2. Calculate number of Countries by Regions.
3. Calculate an average `Happiness Score` for Countries from Asian \(contains `Asia`\) regions.
4. Create a histogram of `Happiness Score` for Countries from Asian \(contains `Asia`\) regions.
5. Provide the list of Countries, that are in the first decile \(observations that are in the first 10% of an ordered range\) by `Freedom`-column \(ordered decreasingly\).
6. Provide for Countries, that are extracted in exercise 4, the scatter-plot \(x-axis - `Happiness Score`; y-axis - `Freedom`\).
7. Calculate the divergence gap among all countries \(countries' inequality metric\) with the following proportion: average GDP \(use `Economy (GDP per Capita)`\) of the first 20% of Countries with the highest GDP \(use `Economy (GDP per Capita)`\) divided by average GDP \(use `Economy (GDP per Capita)`\) of the first 20% of Countries with the lowest GDP \(use `Economy (GDP per Capita)`\).
8. Calculate the shares of Countries with `Freedom` more than 0.25 among all Countries by each `Region`.
9. Extract rows for European \(contains `Europe`\) and Asian \(contains `Asia`\) regions only. Based on obtained data, check the hypothesis \(use `t`-test\): there is no difference in average `Economy (GDP per Capita)` between countries from European regions and countries from Asian regions. Comment the result.
10. Calculate summary statistics \(mean, min and max\) for `Trust (Government Corruption)` column, grouping by 4 continent-groups \(`America`, `Euroasia`, `Africa`, `Australia and New Zealand`\).

