/* Задание 1: Создать хранимую процедуру для вывода информации о сервере, базе данных, пользователе и времени */
CREATE PROC Задание1Процедура AS BEGIN SELECT @@Servername AS Сервер, @@Version AS [Версия СУБД], Db_Name() AS [База данных], User AS [Пользователь базы данных], System_User AS [Системный пользователь], GETDATE() AS [Текущее время] END
/* Задание 2: Создать хранимую процедуру для вывода данных всех стран */
CREATE PROC Задание2Процедура AS BEGIN SELECT Название, Столица, Площадь, Население, Континент FROM Страны END
/* Задание 3: Создать хранимую процедуру для вывода списка стран, кроме заданной части света */
CREATE PROC Задание3Процедура @Конт AS VARCHAR(50) AS BEGIN SELECT Название, Столица, Площадь, Население FROM Страны WHERE Континент != @Конт END
/* Задание 4: Создать хранимую процедуру для вывода списка стран с населением в заданном интервале */
CREATE PROC Задание4Процедура @A AS FLOAT, @B AS FLOAT AS BEGIN SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Население BETWEEN @A AND @B END
/* Задание 5: Создать хранимую процедуру для подсчета стран, у которых в названии отсутствует заданная буква */
CREATE PROC Задание5Процедура @Буква AS CHAR(1), @Количество AS INT OUTPUT AS BEGIN SELECT @Количество = COUNT(*) FROM Страны WHERE CHARINDEX(@Буква, Название) = 0 END
/* Задание 6: Создать хранимую процедуру для вывода пяти стран с наибольшим населением в заданной части света, с Африкой по умолчанию */
CREATE PROC Задание6Процедура @Конт AS VARCHAR(50) = 'Африка' AS BEGIN SELECT TOP 5 Название, Столица, Площадь, Население, Континент FROM Страны WHERE Континент = @Конт ORDER BY Население DESC END
/* Задание 7: Создать хранимую процедуру для создания таблицы «Страны_К» и заполнения странами, начинающимися на «К» */
CREATE PROC Задание7Процедура AS BEGIN SELECT Название, Столица, Площадь, Население, Континент INTO Страны_К FROM Страны WHERE LEFT(Название, 1) = 'К' END
/* Задание 8: Создать хранимую процедуру для удаления таблицы «Страны_К» с возвратом количества строк */
CREATE PROC Задание8Процедура AS BEGIN DECLARE @K AS INT SELECT @K = COUNT(*) FROM Страны_К DROP TABLE Страны_К RETURN @K END
/* Задание 9: Создать хранимую процедуру для подсчета количества цифр в числе через параметр OUTPUT */
CREATE PROC Задание9Процедура @Число AS INT, @Количество AS INT OUTPUT AS BEGIN DECLARE @N INT = ABS(@Число) SET @Количество = 0 WHILE @N > 0 BEGIN SET @N = @N / 10 SET @Количество = @Количество + 1 END IF @Число = 0 SET @Количество = 1 END
/* Задание 10: Создать хранимую процедуру AddRightDigit для добавления цифры D справа к числу K */
CREATE PROC Задание10Процедура @K AS INT OUTPUT, @D AS INT AS BEGIN IF @D BETWEEN 0 AND 9 SET @K = @K * 10 + @D END
/* Задание 11: Создать хранимую процедуру InvDigit для обращения порядка цифр в числе K */
CREATE PROC Задание11Процедура @K AS INT OUTPUT AS BEGIN DECLARE @Rev INT = 0, @N INT = @K WHILE @N > 0 BEGIN SET @Rev = @Rev * 10 + @N % 10 SET @N = @N / 10 END SET @K = @Rev END
/* Задание 12: Создать хранимую процедуру Swap для обмена значений переменных X и Y */
CREATE PROC Задание12Процедура @X AS FLOAT OUTPUT, @Y AS FLOAT OUTPUT AS BEGIN DECLARE @Temp FLOAT SET @Temp = @X SET @X = @Y SET @Y = @Temp END
/* Задание 13: Создать хранимую процедуру SortInc для сортировки значений A, B, C по возрастанию */
CREATE PROC Задание13Процедура @A AS FLOAT OUTPUT, @B AS FLOAT OUTPUT, @C AS FLOAT OUTPUT AS BEGIN DECLARE @Temp FLOAT IF @A > @B BEGIN SET @Temp = @A SET @A = @B SET @B = @Temp END IF @B > @C BEGIN SET @Temp = @B SET @B = @C SET @C = @Temp END IF @A > @B BEGIN SET @Temp = @A SET @A = @B SET @B = @Temp END END
/* Задание 14: Создать хранимую процедуру DigitCountSum для подсчета количества цифр C и их суммы S в числе K */
CREATE PROC Задание14Процедура @K AS INT, @C AS INT OUTPUT, @S AS INT OUTPUT AS BEGIN DECLARE @N INT = ABS(@K), @Digit INT SET @C = 0 SET @S = 0 WHILE @N > 0 BEGIN SET @Digit = @N % 10 SET @S = @S + @Digit SET @C = @C + 1 SET @N = @N / 10 END IF @K = 0 BEGIN SET @C = 1 SET @S = 0 END END