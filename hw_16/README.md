Web engineering 2025 (evening): Домашнее задание 16
Найдите средний возраст из коллекции ich.US_Adult_Income

Поменяв подключение к базе данных, создать коллекцию orders_NAME (для уникальности - добавим ваше имя в название) со свойствами id, customer, product, amount, city, используя следующие данные:

1 Olga Apple 15.55 Berlin

2 Anna Apple 10.05 Madrid

3 Olga Kiwi 9.6 Berlin

4 Anton Apple 20 Roma

5 Olga Banana 8 Madrid

6 Petr Orange 18.3 Paris

Пример:


Пример:

![](https://lms.itcareerhub.de/pluginfile.php/11967/mod_assign/intro/image.png)

Найти сколько всего было совершено покупок

Найти сколько всего раз были куплены яблоки

Вывести идентификаторы трех самые дорогих покупок

Найти сколько всего покупок было совершено в Берлине

Найти количество покупок яблок в городах Берлин и Мадрид

Найти сколько было потрачено каждым покупателем

(подсказка: используем $group и total: {$sum: '$amount'} )

Найти в каких городах совершала покупки Ольга

(подсказка: используем $match customer: 'Olga' и $group _id: '$city')
