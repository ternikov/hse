# Lab 1. Tuesday 14:40

#### Brewery Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataMon1.csv) into pandas DataFrame and display the first 10 rows.
2. Calculate number of observations.
3. Extract unique categories from columns `state` and `state_breweries` in order to return the table.

   Example for some states:

   ```text
   california    284
   nevada    18
   wyoming    8
   ```

4. Using previous data \(use top-6 by frequency\), create bar chart \(sort columns in decreasing way\). Display the sum of `state_breweries` by each `state` \(in absolute values\).
5. Extract unique categories by `type` column.
6. Create pivot table: index - `state`, columns - two the most frequent `type` from previous task, values - number of observations \(fill `NaN` with zeros\).
7. Using previous data, calculate the shares of `Microbrewery` among total amount of `Brewpub`s and `Microbrewery`s by each state. Provide TOP-3 states and its shares.
8. Calculate the share of Closed breweries.
9. Create pie chart, displaying shares of Closed and non-Closed breweries.
10. Calculate the number of unique city names in California \(use `address` column\). 

