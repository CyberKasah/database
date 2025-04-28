/* Задача 1: Даны числа A и B. Найти и вывести их произведение */
DECLARE @A1 INT, @B1 INT, @C1 INT SET @A1 = 5 SET @B1 = 10 SET @C1 = @A1 * @B1 PRINT @C1
/* Задача 2: В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов */
DECLARE @licey2 FLOAT, @gimn2 FLOAT, @diff2 FLOAT SET @licey2 = (SELECT AVG(Баллы) FROM Ученики WHERE Школа = 'Лицей') SET @gimn2 = (SELECT AVG(Баллы) FROM Ученики WHERE Школа = 'Гимназия') SET @diff2 = ABS(@licey2 - @gimn2) PRINT @diff2
/* Задача 3: В таблице «Ученики» проверить на четность количество строк */
DECLARE @count3 INT SELECT @count3 = COUNT(*) FROM Ученики IF @count3 % 2 = 0 PRINT 'Количество строк четное' ELSE PRINT 'Количество строк нечетное'
/* Задача 4: Дано четырехзначное число. Вывести сумму его цифр */
DECLARE @num4 INT = 1234, @sum4 INT SET @sum4 = (@num4 / 1000) + ((@num4 / 100) % 10) + ((@num4 / 10) % 10) + (@num4 % 10) PRINT @sum4
/* Задача 5: Даны случайные целые числа a, b и c. Найти наименьшее из них */
DECLARE @a5 INT = CAST(RAND() * 100 AS INT), @b5 INT = CAST(RAND() * 100 AS INT), @c5 INT = CAST(RAND() * 100 AS INT) IF @a5 <= @b5 AND @a5 <= @c5 PRINT '@a5 = ' + CAST(@a5 AS VARCHAR(3)) ELSE IF @b5 <= @a5 AND @b5 <= @c5 PRINT '@b5 = ' + CAST(@b5 AS VARCHAR(3)) ELSE PRINT '@c5 = ' + CAST(@c5 AS VARCHAR(3))
/* Задача 6: Дано случайное целое число a. Проверить, делится ли данное число на 11 */
DECLARE @a6 INT = CAST(RAND() * 100 AS INT) IF @a6 % 11 = 0 PRINT CAST(@a6 AS VARCHAR(3)) + ' делится на 11' ELSE PRINT CAST(@a6 AS VARCHAR(3)) + ' не делится на 11'
/* Задача 7: Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет» */
DECLARE @a7 INT = CAST(RAND() * 1000 AS INT), @temp7 INT SET @temp7 = @a7 WHILE @temp7 % 3 = 0 SET @temp7 = @temp7 / 3 IF @temp7 = 1 PRINT 'Да' ELSE PRINT 'Нет'
/* Задача 8: Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК) */
DECLARE @a8 INT = CAST(RAND() * 1000 AS INT), @b8 INT = CAST(RAND() * 1000 AS INT), @x8 INT, @y8 INT, @orig_a8 INT, @orig_b8 INT SET @x8 = @a8 SET @y8 = @b8 SET @orig_a8 = @a8 SET @orig_b8 = @b8 WHILE @x8 != @y8 BEGIN IF @x8 > @y8 SET @x8 = @x8 - @y8 ELSE SET @y8 = @y8 - @x8 END PRINT '@a8 = ' + CAST(@a8 AS VARCHAR(4)) PRINT '@b8 = ' + CAST(@b8 AS VARCHAR(4)) PRINT 'НОК = ' + CAST((@orig_a8 * @orig_b8) / @x8 AS VARCHAR(10))
/* Задача 9: Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно */
DECLARE @a9 INT = 5, @b9 INT = 10, @s9 INT = 0 WHILE @a9 <= @b9 BEGIN SET @s9 = @s9 + (@a9 * @a9) SET @a9 = @a9 + 1 END PRINT 'Сумма = ' + CAST(@s9 AS VARCHAR(10))
/* Задача 10: Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7 */
DECLARE @n10 INT = 1 WHILE (@n10 % 2 != 1 OR @n10 % 3 != 1 OR @n10 % 4 != 1 OR @n10 % 5 != 1 OR @n10 % 6 != 1 OR @n10 % 7 != 0) SET @n10 = @n10 + 1 PRINT @n10
/* Задача 11: Вывести свою фамилию на экран столько раз, сколько в ней букв */
DECLARE @L11 INT, @N11 VARCHAR(10) = 'Колесник' SET @L11 = LEN(@N11) WHILE @L11 > 0 BEGIN PRINT @N11 SET @L11 = @L11 - 1 END
/* Задача 12: Вывести на экран с помощью цикла слово «Нижневартовск» в указанном формате */
DECLARE @N12 CHAR(13) = 'Нижневартовск', @L12 INT = 1, @M12 INT = LEN('Нижневартовск') WHILE @L12 <= @M12 BEGIN PRINT SUBSTRING(@N12, 1, @L12) + SUBSTRING(@N12, @M12 - @L12 + 1, @L12) SET @L12 = @L12 + 1 END