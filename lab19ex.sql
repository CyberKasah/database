/* Пример 1: Создайте и запустите динамический SQL-запрос, выбирающий все данные из заданной таблицы */
DECLARE @DSQL VARCHAR(100) DECLARE @TN1 VARCHAR(50) SET @TN1 = 'Ученики' SET @DSQL = 'SELECT * FROM ' + @TN1 EXECUTE (@DSQL)
/* Пример 2: Создайте и запустите динамический SQL-запрос, выбирающий всех учеников из таблицы «Ученики», вторая буква фамилии которых расположена в заданном диапазоне */
DECLARE @L1 CHAR(1) DECLARE @L2 CHAR(1) SET @L1 = 'а' SET @L2 = 'д' EXECUTE ('SELECT * FROM Ученики WHERE Фамилия LIKE ''_[' + @L1 + '-' + @L2 + ']%''')
/* Пример 3: Создайте временную таблицу #Temp и добавить в нее название пяти таблиц из базы данных «Учебная». Создайте курсор, который, построчно читая таблицу #Temp, выбирает из каждой таблицы все данные */
CREATE TABLE #TEMP (TABLENAME VARCHAR(50)) INSERT INTO #TEMP VALUES ('Дисциплина'), ('Заявка'), ('Инженер'), ('Кафедра'), ('Сотрудник') DECLARE TC CURSOR FOR SELECT TABLENAME FROM #TEMP OPEN TC DECLARE @TN3 VARCHAR(50) FETCH FROM TC INTO @TN3 WHILE @@FETCH_STATUS = 0 BEGIN EXECUTE ('SELECT * FROM ' + @TN3) FETCH FROM TC INTO @TN3 END CLOSE TC DEALLOCATE TC DROP TABLE #TEMP
/* Пример 4: Выберите данные из таблицы «Ученики» и экспортируйте в RAW формате XML */
SELECT ID, Фамилия, Предмет, Школа, Баллы FROM Ученики FOR XML RAW
/* Пример 5: Выберите данные из таблицы «Страны» и экспортируйте в PATH формате XML */
SELECT Название, Столица, Площадь, Население, Континент FROM Страны FOR XML PATH
/* Пример 6: Выберите данные из таблицы «Ученики» и экспортируйте в PATH формате JSON */
SELECT ID, Фамилия, Предмет, Школа, Баллы FROM Ученики FOR JSON PATH