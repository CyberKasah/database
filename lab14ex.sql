/* Пример 1: Создать триггер на добавление записи в таблицу «Ученики», выводящий «Запись добавлена» */
CREATE TRIGGER Пример1 ON Ученики FOR INSERT AS BEGIN PRINT 'Запись добавлена' END
/* Пример 2: Создать триггер на удаление записи из таблицы «Ученики», выводящий «Запись удалена» */
CREATE TRIGGER Пример2 ON Ученики AFTER DELETE AS BEGIN PRINT 'Запись удалена' END
/* Пример 3: Создать триггер на добавление, изменение и удаление данных для таблицы «Ученики», выводящий «Таблица изменена» */
CREATE TRIGGER Пример3 ON Ученики FOR INSERT, UPDATE, DELETE AS BEGIN PRINT 'Таблица изменена' END
/* Пример 4: Создать триггер на удаление записи из таблицы «Ученики», выводящий «Нельзя удалить данные» */
CREATE TRIGGER Пример4 ON Ученики INSTEAD OF DELETE AS BEGIN PRINT 'Нельзя удалить данные' END
/* Пример 5: Создать таблицу «Ученики_Архив» и триггер для фиксации удалённых данных из «Ученики» */
CREATE TABLE Ученики_Архив (ID INT NOT NULL, Фамилия VARCHAR(50) NULL, Предмет VARCHAR(50) NULL, Школа VARCHAR(50) NULL, Баллы FLOAT NULL, Удалено DATETIME NOT NULL) 
CREATE TRIGGER Пример5 ON Ученики FOR DELETE AS BEGIN INSERT Ученики_Архив SELECT ID, Фамилия, Предмет, Школа, Баллы, GETDATE() AS Удалено FROM DELETED END
/* Пример 6: Приостановить и запустить триггер Пример5 */
DISABLE TRIGGER Пример5 ON Ученики ENABLE TRIGGER Пример5 ON Ученики
/* Пример 7: Удалить триггер Пример5 */
DROP TRIGGER Пример5