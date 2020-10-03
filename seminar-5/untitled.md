# 5: In-Class

{% hint style="info" %}
**Working with textual and numeric data**

Dictionaries in real world \([`*.json` data format](https://en.wikipedia.org/wiki/JSON)\)

**\(!\)** Solve the following problem and submit your results in LMS \(you can make this task in groups\)
{% endhint %}

### Problem

Suppose you have the data sample from HR platform HeadHunter. You need to process it and answer the following questions:

1. Which salary in Rubles is suggested in different cities? Use NET salary, round with 1 decimal place.
2. Which professions are provided in TOP-10 cities \(with the largest mean salary\)?
3. What is the share of vacancies, where salary is not omitted?
4. What is the share of Full-day schedule vacancies?
5. Which key skills are required in managerial vacancies?

#### 

#### Hints for Questions

Use the following link to obtain the data in `*.json`-format: [https://api.hh.ru/vacancies?per\_page=100&locale=EN](https://api.hh.ru/vacancies?per_page=100&locale=EN). This is a dictionary with the last 100 published vacancies in HeadHunter platform. The structure of fields you can also find in official [HeadHunter API](https://github.com/hhru/api/blob/master/docs_eng/vacancies.md).

You can SAVE AS the file in `*.json`-format \(e.g. `your_file.json` and `load` into Python as Dictionary in `data` variable from your local directory \(using `json` library\): 

```python
import json

with open("your_file.json", "r") as read_file:
    data = json.load(read_file)
```

Or, you can directly download the Web-page with data \(using `requests` library\).

{% hint style="info" %}
If you did not install a particular library once on your machine you can install it directly from Jupyter Notebook or form command line \(terminal, prompt\) \[[more details in previous seminars' content](https://nbviewer.jupyter.org/github/ternikov/hse/blob/gh-pages/Seminar02_IM.ipynb)\]:
{% endhint %}

```python
!pip install requests
```

Then, recognize it as dictionary with `json.loads`:

```python
import json
import requests

url = 'https://api.hh.ru/vacancies?per_page=100&locale=EN'

# Load the WebPage
your_file = requests.get(url)

# Store the data (text) into Dictionary
data = json.loads(your_file.text)
```

Then, find out the structure of particular vacancies. The data about vacancies is stored with items key \(according to [HeadHunter API](https://github.com/hhru/api/blob/master/docs_eng/vacancies.md#response-1)\):

```python
vacancies = data['items']
```

So, `vacancies` is the list of sub-Dictionaries. Check, that you've obtained 100 vacancies with `len`.

Some companies do not disclose the salary that they can suggest. Thus, instead of `salary` field it could be `None`. You need skip all `salary` fields with `None` content by introducing, e.g. the following check:

```python
[i['salary'] for i in vacancies if i['salary'] is not None]
```

Then, extract only pairs \(the city \[`area.name`\], and sub-dictionary with salaries\) into new list, it is suggested to use the Tuple structure, e.g.:

```python
[(i['area']['name'], i['salary']) for i in vacancies if i['salary'] is not None]
```

Now, you've obtained the list of pairs \(_city_, _dictionary with salary information_\). Then, you need to filter and use only vacancies with salary in `RUR` currency \(`currency` field of the `salary` Dictionary\). Use the previous logic.

After that, you can notify that not all companies provide the salary inside the range `from` and `to` fields. So, if the `salary` interval is open-ended, please duplicate the known `salary`. The other moment is that the salary could be stated as GROSS or NET \(`gross` field can be `True` or `False`\). Thus, please calculate the NET salary in each case \(assuming 13% deduction if the salary is GROSS \[`gross` field equals to `True`\]\). However, again we can face the problem with None content along with the condition check, so, it is recommended to introduce your own function which will calculate an appropriate values. For example, you can calculate the mean NET salary for particular vacancy with the following one \(the list with `from` and `to` fields from `salary` is used as input\):

{% tabs %}
{% tab title="Mean Salary" %}
```python
def mymean(x):
    x = [i for i in x if i is not None]
    return sum(x) / len(x)
```
{% endtab %}

{% tab title="Mean Salary with GROSS check" %}
```python
def mymean(x, gross = False):
    x = [i for i in x if i is not None]
    if gross:
        return round((sum(x) / len(x)) * 0.87, 1)
    else:
        return round((sum(x) / len(x)), 1)
```
{% endtab %}
{% endtabs %}

Calculate the mean NET salary for each vacancy and provide the list of Tuples in the following format: \(_city_, _mean NET salary_\).

After that, calculate mean, min, max NET salary for each city \(use hints from Seminar 2 & 3 to calculate values for unique categories\) and sort them in decreasing order by mean NET salary. It is suggested to organize data as list of Tuples of the following format: \(_unique city_, _mean salary_, _min salary_, _max salary_\).

Return to the initial vacancies' structure and extract for each unique city the set of professions' names \(`name` field in `vacancies`\). ****

**Optional hint:** as the most of vacancies are presented with Cyrillic letters, you can use transliteration of them with the following library \(`cyrtranslit`\) and example code \(again, you can install this library with `pip install`\):

```python
# Transliteration of Cyrillic text (optional)
import cyrtranslit

cyrtranslit.to_latin('Привет мир!', 'ru')
```

If you are needed to extract particular skills that are required in particular vacancies, you can use the field `snippet` inside `vacancies`, and then, sub-filed `requirements`. Then, extract vacancies \(using `name` filed\) with at least one of words: `['менеджер', 'manager', 'menedzher']`. **Hint**: use `lower()` or `upper()` in order to extract such words in appropriate way.

Then, try to separate words with spaces in obtained list of vacancies \(e.g. `join` at first all texts in one line, **avoid** `None`\). And calculate the frequency table \([more details in previous Seminar](https://nbviewer.jupyter.org/github/ternikov/hse/blob/gh-pages/Seminar03_Problem_sol.ipynb)\).

{% hint style="danger" %}
#### Important Hint

Try to separate not the words itself but phrases, e.g. the text sequences separated by dot, comma, semi-colon, etc.

In addition, remove the rest of punctuation and excessive spacing.

In order to implement this you can use **regular expressions** \(the matching, splitting, replacing within introduced patterns\)**.** 

**Obligatory:** please read the following links about regular expressions

1. \*\*\*\*[**Regular Expression HOWTO**](https://docs.python.org/3/howto/regex.html)\*\*\*\*
2. \*\*\*\*[**Official documentation about `re` library in Python**](https://docs.python.org/3/library/re.html)\*\*\*\*
{% endhint %}

In this case, we first install \(if not installed\) `re` library, e.g. directly from Jupyter Notebook:

```python
!pip install re
```

Then, we can implement several functions from this library in order to match several textual patterns. Please find out several examples below:

{% tabs %}
{% tab title="Split by several symbols" %}
```python
import re

# Splitting by several punctuation symbols
# NOTE: some symbols are already reserved for text manipulations (metacharacters)
# If we need to use such symbols directly, we need ESCAPE them (use backslash before)
# For example, [.]-dot symbol is used for matching any character except a newline

# First, provide the split pattern (we separate several variant with [|]-pipe symbol (the analog of OR))
# And write down this pattern as string variable
# Here we use the following symbols for split: . , ; ! ( )
pattern = ',|\.|;|!|\(|\)'

# Then, we introduce the sample text and apply split function from re library
text = "Regular expressions can be concatenated to form new regular expressions; if A and B are both regular expressions, then AB is also a regular expression. In general, if a string p matches A and another string q matches B, the string pq will match AB. This holds unless A or B contain low precedence operations; boundary conditions between A and B; or have numbered group references."
re.split(pattern, text)

# The result will be the list

```
{% endtab %}

{% tab title="Remove excessive spacing" %}
```python
# You can remove excessive spacing in Python with strip() method (close to Excel's TRIM function)
text = ' Text   with multiple spacing.  '
text.strip()

# But the excessive spacing in between is not gone
# You can use replacement of multiple spcing with sub (substitude) funcion from re library
import re
re.sub(' ', '', text)  # change all spaces with nothing
re.sub('\s', '', text) # change all spaces with nothing (the same)

# We can use the declaration of the number of spaces (e.g. 2 and more)
re.sub('\s{2,}', ' ', text) # change all spaces (2 and more) with one space

# But the first space is not gone
# So, you can combine strip and re.sub
re.sub('\s{2,}', ' ', text.strip())

```
{% endtab %}
{% endtabs %}

