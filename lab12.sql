/* Задача 1: Создать функцию для вывода названия страны с заданной столицей */
CREATE FUNCTION Функция1 (@Столица AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN DECLARE @S1 AS VARCHAR(50) SELECT @S1 = Название FROM Страны WHERE Столица = @Столица RETURN @S1 END
/* Задача 2: Создать функцию для перевода населения в млн. чел. */
CREATE FUNCTION Функция2 (@Население AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P2 AS FLOAT SET @P2 = ROUND(@Население / 1000000, 2) RETURN @P2 END
/* Задача 3: Создать функцию для вычисления плотности населения заданной части света */
CREATE FUNCTION Функция3 (@Конт AS VARCHAR(50)) RETURNS FLOAT AS BEGIN DECLARE @P3 AS FLOAT SELECT @P3 = ROUND(SUM(CAST(Население AS FLOAT)) / SUM(Площадь), 2) FROM Страны WHERE Континент = @Конт RETURN @P3 END
/* Задача 4: Создать функцию для поиска страны, третьей по населению */
CREATE FUNCTION Функция4() RETURNS VARCHAR(50) AS BEGIN DECLARE @P4 AS VARCHAR(50), @M1 AS FLOAT, @M2 AS FLOAT, @M3 AS FLOAT SELECT @M1 = MAX(Население) FROM Страны SELECT @M2 = MAX(Население) FROM Страны WHERE Население < @M1 SELECT @M3 = MAX(Население) FROM Страны WHERE Население < @M2 SELECT @P4 = Название FROM Страны WHERE Население = @M3 RETURN @P4 END
/* Задача 5: Создать функцию для поиска страны с максимальным населением в заданной части света, с Азией по умолчанию */
CREATE FUNCTION Функция5 (@Конт AS VARCHAR(50) = 'Азия') RETURNS VARCHAR(50) AS BEGIN DECLARE @P5 AS VARCHAR(50), @M5 AS FLOAT SELECT @M5 = MAX(Население) FROM Страны WHERE Континент = @Конт SELECT @P5 = Название FROM Страны WHERE Континент = @Конт AND Население = @M5 RETURN @P5 END
/* Задача 6: Создать функцию для замены букв в слове от третьей до предпоследней на “тест” */
CREATE FUNCTION Функция6 (@A6 AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN RETURN LEFT(@A6, 2) + 'тест' + RIGHT(@A6, 1) END
/* Задача 7: Создать функцию, которая возвращает количество стран, не содержащих заданную букву */
CREATE FUNCTION Функция7 (@C7 AS CHAR(1)) RETURNS INT AS BEGIN DECLARE @K7 AS INT SELECT @K7 = COUNT(*) FROM Страны WHERE CHARINDEX(@C7, Название) = 0 RETURN @K7 END
/* Задача 8: Создать функцию для возврата списка стран с площадью меньше заданного числа */
CREATE FUNCTION Функция8 (@N8 AS FLOAT) RETURNS TABLE AS RETURN (SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Площадь < @N8)
/* Задача 9: Создать функцию для возврата списка стран с населением в интервале заданных значений */
CREATE FUNCTION Функция9 (@A9 AS FLOAT, @B9 AS FLOAT) RETURNS TABLE AS RETURN (SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Население BETWEEN @A9 AND @B9)
/* Задача 10: Создать функцию для возврата таблицы с названием континента и суммарным населением */
CREATE FUNCTION Функция10() RETURNS @Конт_Насел TABLE (Континент VARCHAR(50), Суммарное_Население FLOAT) AS BEGIN INSERT @Конт_Насел SELECT Континент, SUM(Население) FROM Страны GROUP BY Континент RETURN END
/* Задача 11: Создать функцию, возвращающую 1, если число является палиндромом, и 0 в противном случае */
CREATE FUNCTION Функция11 (@P AS INT) RETURNS INT AS BEGIN DECLARE @R INT, @N INT = @P, @Rev INT = 0 WHILE @N > 0 BEGIN SET @R = @N % 10 SET @Rev = @Rev * 10 + @R SET @N = @N / 10 END RETURN CASE WHEN @Rev = @P THEN 1 ELSE 0 END END
/* Задача 12: Создать функцию, определяющую номер координатной четверти для точки (x, y) */
CREATE FUNCTION Функция12 (@x AS FLOAT, @y AS FLOAT) RETURNS INT AS BEGIN RETURN CASE WHEN @x > 0 AND @y > 0 THEN 1 WHEN @x < 0 AND @y > 0 THEN 2 WHEN @x < 0 AND @y < 0 THEN 3 WHEN @x > 0 AND @y < 0 THEN 4 ELSE 0 END END
/* Задача 13: Создать функцию, возвращающую 1, если число простое, и 0 в противном случае */
CREATE FUNCTION Функция13 (@N AS INT) RETURNS INT AS BEGIN DECLARE @i INT = 2, @IsPrime INT = 1 IF @N <= 1 SET @IsPrime = 0 WHILE @i <= SQRT(@N) BEGIN IF @N % @i = 0 SET @IsPrime = 0 SET @i = @i + 1 END RETURN @IsPrime END