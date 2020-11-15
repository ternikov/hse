# 9: In-Class

## In-class tasks \(use `pandas`\)

Perform your calculations for each stage in separate cell.

### Task 1. Football Data Analysis

1. Import data from [here](https://raw.githubusercontent.com/jokecamp/FootballData/master/UEFA_European_Championship/Euro%202012/Euro%202012%20stats%20TEAM.csv) \(in `pandas` DataFrame called `football` \[use `read_csv`\]\).
2. How many team participated in the Euro2012?
3. How many columns this data have?
4. Select only the `Goal` column. What is the mean number of Goals scored?
5. Show only the columns `Team`, `Yellow Cards` and `Red Cards` and assign them to a DataFrame called `discipline`.
6. Use `discipline`. Sort the teams by `Red Cards`, then by `Yellow Cards` \(both in descending order\).
7. Calculate the mean `Yellow Cards` given per `Team`.
8. Use `football`. Filter teams that scored more than 6 goals.
9. Select `Teams` that start with `G` letter.
10. Select the first 7 columns.
11. Select all columns except the last 3.
12. Show only the `Team` and `Shooting Accuracy` for England, Italy and Russia.

### Task 2. Occupations Data Analysis

1. Import data from [here](https://raw.githubusercontent.com/justmarkham/DAT7/master/data/u.user) \(use `read_csv` or `read_table` with options `delimiter` \[choose an appropriate one\] and `header = None`\).
2. Remove the first column.
3. Rename the rest columns as `age`, `gender`, `occupation` and `zip_code`.
4. Show the first 25 entries \(`head`\).
5. Show the last 10 entries \(`tail`\).
6. Print the name of all the columns.
7. What is the data type of each column?
8. How many different occupations there are in this dataset?
9. What is the most frequent occupations \(`value_counts`\)?
10. Summarize the DataFrame by columns \(use `describe` and option `include = 'all'`\).
11. What is the mean age of users?
12. Test hypothesis: is there any difference in mean age between men and women? Use T-test: `from scipy.stats import ttest_ind`.
13. Discover what is the mean age per occupation \(use `groupby`\).
14. Discover the Male ratio \(proportion of men to women\) per occupation and sort it in descending order.
15. For each occupation, calculate the minimum and maximum ages \(use `groupby` and `agg`\).
16. For each combination of occupation and gender, calculate the mean age \(use `groupby` again\).
17. Calculate the shares of men and women for each occupation.
18. \*Create `pivot_table`: rows - occupation, columns - gender; values - mean, min and max age.





