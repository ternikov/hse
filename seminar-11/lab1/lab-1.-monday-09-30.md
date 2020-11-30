# Lab 1. Monday 09:30

#### Brewery Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataMon1.csv) into pandas DataFrame and display the first 10 rows.
2. Display the list of columns' names.
3. Calculate the number of observations, where `website` is not provided \(`NaN`\).
4. Calculate the number of breweries for each state and create the histogram of breweries's number, using these calculations.
5. Provide the list of states, where `Microbrewery` type is not presented.
6. Create the pie chart, indicating the share of `Brewpub` type across the whole dataset.
7. Create pivot table: index - `type`, columns - `state`, values - number of observations \(fill `NaN` with zeros; provide `int` type of data inside the table\).
8. Calculate the shares of `Brewpub` type pubs \(among all pubs\) by each `state`.
9. Using previous data from exercise 6, create the stacked bar chart \(`Brewpub`-type share and non-`Brewpub`-type share\) for states, where the `Brewpub` share is more than 50% \(order bars in decreasing way\).
10. Calculate summary statistics \(mean, min and max\) for `type` column, grouping by `state`. Example for some types:

    ```text
    Brewpub    25.882353    1    182
    Contract    1.400000    1    3
    ```

