# 1: In-Class

{% hint style="info" %}
## Hint

The first two tasks - for in-class discussion. 

The rest: if you are fine with the first two.

You can make preliminary calculations in Jupyter Notebook and, then, check your answers in [Stepik Lesson](https://stepik.org/invitation/a02582d5f4293c8c84e8a0561f5a0e537765d19e/).
{% endhint %}

### Task 1

#### Net Present Value of Investment Project

> Suppose you have a fixed amount of Investments. You have also several Investment projects \(Cash Flows, interest rates, duration\). Which Investment project is the best option \(use Net Present Value criteria\)?

{% hint style="info" %}
Create NPV function for assessment of investment project. Assume that all Cash Flows are equal between each other. $$NPV=-Investments+\sum_{i=1}^{n}{\frac{CF_i}{(1+Rate)^i}}$$,

where $$n$$ - number of periods, $$CF$$ - Cash Flow, $$Rate$$ - discount \(interest\) rate.

For example, you have 100,000 to invest and the following Investment projects:

| Project | CF | n | Rate |
| :--- | :--- | :--- | :--- |
| 1 | 10,000 | 20 | 5% |
| 2 | 11,000 | 15 | 4% |
| 3 | 20,000 | 8 | 6% |
| 4 | 50,000 | 3 | 10% |
{% endhint %}

### Task 2

#### Maximize Stock Profit

> You have all of the prices for a given stock for the next year. You can buy once and sell once in that year. How do you determine when to buy and sell to maximize your profit?
>
> **Source**: [Google Interview](https://www.glassdoor.com/Interview/You-have-all-of-the-prices-for-a-given-stock-for-the-next-year-You-can-buy-once-and-sell-once-in-that-year-How-do-you-det-QTN_95351.htm)

{% hint style="info" %}
You will be given a list of stock prices for a given day and your goal is to return the maximum profit \(minimum loss\) that could have been made by buying a stock at the given price and then selling the stock later on.

For example, if the input is: \[45, 24, 35, 31, 40, 38, 11\] then your program should return 16 because if you bought the stock at $24 and sold it at $40, a profit of $16 was made and this is the largest profit that could be made.
{% endhint %}

## Still easy?

### Task 3 \(additional\)

#### Film Day Choice

> Imagine, you help the producer to choose proper shooting days. The producer asks you to choose two days in order to ensure that the temperature in such days will be not more than 5 degree different between each other \(by the absolute value\). You know the weather forecast for $$n$$ few days \(the sequence of integer numbers: $$t_1,t_2,\dots,t_n$$, where $$i$$ - the number of the days in the increasing order, $$t_i$$ - the temperature in the particular day\). For two chosen days should be true the following: $$|t_i-t_j|\leq 5$$. You know also that the producer do not want to have long pauses between these days, so, you need also to minimize the distance between two particular days.
>
> **Input**: you have the list of numbers \(temperature in days, ordered by the number of the day\).
>
> **Output**: write the function `mindays(list)`, that returns the minimum days of leisure \(pause\) in between for the producer; if no such days you can choose - return $$-1$$.
>
> **Source**: Mail.ru Group [MADE](https://made.mail.ru/) Academy Entry Questions

### Task 4 \(additional\)

> A vector X of 100 real numbers has a mean value of 14. A second vector Y of 100 real numbers has a mean value of 40. A third vector Z is constructed by picking 100 numbers from X or Y at random and multiplying each by 2. A forth vector W is constructed by picking the remaining 100 numbers of X and Y and multiplying each by 2. What is the sum of all elements in Z+W.
>
> **Source**: [WorldQuant Interview](https://www.worldquant.com/home/)

### Task 5 \(additional\)

#### Two Sum

Solve this challenge in [LeetCode](https://leetcode.com/problems/two-sum/).

