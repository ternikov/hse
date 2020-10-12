# 6: Test Preparation

Solve the tasks 1-4 with regular expressions \(library `re`\). For details: previous [Seminar HomeTasks](../seminar-5/5-hometasks.md).

### Task 1

You need to test the text string \(auto number, in particular\) for validity.

**Input**: string, consisting only of capital Latin letter and digits \(at least 1 symbol in input is guaranteed\). You need to check if this string matches the pattern of auto number. The valid auto number in this case is written as follows: letter, then 3 digits, then 2 letters, then two or three digits. Note: combinations of digits \(after the first letter, and in the end of the string\) should not be 00 and 000. For example, `A001AA178` is also valid.

**Output**: if the input string matches the pattern provided above - print `1`, otherwise - print `0`.

```python
# Check the following lines
# Write your function as auto_number(x)

assert auto_number('A022MR178') == 1
assert auto_number('A02MR178') == 0
assert auto_number('AO01MR178') == 0
assert auto_number('A002CC78') == 1
assert auto_number('A000WQ12') == 0
assert auto_number('E999TT00') == 0
assert auto_number('WAS2107TT03') == 0
assert auto_number('1') == 0
assert auto_number('W111W11') == 0
assert auto_number('F050LB05') == 1
```

### Task 2

You need to test the text string \(e-mail, in particular\) for validity.

**Input**: string, consisting only of digits, lowercase Latin letters, dot\(s\) and/or @ \[at\] symbol\(s\) \(at least 1 symbol in input is guaranteed\). You need to check if this string matches the pattern of e-mail. The valid e-mail in this case is: sequence of digits or/and Latin letters \(at least 3 symbols\), then @ \[at\] symbol, then sequence of digits or/and Latin letters \(at least 2 symbols\), then dot, then sequence of Latin letters \(2 or 3 symbols\).

**Output**: if the input string matches the pattern provided above - print `1`, otherwise - print `0`.

```python
# Check the following lines
# Write your function as check_mail(x)

assert check_mail('ivanov@hse.ru') == 1
assert check_mail('pet@gmail.com') == 1
assert check_mail('100@00.io') == 1
assert check_mail('ff@mail.ru') == 0
assert check_mail('f.f@mail.ru') == 0
assert check_mail('petr@bk..io') == 0
assert check_mail('rus@bg.ru@') == 0
assert check_mail('rums@@j1.com') == 0
assert check_mail('r09@0j.ru') == 1
assert check_mail('pavel@educ.hsec.ruc') == 0
assert check_mail('valley0000@0j1.ua') == 1
assert check_mail('world@dropbox.r6') == 0
```

### Task 3

You need to test the text string \(phone number, in particular\) for validity.

**Input**: string, consisting only of digits and spaces \(at least 1 symbol in input is guaranteed\). You need to check if this string matches the pattern of phone number. The valid phone number in this case is sequence of 11 digits. Note: the first, the second, and the fifth digit should not be zero.

**Output**: if the input string matches the pattern provided above - print phone number in the following format `+7(800)123-45-67`, otherwise - print `0`.

```python
# Check the following lines
# Write your function as check_phone(x)

assert check_phone('7 800 123456 7 ') == '+7(800)123-45-67'
assert check_phone('1234567 8 9 0   5') == '+1(234)567-89-05'
assert check_phone('1') == 0
assert check_phone('1234 567890') == 0
assert check_phone('0 222 450 09 09') == 0
assert check_phone('1 023 4005678 ') == 0
assert check_phone('89110300001') == 0
```

### Task 4

You need to test the text string \(password, in particular\) for validity.

**Input**: string, consisting of any symbols \(at least 1 symbol in input is guaranteed\). You need to check if this string matches the pattern of password. The valid password in this case should be at least 5 symbols length, it should include at least one small Latin letter \[a-z\], at least one capital Latin letter \[A-Z\], at least one digit, at least one special symbol \(plus \[+\] or asterisk \[\*\]\).

**Output**: if the input string matches the pattern provided above - print `1`, otherwise - print `0`.

```python
# Check the following lines
# Write your function as check_pass(x)

assert check_pass('Ab123+') == 1
assert check_pass('hR0*') == 0
assert check_pass('hR0* ') == 1
assert check_pass('mmm016') == 0
assert check_pass('*mMm88') == 1
assert check_pass(' +e0P') == 1
assert check_pass('F1+R)') == 0
assert check_pass('F1+R(gb') == 1
assert check_pass(' r 1 T * ') == 1
assert check_pass('1**ML') == 1
```

### Task 5

Working with `*.csv` files. Import historical quotes data \(the last downloadable file\) from [https://finance.yahoo.com/quote/CSV/history/](https://finance.yahoo.com/quote/CSV/history/). Calculate average Close prices for each month of 2020 \(from January till October\).

You can load and open `*.csv` differently but pay attention that the type of imported object can vary, too \(list, dictionary, plain text, etc\).

{% tabs %}
{% tab title="As list" %}
```python
# Import from local file as list
import csv
with open('your_file.csv') as f:
    reader = csv.reader(f)
    data = list(reader)
```
{% endtab %}

{% tab title="As dict" %}
```python
# Import from local file as dictionary
import csv
with open('CSV.csv', mode = 'r') as infile:
    reader = csv.DictReader(infile)
    data = {}
    for row in reader:
        for column, value in row.items():
            data.setdefault(column, []).append(value)
```
{% endtab %}

{% tab title="As dict \(2\)" %}
```python
# As dictionary durectly from web
import pandas as pd
url = 'YOUR_LINK'
data = pd.read_csv(url).to_dict()
```
{% endtab %}
{% endtabs %}

