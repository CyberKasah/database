/* ������ 1: ������� ������� ��� ������ �������� ������ � �������� �������� */
CREATE FUNCTION �������1 (@������� AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN DECLARE @S1 AS VARCHAR(50) SELECT @S1 = �������� FROM ������ WHERE ������� = @������� RETURN @S1 END
/* ������ 2: ������� ������� ��� �������� ��������� � ���. ���. */
CREATE FUNCTION �������2 (@��������� AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P2 AS FLOAT SET @P2 = ROUND(@��������� / 1000000, 2) RETURN @P2 END
/* ������ 3: ������� ������� ��� ���������� ��������� ��������� �������� ����� ����� */
CREATE FUNCTION �������3 (@���� AS VARCHAR(50)) RETURNS FLOAT AS BEGIN DECLARE @P3 AS FLOAT SELECT @P3 = ROUND(SUM(CAST(��������� AS FLOAT)) / SUM(�������), 2) FROM ������ WHERE ��������� = @���� RETURN @P3 END
/* ������ 4: ������� ������� ��� ������ ������, ������� �� ��������� */
CREATE FUNCTION �������4() RETURNS VARCHAR(50) AS BEGIN DECLARE @P4 AS VARCHAR(50), @M1 AS FLOAT, @M2 AS FLOAT, @M3 AS FLOAT SELECT @M1 = MAX(���������) FROM ������ SELECT @M2 = MAX(���������) FROM ������ WHERE ��������� < @M1 SELECT @M3 = MAX(���������) FROM ������ WHERE ��������� < @M2 SELECT @P4 = �������� FROM ������ WHERE ��������� = @M3 RETURN @P4 END
/* ������ 5: ������� ������� ��� ������ ������ � ������������ ���������� � �������� ����� �����, � ����� �� ��������� */
CREATE FUNCTION �������5 (@���� AS VARCHAR(50) = '����') RETURNS VARCHAR(50) AS BEGIN DECLARE @P5 AS VARCHAR(50), @M5 AS FLOAT SELECT @M5 = MAX(���������) FROM ������ WHERE ��������� = @���� SELECT @P5 = �������� FROM ������ WHERE ��������� = @���� AND ��������� = @M5 RETURN @P5 END
/* ������ 6: ������� ������� ��� ������ ���� � ����� �� ������� �� ������������� �� ����� */
CREATE FUNCTION �������6 (@A6 AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN RETURN LEFT(@A6, 2) + '����' + RIGHT(@A6, 1) END
/* ������ 7: ������� �������, ������� ���������� ���������� �����, �� ���������� �������� ����� */
CREATE FUNCTION �������7 (@C7 AS CHAR(1)) RETURNS INT AS BEGIN DECLARE @K7 AS INT SELECT @K7 = COUNT(*) FROM ������ WHERE CHARINDEX(@C7, ��������) = 0 RETURN @K7 END
/* ������ 8: ������� ������� ��� �������� ������ ����� � �������� ������ ��������� ����� */
CREATE FUNCTION �������8 (@N8 AS FLOAT) RETURNS TABLE AS RETURN (SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ������� < @N8)
/* ������ 9: ������� ������� ��� �������� ������ ����� � ���������� � ��������� �������� �������� */
CREATE FUNCTION �������9 (@A9 AS FLOAT, @B9 AS FLOAT) RETURNS TABLE AS RETURN (SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ��������� BETWEEN @A9 AND @B9)
/* ������ 10: ������� ������� ��� �������� ������� � ��������� ���������� � ��������� ���������� */
CREATE FUNCTION �������10() RETURNS @����_����� TABLE (��������� VARCHAR(50), ���������_��������� FLOAT) AS BEGIN INSERT @����_����� SELECT ���������, SUM(���������) FROM ������ GROUP BY ��������� RETURN END
/* ������ 11: ������� �������, ������������ 1, ���� ����� �������� �����������, � 0 � ��������� ������ */
CREATE FUNCTION �������11 (@P AS INT) RETURNS INT AS BEGIN DECLARE @R INT, @N INT = @P, @Rev INT = 0 WHILE @N > 0 BEGIN SET @R = @N % 10 SET @Rev = @Rev * 10 + @R SET @N = @N / 10 END RETURN CASE WHEN @Rev = @P THEN 1 ELSE 0 END END
/* ������ 12: ������� �������, ������������ ����� ������������ �������� ��� ����� (x, y) */
CREATE FUNCTION �������12 (@x AS FLOAT, @y AS FLOAT) RETURNS INT AS BEGIN RETURN CASE WHEN @x > 0 AND @y > 0 THEN 1 WHEN @x < 0 AND @y > 0 THEN 2 WHEN @x < 0 AND @y < 0 THEN 3 WHEN @x > 0 AND @y < 0 THEN 4 ELSE 0 END END
/* ������ 13: ������� �������, ������������ 1, ���� ����� �������, � 0 � ��������� ������ */
CREATE FUNCTION �������13 (@N AS INT) RETURNS INT AS BEGIN DECLARE @i INT = 2, @IsPrime INT = 1 IF @N <= 1 SET @IsPrime = 0 WHILE @i <= SQRT(@N) BEGIN IF @N % @i = 0 SET @IsPrime = 0 SET @i = @i + 1 END RETURN @IsPrime END