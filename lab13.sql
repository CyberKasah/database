/* ������� 1: ������� �������� ��������� ��� ������ ���������� � �������, ���� ������, ������������ � ������� */
CREATE PROC �������1��������� AS BEGIN SELECT @@Servername AS ������, @@Version AS [������ ����], Db_Name() AS [���� ������], User AS [������������ ���� ������], System_User AS [��������� ������������], GETDATE() AS [������� �����] END
/* ������� 2: ������� �������� ��������� ��� ������ ������ ���� ����� */
CREATE PROC �������2��������� AS BEGIN SELECT ��������, �������, �������, ���������, ��������� FROM ������ END
/* ������� 3: ������� �������� ��������� ��� ������ ������ �����, ����� �������� ����� ����� */
CREATE PROC �������3��������� @���� AS VARCHAR(50) AS BEGIN SELECT ��������, �������, �������, ��������� FROM ������ WHERE ��������� != @���� END
/* ������� 4: ������� �������� ��������� ��� ������ ������ ����� � ���������� � �������� ��������� */
CREATE PROC �������4��������� @A AS FLOAT, @B AS FLOAT AS BEGIN SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ��������� BETWEEN @A AND @B END
/* ������� 5: ������� �������� ��������� ��� �������� �����, � ������� � �������� ����������� �������� ����� */
CREATE PROC �������5��������� @����� AS CHAR(1), @���������� AS INT OUTPUT AS BEGIN SELECT @���������� = COUNT(*) FROM ������ WHERE CHARINDEX(@�����, ��������) = 0 END
/* ������� 6: ������� �������� ��������� ��� ������ ���� ����� � ���������� ���������� � �������� ����� �����, � ������� �� ��������� */
CREATE PROC �������6��������� @���� AS VARCHAR(50) = '������' AS BEGIN SELECT TOP 5 ��������, �������, �������, ���������, ��������� FROM ������ WHERE ��������� = @���� ORDER BY ��������� DESC END
/* ������� 7: ������� �������� ��������� ��� �������� ������� �������_ʻ � ���������� ��������, ������������� �� �ʻ */
CREATE PROC �������7��������� AS BEGIN SELECT ��������, �������, �������, ���������, ��������� INTO ������_� FROM ������ WHERE LEFT(��������, 1) = '�' END
/* ������� 8: ������� �������� ��������� ��� �������� ������� �������_ʻ � ��������� ���������� ����� */
CREATE PROC �������8��������� AS BEGIN DECLARE @K AS INT SELECT @K = COUNT(*) FROM ������_� DROP TABLE ������_� RETURN @K END
/* ������� 9: ������� �������� ��������� ��� �������� ���������� ���� � ����� ����� �������� OUTPUT */
CREATE PROC �������9��������� @����� AS INT, @���������� AS INT OUTPUT AS BEGIN DECLARE @N INT = ABS(@�����) SET @���������� = 0 WHILE @N > 0 BEGIN SET @N = @N / 10 SET @���������� = @���������� + 1 END IF @����� = 0 SET @���������� = 1 END
/* ������� 10: ������� �������� ��������� AddRightDigit ��� ���������� ����� D ������ � ����� K */
CREATE PROC �������10��������� @K AS INT OUTPUT, @D AS INT AS BEGIN IF @D BETWEEN 0 AND 9 SET @K = @K * 10 + @D END
/* ������� 11: ������� �������� ��������� InvDigit ��� ��������� ������� ���� � ����� K */
CREATE PROC �������11��������� @K AS INT OUTPUT AS BEGIN DECLARE @Rev INT = 0, @N INT = @K WHILE @N > 0 BEGIN SET @Rev = @Rev * 10 + @N % 10 SET @N = @N / 10 END SET @K = @Rev END
/* ������� 12: ������� �������� ��������� Swap ��� ������ �������� ���������� X � Y */
CREATE PROC �������12��������� @X AS FLOAT OUTPUT, @Y AS FLOAT OUTPUT AS BEGIN DECLARE @Temp FLOAT SET @Temp = @X SET @X = @Y SET @Y = @Temp END
/* ������� 13: ������� �������� ��������� SortInc ��� ���������� �������� A, B, C �� ����������� */
CREATE PROC �������13��������� @A AS FLOAT OUTPUT, @B AS FLOAT OUTPUT, @C AS FLOAT OUTPUT AS BEGIN DECLARE @Temp FLOAT IF @A > @B BEGIN SET @Temp = @A SET @A = @B SET @B = @Temp END IF @B > @C BEGIN SET @Temp = @B SET @B = @C SET @C = @Temp END IF @A > @B BEGIN SET @Temp = @A SET @A = @B SET @B = @Temp END END
/* ������� 14: ������� �������� ��������� DigitCountSum ��� �������� ���������� ���� C � �� ����� S � ����� K */
CREATE PROC �������14��������� @K AS INT, @C AS INT OUTPUT, @S AS INT OUTPUT AS BEGIN DECLARE @N INT = ABS(@K), @Digit INT SET @C = 0 SET @S = 0 WHILE @N > 0 BEGIN SET @Digit = @N % 10 SET @S = @S + @Digit SET @C = @C + 1 SET @N = @N / 10 END IF @K = 0 BEGIN SET @C = 1 SET @S = 0 END END