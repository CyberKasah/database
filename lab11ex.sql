/* ������ 1: ���� ����� a � b. ����� � ������� �� ����� */
DECLARE @a1 INT, @b1 INT, @c1 INT SET @a1 = 5 SET @b1 = 10 SET @c1 = @a1 + @b1 PRINT @c1
/* ������ 2: � ������� �������� ����� ������� ����� ����������� ������� ����� ��������� � ����������� */
DECLARE @licey2 FLOAT, @gimn2 FLOAT, @diff2 FLOAT SET @licey2 = (SELECT MAX(�����) FROM ������� WHERE ����� = '�����') SET @gimn2 = (SELECT MAX(�����) FROM ������� WHERE ����� = '��������') SET @diff2 = ABS(@licey2 - @gimn2) PRINT @diff2
/* ������ 3: � ������� �������� ����� ������� ����� ����������� � ����������� ������� */
DECLARE @maxp3 FLOAT, @minp3 FLOAT, @diff3 FLOAT SELECT @maxp3 = MAX(�����), @minp3 = MIN(�����) FROM ������� SET @diff3 = @maxp3 - @minp3 PRINT @diff3
/* ������ 4: ���� ��������� ����� ����� ������ 1000. ������� ��� ������� */
DECLARE @a4 INT = RAND() * 1000, @b4 INT SET @b4 = SQUARE(@a4) PRINT @b4
/* ������ 5: ���� ��������� ����� ����� a � b. ����� ���������� �� ��� */
DECLARE @a5 INT = RAND() * 100, @b5 INT = RAND() * 100 IF @a5 > @b5 PRINT '@a5 = ' + CAST(@a5 AS VARCHAR(3)) ELSE PRINT '@b5 = ' + CAST(@b5 AS VARCHAR(3))
/* ������ 6: ���� ��������� ����� ����� a. ���������, ������� �� ������ ����� �� 3 */
DECLARE @a6 INT = RAND() * 100 IF @a6 % 3 = 0 PRINT CAST(@a6 AS VARCHAR(3)) + ' ������� �� 3' ELSE PRINT CAST(@a6 AS VARCHAR(3)) + ' �� ������� �� 3'
/* ������ 7: ���� ��������� ����� ����� N (N < 1000). ���� ��� �������� �������� ����� 5, �� ������� ���, ���� �� �������� � ������� ���� */
DECLARE @a7 INT = RAND() * 1000 WHILE @a7 % 5 = 0 SET @a7 = @a7 / 5 IF @a7 = 1 PRINT '��' ELSE PRINT '���'
/* ������ 8: ���� ��������� ����� ����� a � b. ����� ���������� ����� �������� (���) */
DECLARE @a8 INT = RAND() * 1000, @b8 INT = RAND() * 1000 PRINT '@a8 = ' + CAST(@a8 AS VARCHAR(4)) PRINT '@b8 = ' + CAST(@b8 AS VARCHAR(4)) WHILE @a8 != @b8 BEGIN IF @a8 > @b8 SET @a8 = @a8 - @b8 ELSE SET @b8 = @b8 - @a8 END PRINT '��� = ' + CAST(@a8 AS VARCHAR(4))
/* ������ 9: ���� ��� ����� ����� A � B (A < B). ����� ����� ���� ����� ����� �� A �� B ������������ */
DECLARE @a9 INT = 5, @b9 INT = 10, @s9 INT = 0 WHILE @a9 <= @b9 BEGIN SET @s9 = @s9 + @a9 SET @a9 = @a9 + 1 END PRINT '����� = ' + CAST(@s9 AS VARCHAR(5))
/* ������ 10: ���� ��������� ����� ����� N (N < 100). ����� ������� ������� �����, ��������� ������� N^2 = 1 + 3 + 5 + ... + (2*N-1) */
DECLARE @N10 INT = RAND() * 10, @M10 INT = 1, @S10 INT = 0 WHILE @M10 <= 2 * @N10 - 1 BEGIN SET @S10 = @S10 + @M10 PRINT @S10 SET @M10 = @M10 + 2 END
/* ������ 11: ���� ��������� ����� ����� A � B (A < B). ������� ��� ����� ����� �� A �� B ������������; ��� ���� ����� A ������ ���������� 1 ���, ����� A + 1 ������ ���������� 2 ���� � �.�. */
DECLARE @A11 INT = RAND() * 5, @C11 INT = 1 DECLARE @B11 INT = @A11 + RAND() * 5 PRINT '@A11 = ' + CAST(@A11 AS CHAR(1)) + ', @B11 = ' + CAST(@B11 AS CHAR(1)) WHILE @A11 <= @B11 BEGIN PRINT REPLICATE(@A11, @C11) SET @A11 = @A11 + 1 SET @C11 = @C11 + 1 END
/* ������ 12: ���������� �� �� ���������� �����, ������� ������� �� 4, �� �� ������� �� 6 */
DECLARE @A12 INT = 10 WHILE @A12 < 100 BEGIN IF (@A12 % 4 = 0) AND (@A12 % 6 != 0) PRINT @A12 SET @A12 = @A12 + 1 END
/* ������ 13: ���� ��� ����� ����� D (����) � M (�����), ������������ ���������� ���� ������������� ����. ������� �������� D � M ��� ����, ��������� �� ��������� */
DECLARE @D13 INT = 31, @M13 INT = 12 SET @D13 = CASE WHEN @M13 IN (1, 3, 5, 7, 8, 10, 12) AND @D13 = 31 THEN 1 WHEN @M13 IN (4, 6, 9, 11) AND @D13 = 30 THEN 1 WHEN @M13 = 2 AND @D13 = 28 THEN 1 ELSE @D13 + 1 END SET @M13 = CASE WHEN @D13 = 1 AND @M13 = 12 THEN 1 WHEN @D13 = 1 AND @M13 < 12 THEN @M13 + 1 ELSE @M13 END PRINT CAST(@D13 AS VARCHAR(2)) + '/' + CAST(@M13 AS VARCHAR(2))
/* ������ 14: ������� ����� �������������� �� ����� ������� ���, ������� � ��� ���� */
DECLARE @L14 INT, @N14 CHAR(13) = '�������������' SET @L14 = LEN(@N14) WHILE @L14 > 0 BEGIN PRINT @N14 SET @L14 = @L14 - 1 END
/* ������ 15: ������� �� ����� � ������� ����� ����� �������������� � ���� ������������ */
DECLARE @L15 INT, @M15 INT, @N15 CHAR(13) SET @N15 = '�������������' SET @L15 = LEN(@N15) SET @M15 = @L15 WHILE @L15 > 0 BEGIN PRINT LEFT(@N15, @L15) + SPACE(2 * (@M15 - @L15)) + RIGHT(REVERSE(@N15), @L15) SET @L15 = @L15 - 1 END SET @L15 = 2 WHILE @L15 <= @M15 BEGIN PRINT LEFT(@N15, @L15) + SPACE(2 * (@M15 - @L15)) + RIGHT(REVERSE(@N15), @L15) SET @L15 = @L15 + 1 END