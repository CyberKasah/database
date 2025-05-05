/* ������� 1: �������� � ��������� ������������ SQL-������, ���������� ������ N ����� �� �������� ������� */
DECLARE @DSQL1 VARCHAR(100) DECLARE @TN1 VARCHAR(50) DECLARE @N1 INT SET @TN1 = '�������' SET @N1 = 5 SET @DSQL1 = 'SELECT TOP ' + CAST(@N1 AS VARCHAR) + ' * FROM ' + @TN1 EXECUTE (@DSQL1)
/* ������� 2: �������� � ��������� ������������ SQL-������, ���������� ��� ������ �� ������� ��������, ��������� ����� �������� ������� ����������� � �������� ��������� */
DECLARE @L1 CHAR(1) DECLARE @L2 CHAR(1) SET @L1 = '�' SET @L2 = '�' EXECUTE ('SELECT * FROM ������ WHERE �������� LIKE ''%[' + @L1 + '-' + @L2 + ']''')
/* ������� 3: �������� ��������� ������� #Temp � �������� � ��� �������� �������� ������� ��������. �������� ������, �������, ��������� ����� ������� #Temp, �������� ������ ��� ��������������� ������� �� ������� �������� */
CREATE TABLE #TEMP (COLUMNNAME VARCHAR(50)) INSERT INTO #TEMP VALUES ('��������'), ('�������'), ('�������'), ('���������'), ('���������') DECLARE TC CURSOR FOR SELECT COLUMNNAME FROM #TEMP OPEN TC DECLARE @CN3 VARCHAR(50) FETCH FROM TC INTO @CN3 WHILE @@FETCH_STATUS = 0 BEGIN EXECUTE ('SELECT ' + @CN3 + ' FROM ������') FETCH FROM TC INTO @CN3 END CLOSE TC DEALLOCATE TC DROP TABLE #TEMP
/* ������� 4: �������� ���������, ������� ��������� ��� �������� ������ ��������, �������� ������� � �������� �������� ������� �� �������� ������� */
CREATE PROCEDURE SelectColumnsFromTable @Cols4 VARCHAR(200), @TableName4 VARCHAR(50) AS BEGIN DECLARE @SQL4 VARCHAR(300) SET @SQL4 = 'SELECT ' + @Cols4 + ' FROM ' + @TableName4 EXECUTE (@SQL4) END
/* ������� 5: �������� ���������, ����������� ��� �������� ������ ��������, �������� �������, �������� ������������ �������, ���� ���������, �������� �������� � ���������� �������� ������� �� �������� ������� � �������� �������� */
CREATE PROCEDURE SelectColumnsWithCondition @Cols5 VARCHAR(200), @TableName5 VARCHAR(50), @CheckCol5 VARCHAR(50), @Operator5 VARCHAR(10), @Value5 VARCHAR(50) AS BEGIN DECLARE @SQL5 VARCHAR(500) SET @SQL5 = 'SELECT ' + @Cols5 + ' FROM ' + @TableName5 + ' WHERE ' + @CheckCol5 + ' ' + @Operator5 + ' ' + @Value5 EXECUTE (@SQL5) END
/* ������� 6: �������� ������ ����������� ����� �� ������� �������� � ������������� � RAW ������� XML */
SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ��������� = '������' FOR XML RAW
/* ������� 7: �������� ������ ����� � ���������� ������ 100 ���. ���. �� ������� �������� � ������������� � PATH ������� XML */
SELECT ��������, �������, �������, ���������, ��������� FROM ������ WHERE ��������� > 100000000 FOR XML PATH
/* ������� 8: �������� ������ �������� �� ����� ������ �� ������� �������� � ������������� � PATH ������� JSON */
SELECT ID, �������, �������, �����, ����� FROM ������� WHERE ����� = '�����' FOR JSON PATH