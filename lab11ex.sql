/* Пример 1: Даны числа a и b. Найти и вывести их сумму */
DECLARE @a1 INT, @b1 INT, @c1 INT SET @a1 = 5 SET @b1 = 10 SET @c1 = @a1 + @b1 PRINT @c1
/* Пример 2: В таблице «Ученики» найти разницу между наибольшими баллами среди лицеистов и гимназистов */
DECLARE @licey2 FLOAT, @gimn2 FLOAT, @diff2 FLOAT SET @licey2 = (SELECT MAX(Баллы) FROM Ученики WHERE Школа = 'Лицей') SET @gimn2 = (SELECT MAX(Баллы) FROM Ученики WHERE Школа = 'Гимназия') SET @diff2 = ABS(@licey2 - @gimn2) PRINT @diff2
/* Пример 3: В таблице «Ученики» найти разницу между наибольшими и наименьшими баллами */
DECLARE @maxp3 FLOAT, @minp3 FLOAT, @diff3 FLOAT SELECT @maxp3 = MAX(Баллы), @minp3 = MIN(Баллы) FROM Ученики SET @diff3 = @maxp3 - @minp3 PRINT @diff3
/* Пример 4: Дано случайное целое число меньше 1000. Вывести его квадрат */
DECLARE @a4 INT = RAND() * 1000, @b4 INT SET @b4 = SQUARE(@a4) PRINT @b4
/* Пример 5: Даны случайные целые числа a и b. Найти наибольшее из них */
DECLARE @a5 INT = RAND() * 100, @b5 INT = RAND() * 100 IF @a5 > @b5 PRINT '@a5 = ' + CAST(@a5 AS VARCHAR(3)) ELSE PRINT '@b5 = ' + CAST(@b5 AS VARCHAR(3))
/* Пример 6: Дано случайное целое число a. Проверить, делится ли данное число на 3 */
DECLARE @a6 INT = RAND() * 100 IF @a6 % 3 = 0 PRINT CAST(@a6 AS VARCHAR(3)) + ' делится на 3' ELSE PRINT CAST(@a6 AS VARCHAR(3)) + ' не делится на 3'
/* Пример 7: Дано случайное целое число N (N < 1000). Если оно является степенью числа 5, то вывести «Да», если не является – вывести «Нет» */
DECLARE @a7 INT = RAND() * 1000 WHILE @a7 % 5 = 0 SET @a7 = @a7 / 5 IF @a7 = 1 PRINT 'Да' ELSE PRINT 'Нет'
/* Пример 8: Даны случайные целые числа a и b. Найти наибольший общий делитель (НОД) */
DECLARE @a8 INT = RAND() * 1000, @b8 INT = RAND() * 1000 PRINT '@a8 = ' + CAST(@a8 AS VARCHAR(4)) PRINT '@b8 = ' + CAST(@b8 AS VARCHAR(4)) WHILE @a8 != @b8 BEGIN IF @a8 > @b8 SET @a8 = @a8 - @b8 ELSE SET @b8 = @b8 - @a8 END PRINT 'НОД = ' + CAST(@a8 AS VARCHAR(4))
/* Пример 9: Даны два целых числа A и B (A < B). Найти сумму всех целых чисел от A до B включительно */
DECLARE @a9 INT = 5, @b9 INT = 10, @s9 INT = 0 WHILE @a9 <= @b9 BEGIN SET @s9 = @s9 + @a9 SET @a9 = @a9 + 1 END PRINT 'Сумма = ' + CAST(@s9 AS VARCHAR(5))
/* Пример 10: Дано случайное целое число N (N < 100). Найти квадрат данного числа, используя формулу N^2 = 1 + 3 + 5 + ... + (2*N-1) */
DECLARE @N10 INT = RAND() * 10, @M10 INT = 1, @S10 INT = 0 WHILE @M10 <= 2 * @N10 - 1 BEGIN SET @S10 = @S10 + @M10 PRINT @S10 SET @M10 = @M10 + 2 END
/* Пример 11: Даны случайные целые числа A и B (A < B). Вывести все целые числа от A до B включительно; при этом число A должно выводиться 1 раз, число A + 1 должно выводиться 2 раза и т.д. */
DECLARE @A11 INT = RAND() * 5, @C11 INT = 1 DECLARE @B11 INT = @A11 + RAND() * 5 PRINT '@A11 = ' + CAST(@A11 AS CHAR(1)) + ', @B11 = ' + CAST(@B11 AS CHAR(1)) WHILE @A11 <= @B11 BEGIN PRINT REPLICATE(@A11, @C11) SET @A11 = @A11 + 1 SET @C11 = @C11 + 1 END
/* Пример 12: Напечатать те из двузначных чисел, которые делятся на 4, но не делятся на 6 */
DECLARE @A12 INT = 10 WHILE @A12 < 100 BEGIN IF (@A12 % 4 = 0) AND (@A12 % 6 != 0) PRINT @A12 SET @A12 = @A12 + 1 END
/* Пример 13: Даны два целых числа D (день) и M (месяц), определяющие правильную дату невисокосного года. Вывести значения D и M для даты, следующей за указанной */
DECLARE @D13 INT = 31, @M13 INT = 12 SET @D13 = CASE WHEN @M13 IN (1, 3, 5, 7, 8, 10, 12) AND @D13 = 31 THEN 1 WHEN @M13 IN (4, 6, 9, 11) AND @D13 = 30 THEN 1 WHEN @M13 = 2 AND @D13 = 28 THEN 1 ELSE @D13 + 1 END SET @M13 = CASE WHEN @D13 = 1 AND @M13 = 12 THEN 1 WHEN @D13 = 1 AND @M13 < 12 THEN @M13 + 1 ELSE @M13 END PRINT CAST(@D13 AS VARCHAR(2)) + '/' + CAST(@M13 AS VARCHAR(2))
/* Пример 14: Вывести слово «Нижневартовск» на экран столько раз, сколько в нем букв */
DECLARE @L14 INT, @N14 CHAR(13) = 'Нижневартовск' SET @L14 = LEN(@N14) WHILE @L14 > 0 BEGIN PRINT @N14 SET @L14 = @L14 - 1 END
/* Пример 15: Вывести на экран с помощью цикла слово «Нижневартовск» в виде треугольника */
DECLARE @L15 INT, @M15 INT, @N15 CHAR(13) SET @N15 = 'Нижневартовск' SET @L15 = LEN(@N15) SET @M15 = @L15 WHILE @L15 > 0 BEGIN PRINT LEFT(@N15, @L15) + SPACE(2 * (@M15 - @L15)) + RIGHT(REVERSE(@N15), @L15) SET @L15 = @L15 - 1 END SET @L15 = 2 WHILE @L15 <= @M15 BEGIN PRINT LEFT(@N15, @L15) + SPACE(2 * (@M15 - @L15)) + RIGHT(REVERSE(@N15), @L15) SET @L15 = @L15 + 1 END