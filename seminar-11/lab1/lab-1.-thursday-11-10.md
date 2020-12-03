# Lab 1. Thursday 11:10

#### Orders Dataset

1. Upload the data from [here](https://raw.githubusercontent.com/ternikov/hse/gh-pages/folder/dataMon3.csv) into pandas DataFrame and display the first 10 rows.
2. Calculate the number of orders.
3. Calculate the frequency table for unique `item_name`s.
4. Using previous data from exercise 3, extract only such items, that start with `Chicken`; create the pie chart for these extracted "Chicken" items.
5. Display the most expensive order\(s\) \[all columns\]. _Hint_: transform the last column to numbers and calculate the sum of `item_price` \(`item_price` here includes the multiplication on the quantity\) for each `order_id`.
6. Display five the cheapest items \(according to their price\). _Hint_: at first, divide the `item_price` by `quantity` in order to obtain the price per unit for each item.
7. Calculate all unique modifications \(use both `item_name` and `choice_description`\) of `Burrito`. 
8. Calculate the number of orders, where each `Burrito` \(use only `item_name`\) was ordered. Sort values in decreasing way. Example for some `Burrito`:

   ```text
   Barbacoa Burrito     88
   Carnitas Burrito     58
   ```

9. Using previous data from exercise 8, create the bar chart.
10. Calculate the number of orders, where you can find out the item \(use only `item_name`\), that \(by its `item_price`\) costs more than 50% from the order's total cost \(sum of `item_price` for particular order\).

