# Lab 1. Thursday 14:40

#### Orders Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataMon3.csv) into pandas DataFrame and display the first 15 rows.
2. Calculate the number of missing values \(`NaN`\) in column `choice_description`.
3. Remove all rows, which contain `NaN` in column `choice_description`, and provide the number of unique `order_id`s afterwards.
4. Use an initial dataset. Find out `order_id`s in range from 1 to 100 including, and calculate the frequency table for unique `item_name`s for such orders.
5. Using previous data from exercise 4, create the bar chart for TOP-5 frequent items.
6. Use an initial data. Calculate the mean price of the order \(for the whole dataset\). _Hint_: summarize first `item_price`-column \[this price is already multiplied by the quantity of particular item\] for each order.
7. Extract rows, that contain `Veggie` in `item_name`-column. Using these data, provide the pivot table \(index - `quantity`, columns - `item_name`, values - number of observations\). Fill `NaN` with zeros; provide `int` type of data inside the table.
8. Using previous data from exercise 7, aggregate the information for each `item_name` \(calculate the sumproduct in order to obtain the total quantity for each `item_name`\). Sort values in decreasing way. Example for some `Veggie`:

   ```text
   Veggie Burrito         97
   Veggie Crispy Tacos     1
   ```

9. Create the pie chart, based on the data from exercise 8. 
10. Calculate the number of unique ingredients \[sauces\] \(use column `choice_description` and only each first element inside each observation, e.g. "Tomatillo Red Chili Salsa \(Hot\)", "Fresh Tomato Salsa"\) among all "Veggie" items.

