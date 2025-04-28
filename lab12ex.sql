/* Пример 1: Создать функцию для вывода столицы данной страны */
CREATE FUNCTION Пример1 (@Страна AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN DECLARE @S1 AS VARCHAR(50) SELECT @S1 = Столица FROM Страны WHERE Название = @Страна RETURN @S1 END
/* Пример 2: Создать функцию для перевода площади в тыс. кв. км. */
CREATE FUNCTION Пример2 (@Площадь AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P2 AS FLOAT SET @P2 = ROUND(@Площадь / 1000, 2) RETURN @P2 END
/* Пример 3: Создать функцию для вычисления плотности населения */
CREATE FUNCTION Пример3 (@Население AS INT, @Площадь AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P3 AS FLOAT SET @P3 = ROUND(CAST(@Население AS FLOAT) / @Площадь, 2) RETURN @P3 END
/* Пример 4: Создать функцию для поиска страны второй по площади */
CREATE FUNCTION Пример4() RETURNS VARCHAR(50) AS BEGIN DECLARE @P4 AS VARCHAR(50), @M1 AS FLOAT, @M2 AS FLOAT SELECT @M1 = MAX(Площадь) FROM Страны SELECT @M2 = MAX(Площадь) FROM Страны WHERE Площадь < @M1 SELECT @P4 = Название FROM Страны WHERE Площадь = @M2 RETURN @P4 END
/* Пример 5: Создать функцию для поиска страны с минимальной площадью в заданной части света, с Европой по умолчанию */
CREATE FUNCTION Пример5 (@Конт AS VARCHAR(50) = 'Европа') RETURNS VARCHAR(50) AS BEGIN DECLARE @P5 AS VARCHAR(50), @M5 AS FLOAT SELECT @M5 = MIN(Площадь) FROM Страны WHERE Континент = @Конт SELECT @P5 = Название FROM Страны WHERE Континент = @Конт AND Площадь = @M5 RETURN @P5 END
/* Пример 6: Создать функцию для замены букв в слове от второй до предпоследней на точку */
CREATE FUNCTION Пример6 (@A6 AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN RETURN LEFT(@A6, 1) + REPLICATE('.', LEN(@A6) - 2) + RIGHT(@A6, 1) END
/* Пример 7: Создать функцию, которая возвращает количество стран, содержащих заданную букву */
CREATE FUNCTION Пример7 (@C7 AS CHAR(1)) RETURNS INT AS BEGIN DECLARE @K7 AS INT SELECT @K7 = COUNT(*) FROM Страны WHERE CHARINDEX(@C7, Название) > 0 RETURN @K7 END
/* Пример 8: Создать функцию для вывода списка стран с населением больше заданного числа */
CREATE FUNCTION Пример8 (@N8 AS INT) RETURNS TABLE AS RETURN (SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Население > @N8)
/* Пример 9: Создать функцию для вывода списка стран с площадью в интервале заданных значений */
CREATE FUNCTION Пример9 (@A9 AS FLOAT, @B9 AS FLOAT) RETURNS TABLE AS RETURN (SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Площадь BETWEEN @A9 AND @B9)
/* Пример 10: Создать функцию для возврата таблицы с названием страны и плотностью населения */
CREATE FUNCTION Пример10() RETURNS @Ст_Плот TABLE (Название VARCHAR(50), Плотность FLOAT) AS BEGIN INSERT @Ст_Плот SELECT Название, CAST(Население AS FLOAT) / Площадь AS Плотность FROM Страны RETURN END
/* Пример 11: Удалить функцию Пример10 */
DROP FUNCTION Пример10