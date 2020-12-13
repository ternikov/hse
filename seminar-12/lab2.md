---
description: Week 07.12 - 12.12
---

# LAB2

> [Lab's organization process](../course-overview/grading/lab.md)

### Slots for Lab2

You \(and your team\) can choose only one Slot to submit your Lab2.

| 07 December | 08 December | 10 December | 12 December |
| :--- | :--- | :--- | :--- |
| ~~08:00-09:20~~ |  |  | ~~08:00-09:20~~ |
| ~~09:30-10:50~~ | ~~09:30-10:50~~ |  | ~~09:30-10:50~~ |
|  | ~~11:10-12:30~~ | ~~11:10-12:30~~ | ~~11:10-12:30~~ |
|  | ~~13:00-14:20~~ | ~~13:00-14:20~~ | ~~13:00-14:20~~ |
|  | ~~14:40-16:00~~ | ~~14:40-16:00~~ | ~~14:40-16:00~~ |
|  |  |  | ~~16:20-17:40~~ |

{% hint style="info" %}
**Provide your group members' names inside the file. Save all your code and code's outputs in the file \(\*.ipynb or \*.pdf \).**
{% endhint %}

## Bike Sharing in the Bay Area

> **Adapted from:** The Foundations of Data Science course at UC Berkeley

The **Bay Area Bike Share** service published a dataset describing every bicycle rental from September 2014 to August 2015 in their system. There were 354,152 rentals in all. The columns are:

* An ID for the rental
* Duration of the rental, in seconds
* Start date
* Name of the Start Station and code for Start Terminal
* Name of the End Station and code for End Terminal
* A serial number for the bike
* Subscriber type and zip code

{% hint style="success" %}
**Datasets:**

1. Trips' data: [trip.csv data](https://raw.githubusercontent.com/datascienceforall/dsfa-2018sp-public/master/textbook/trip.csv)
2. Bicycle stations data: [station.csv data](https://raw.githubusercontent.com/datascienceforall/dsfa-2018sp-public/master/textbook/station.csv)
{% endhint %}

### Task 1

Install and run all necessary libraries \(use `%matplotlib inline` in Jupyter Notebook also\). 

```python
from datascience import *
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
```

You can use one of `matplotlib` [styles for visualization](https://matplotlib.org/3.1.1/gallery/style_sheets/style_sheets_reference.html).

```python
plt.style.use('fivethirtyeight')
```

Store your data with stations and trips in `pandas DataFrame()` [objects](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html) and `datascience Table()` [objects](http://data8.org/datascience/tables.html) as follows:

```python
# pandas DataFrames
trips = pd.read_csv('trip.csv')
stations = pd.read_csv('station.csv')

# datascience Tables
trips1 = Table.read_table('trip.csv')
stations1 = Table.read_table('station.csv')
```

### Task 2

The table `stations` contains geographical information about each bike station, including latitude, longitude, and a "landmark" which is the name of the city where the station is located.

Visualize the map without tiles, using `matplotlib` functionality.

```python
stations_map = plt.figure()
plt.plot(stations.long, stations.lat, '.');
```

Add the [OpenStreetMap's](https://www.openstreetmap.org/#map=5/51.500/-0.100) tiles with [Leaflet](https://leafletjs.com/) interactive maps. Install and use [`mplleaflet`](https://github.com/jwass/mplleaflet) library for Python.

```python
import mplleaflet
mplleaflet.display(fig=stations_map)
```

{% hint style="info" %}
**Optional**: you can also use [`geopandas`](https://geopandas.org/) objects and figure out your maps as follows.
{% endhint %}

```python
# Install geopandas first
import geopandas as gpd
from geopandas import GeoDataFrame

# Convert your latitude and longitude coordinates to GeoPoints
geometry = gpd.points_from_xy(stations.long, stations.lat)
gdf = GeoDataFrame(stations, geometry=geometry)

# Save and plot the figure without tiles
ax = gdf.plot();

# Plot with Leaflet interactive maps
mplleaflet.display(fig=ax.figure)
```

Plot the same map with `datascience Table()` objects.

```python
Marker.map_table(stations1.select('lat', 'long', 'name'))
```

### Task 3

The map is created using [OpenStreetMap](http://www.openstreetmap.org/#map=5/51.500/-0.100), which is an open online mapping system that you can use just as you would use Google Maps or any other online map. Zoom in to San Francisco to see how the stations are distributed. Click on a marker to see which station it is. You can also represent points on a map by colored circles. Here is such a map of the San Francisco bike stations.

```python
sf = stations1.where('landmark', are.equal_to('San Francisco'))
sf_map_data = sf.select('lat', 'long', 'name')
Circle.map_table(sf_map_data, color='green', area=200)
```

The bike stations are located in five different cities in the Bay Area. To distinguish the points by using a different color for each city, let's start by using group to identify all the cities and assign each one a color.

```python
cities = stations1.group('landmark').relabeled('landmark', 'city')
colors = cities.with_column('color', make_array('blue', 'red', 'green', 'orange', 'purple'))
```

Now join `stations` and `colors` by `landmark`, and then select the columns we need to draw a map. We can draw a map of where the stations are located, using `Marker.map_table`. The function operates on a table, whose columns are \(in order\) latitude, longitude, and an optional identifier for each point.

```python
joined = stations1.join('landmark', colors, 'city')
colored = joined.select('lat', 'long', 'name', 'color')
Marker.map_table(colored)
```

### Task 4

Let's focus only on the _free trips_, which are trips that last less than 1800 seconds \(half an hour\). There is a charge for longer trips.

```python
commute1 = trips1.where('Duration', are.below(1800))
```

Create the histogram showing that most of the trips took around 10 minutes \(600 seconds\) or so. Very few took near 30 minutes \(1800 seconds\), possibly because people try to return the bikes before the cutoff time so as not to have to pay.

```python
commute1.hist('Duration', unit='Second')
```

> **Optional**: a bit the same result you can perform, using pandas objects.

```python
commute = trips.where(trips.Duration < 1800)
commute.hist('Duration');
```

Identify the most highly used "Start Station" \(beginning point of the trip\).

```python
# Table()
starts1 = commute1.group('Start Station').sort('count', descending=True)

# DataFrame()
starts = commute['Start Station'].value_counts()
```

The largest number of trips started at the Caltrain Station on Townsend and 4th in San Francisco. People take the train into the city, and then use a shared bike to get to their next destination.

We can include the geographical data needed to map these stations, by first joining `starts1` with `stations1`.

```python
station_starts = stations1.join('name', starts1, 'Start Station')
```

Now we extract just the data needed for drawing our map, adding a color and an area to each station. The area is 0.01 times the count of the number of rentals starting at each station, where the constant 0.01 was chosen so that the circles would appear at an appropriate scale on the map.

```python
starts_map_data = station_starts.select('lat', 'long', 'name').with_columns(
    'color', 'blue',
    'area', station_starts.column('count') * 0.01
)
starts_map_data.show(3)
Circle.map_table(starts_map_data)
```

### Task 5

For merging different datasets between each other, you need to specify the common criteria \(columns\) inside. Perform and compare the result of the merging between `trips` and `stations` datasets \(using only "Start Station" column\).

```python
trips.merge(stations, left_on='Start Station', right_on='name').head()
stations.merge(trips, right_on='Start Station', left_on='name').head()
```

Give brief comments. 

What is the difference between `merge` and `join` for pandas DataFrames?

```python
trips.join(stations).head()
```

{% hint style="info" %}
**Hint**: navigate to pandas documentation

![](../.gitbook/assets/1200px-pandas_logo.svg.png) ****[**Merge, join, concatenate and compare**](https://pandas.pydata.org/pandas-docs/stable/user_guide/merging.html)\*\*\*\*
{% endhint %}

### Task 6

Perform the merging between two tables \(with trips and stations\) into one table. Use "Start Station" from `table1` for merging. Perform `inner` join and `outer` join. Brief comment about the differences and the output table's size.

```python
table1 = trips
table2 = stations
```

> **Additional hint**: about merging in pandas - [pandas merging 101](https://stackoverflow.com/questions/53645882/pandas-merging-101/53645883#53645883)

### Task 7

Perform the merging between three tables \(with trips, stations and colors\) into one table \(inner-join\). Use "Start Station" from `table1` for merging. What is the `shape` of obtained DataFrame?

```python
table1 = trips
table2 = stations
table3 = colors.to_df()
```

### 

{% hint style="info" %}
**Hints for Tasks 8-9 about SQL and pandas**:

1. [SQL introduction in Python](https://towardsdatascience.com/sql-in-python-for-beginners-b9a4f9293ecf)
2. [SQL and pandas comparison](https://medium.com/jbennetcodes/how-to-rewrite-your-sql-queries-in-pandas-and-more-149d341fc53e)
3. [Pandas and SQL](https://pandas.pydata.org/docs/getting_started/comparison/comparison_with_sql.html)
4. [SQL interface for Jupyter](https://www.datacamp.com/community/tutorials/sql-interface-within-jupyterlab)
5. [LearnSQL: Joins](https://learnsql.com/blog/how-to-join-3-tables-or-more-in-sql/)
{% endhint %}

### Task 8

Perform the SQL query \(string\) for Task 6 \(preserve the same column names and table names\).

### Task 9

Perform the SQL query \(string\) for Task 7 \(preserve the same column names and table names\).

### Task 10

Find out three main advantages and disadvantages of SQL and NoSQL databases. Support your findings with appropriate links.

