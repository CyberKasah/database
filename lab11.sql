/* ������ 1: ���� ����� A � B. ����� � ������� �� ������������ */
DECLARE @A1 INT, @B1 INT, @C1 INT SET @A1 = 5 SET @B1 = 10 SET @C1 = @A1 * @B1 PRINT @C1
/* ������ 2: � ������� �������� ����� ������� ����� �������� ������� ��������� � ����������� */
DECLARE @licey2 FLOAT, @gimn2 FLOAT, @diff2 FLOAT SET @licey2 = (SELECT AVG(�����) FROM ������� WHERE ����� = '�����') SET @gimn2 = (SELECT AVG(�����) FROM ������� WHERE ����� = '��������') SET @diff2 = ABS(@licey2 - @gimn2) PRINT @diff2
/* ������ 3: � ������� �������� ��������� �� �������� ���������� ����� */
DECLARE @count3 INT SELECT @count3 = COUNT(*) FROM ������� IF @count3 % 2 = 0 PRINT '���������� ����� ������' ELSE PRINT '���������� ����� ��������'
/* ������ 4: ���� �������������� �����. ������� ����� ��� ���� */
DECLARE @num4 INT = 1234, @sum4 INT SET @sum4 = (@num4 / 1000) + ((@num4 / 100) % 10) + ((@num4 / 10) % 10) + (@num4 % 10) PRINT @sum4
/* ������ 5: ���� ��������� ����� ����� a, b � c. ����� ���������� �� ��� */
DECLARE @a5 INT = CAST(RAND() * 100 AS INT), @b5 INT = CAST(RAND() * 100 AS INT), @c5 INT = CAST(RAND() * 100 AS INT) IF @a5 <= @b5 AND @a5 <= @c5 PRINT '@a5 = ' + CAST(@a5 AS VARCHAR(3)) ELSE IF @b5 <= @a5 AND @b5 <= @c5 PRINT '@b5 = ' + CAST(@b5 AS VARCHAR(3)) ELSE PRINT '@c5 = ' + CAST(@c5 AS VARCHAR(3))
/* ������ 6: ���� ��������� ����� ����� a. ���������, ������� �� ������ ����� �� 11 */
DECLARE @a6 INT = CAST(RAND() * 100 AS INT) IF @a6 % 11 = 0 PRINT CAST(@a6 AS VARCHAR(3)) + ' ������� �� 11' ELSE PRINT CAST(@a6 AS VARCHAR(3)) + ' �� ������� �� 11'
/* ������ 7: ���� ��������� ����� ����� N (N < 1000). ���� ��� �������� �������� ����� 3, �� ������� ���, ���� �� �������� � ������� ���� */
DECLARE @a7 INT = CAST(RAND() * 1000 AS INT), @temp7 INT SET @temp7 = @a7 WHILE @temp7 % 3 = 0 SET @temp7 = @temp7 / 3 IF @temp7 = 1 PRINT '��' ELSE PRINT '���'
/* ������ 8: ���� ��������� ����� ����� a � b. ����� ���������� ����� ������� (���) */
DECLARE @a8 INT = CAST(RAND() * 1000 AS INT), @b8 INT = CAST(RAND() * 1000 AS INT), @x8 INT, @y8 INT, @orig_a8 INT, @orig_b8 INT SET @x8 = @a8 SET @y8 = @b8 SET @orig_a8 = @a8 SET @orig_b8 = @b8 WHILE @x8 != @y8 BEGIN IF @x8 > @y8 SET @x8 = @x8 - @y8 ELSE SET @y8 = @y8 - @x8 END PRINT '@a8 = ' + CAST(@a8 AS VARCHAR(4)) PRINT '@b8 = ' + CAST(@b8 AS VARCHAR(4)) PRINT '��� = ' + CAST((@orig_a8 * @orig_b8) / @x8 AS VARCHAR(10))
/* ������ 9: ���� ��� ����� ����� A � B (A<B). ����� ����� ��������� ���� ����� ����� �� A �� B ������������ */
DECLARE @a9 INT = 5, @b9 INT = 10, @s9 INT = 0 WHILE @a9 <= @b9 BEGIN SET @s9 = @s9 + (@a9 * @a9) SET @a9 = @a9 + 1 END PRINT '����� = ' + CAST(@s9 AS VARCHAR(10))
/* ������ 10: ����� ������ ����������� �����, ������� ��� ������� �� 2, 3, 4, 5, � 6 ���� ������� 1, �� ������� �� 7 */
DECLARE @n10 INT = 1 WHILE (@n10 % 2 != 1 OR @n10 % 3 != 1 OR @n10 % 4 != 1 OR @n10 % 5 != 1 OR @n10 % 6 != 1 OR @n10 % 7 != 0) SET @n10 = @n10 + 1 PRINT @n10
/* ������ 11: ������� ���� ������� �� ����� ������� ���, ������� � ��� ���� */
DECLARE @L11 INT, @N11 VARCHAR(10) = '��������' SET @L11 = LEN(@N11) WHILE @L11 > 0 BEGIN PRINT @N11 SET @L11 = @L11 - 1 END
/* ������ 12: ������� �� ����� � ������� ����� ����� �������������� � ��������� ������� */
DECLARE @N12 CHAR(13) = '�������������', @L12 INT = 1, @M12 INT = LEN('�������������') WHILE @L12 <= @M12 BEGIN PRINT SUBSTRING(@N12, 1, @L12) + SUBSTRING(@N12, @M12 - @L12 + 1, @L12) SET @L12 = @L12 + 1 END