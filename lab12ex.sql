/* ������ 1: ������� ������� ��� ������ ������� ������ ������ */
CREATE FUNCTION ������1 (@������ AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN DECLARE @S1 AS VARCHAR(50) SELECT @S1 = ������� FROM ������ WHERE �������� = @������ RETURN @S1 END
/* ������ 2: ������� ������� ��� �������� ������� � ���. ��. ��. */
CREATE FUNCTION ������2 (@������� AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P2 AS FLOAT SET @P2 = ROUND(@������� / 1000, 2) RETURN @P2 END
/* ������ 3: ������� ������� ��� ���������� ��������� ��������� */
CREATE FUNCTION ������3 (@��������� AS INT, @������� AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P3 AS FLOAT SET @P3 = ROUND(CAST(@��������� AS FLOAT) / @�������, 2) RETURN @P3 END
/* ������ 4: ������� ������� ��� ������ ������ ������ �� ������� */
CREATE FUNCTION ������4() RETURNS VARCHAR(50) AS BEGIN DECLARE @P4 AS VARCHAR(50), @M1 AS FLOAT, @M2 AS FLOAT SELECT @M1 = MAX(�������) FROM ������ SELECT @M2 = MAX(�������) FROM ������ WHERE ������� < @M1 SELECT @P4 = �������� FROM ������ WHERE ������� = @M2 RETURN @P4 END
/* ������ 5: ������� ������� ��� ������ ������ � ����������� �������� � �������� ����� �����, � ������� �� ��������� */
CREATE FUNCTION ������5 (@���� AS VARCHAR(50) = '������') RETURNS VARCHAR(50) AS BEGIN DECLARE @P5 AS VARCHAR(50), @M5 AS FLOAT SELECT @M5 = MIN(�������) FROM ������ WHERE ��������� = @���� SELECT @P5 = �������� FROM ������ WHERE ��������� = @���� AND ������� = @M5 RETURN @P5 END
/* ������ 6: ������� ������� ��� ������ ���� � ����� �� ������ �� ������������� �� ����� */
CREATE FUNCTION ������6 (@A6 AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN RETURN LEFT(@A6, 1) + REPLICATE('.', LEN(@A6) - 2) + RIGHT(@A6, 1) END
/* ������ 7: ������� �������, ������� ���������� ���������� �����, ���������� �������� ����� */
CREATE FUNCTION ������7 (@C7 AS CHAR(1)) RETURNS INT AS BEGIN DECLARE @K7 AS INT SELECT @K7 = COUNT(*) FROM ������ WHERE CHARINDEX(@C7, ��������) > 0 RETURN @K7 END
/* ������ 8: ������� ������� ��� ������ ������ ����� � ���������� ������ ��������� ����� */
CREATE FUNCTION ������8 (@N8 AS INT) RETURNS TABLE AS RETURN (SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ��������� > @N8)
/* ������ 9: ������� ������� ��� ������ ������ ����� � �������� � ��������� �������� �������� */
CREATE FUNCTION ������9 (@A9 AS FLOAT, @B9 AS FLOAT) RETURNS TABLE AS RETURN (SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ������� BETWEEN @A9 AND @B9)
/* ������ 10: ������� ������� ��� �������� ������� � ��������� ������ � ���������� ��������� */
CREATE FUNCTION ������10() RETURNS @��_���� TABLE (�������� VARCHAR(50), ��������� FLOAT) AS BEGIN INSERT @��_���� SELECT ��������, CAST(��������� AS FLOAT) / ������� AS ��������� FROM ������ RETURN END
/* ������ 11: ������� ������� ������10 */
DROP FUNCTION ������10