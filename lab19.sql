/* Задание 1: Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы */
DECLARE @DSQL1 VARCHAR(100) DECLARE @TN1 VARCHAR(50) DECLARE @N1 INT SET @TN1 = 'Ученики' SET @N1 = 5 SET @DSQL1 = 'SELECT TOP ' + CAST(@N1 AS VARCHAR) + ' * FROM ' + @TN1 EXECUTE (@DSQL1)
/* Задание 2: Создайте и запустите динамический SQL-запрос, выбирающий все страны из таблицы «Страны», последняя буква названия которых расположена в заданном диапазоне */
DECLARE @L1 CHAR(1) DECLARE @L2 CHAR(1) SET @L1 = 'а' SET @L2 = 'я' EXECUTE ('SELECT * FROM Страны WHERE Название LIKE ''%[' + @L1 + '-' + @L2 + ']''')
/* Задание 3: Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». Создайте курсор, который, построчно читая таблицу #Temp, выбирает каждый раз соответствующий столбец из таблицы «Страны» */
CREATE TABLE #TEMP (COLUMNNAME VARCHAR(50)) INSERT INTO #TEMP VALUES ('Название'), ('Столица'), ('Площадь'), ('Население'), ('Континент') DECLARE TC CURSOR FOR SELECT COLUMNNAME FROM #TEMP OPEN TC DECLARE @CN3 VARCHAR(50) FETCH FROM TC INTO @CN3 WHILE @@FETCH_STATUS = 0 BEGIN EXECUTE ('SELECT ' + @CN3 + ' FROM Страны') FETCH FROM TC INTO @CN3 END CLOSE TC DEALLOCATE TC DROP TABLE #TEMP
/* Задание 4: Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает заданные столбцы из заданной таблицы */
CREATE PROCEDURE SelectColumnsFromTable @Cols4 VARCHAR(200), @TableName4 VARCHAR(50) AS BEGIN DECLARE @SQL4 VARCHAR(300) SET @SQL4 = 'SELECT ' + @Cols4 + ' FROM ' + @TableName4 EXECUTE (@SQL4) END
/* Задание 5: Создайте процедуру, принимающую как параметр список столбцов, название таблицы, название проверяемого столбца, знак сравнения, значение проверки и выбирающую заданные столбцы из заданной таблицы в заданных условиях */
CREATE PROCEDURE SelectColumnsWithCondition @Cols5 VARCHAR(200), @TableName5 VARCHAR(50), @CheckCol5 VARCHAR(50), @Operator5 VARCHAR(10), @Value5 VARCHAR(50) AS BEGIN DECLARE @SQL5 VARCHAR(500) SET @SQL5 = 'SELECT ' + @Cols5 + ' FROM ' + @TableName5 + ' WHERE ' + @CheckCol5 + ' ' + @Operator5 + ' ' + @Value5 EXECUTE (@SQL5) END
/* Задание 6: Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML */
SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Континент = 'Европа' FOR XML RAW
/* Задание 7: Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML */
SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Население > 100000000 FOR XML PATH
/* Задание 8: Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспортируйте в PATH формате JSON */
SELECT ID, Фамилия, Предмет, Школа, Баллы FROM Ученики WHERE Школа = 'Лицей' FOR JSON PATH