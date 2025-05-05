/* ������ 1: �������� � ��������� ������������ SQL-������, ���������� ��� ������ �� �������� ������� */
DECLARE @DSQL VARCHAR(100) DECLARE @TN1 VARCHAR(50) SET @TN1 = '�������' SET @DSQL = 'SELECT * FROM ' + @TN1 EXECUTE (@DSQL)
/* ������ 2: �������� � ��������� ������������ SQL-������, ���������� ���� �������� �� ������� ��������, ������ ����� ������� ������� ����������� � �������� ��������� */
DECLARE @L1 CHAR(1) DECLARE @L2 CHAR(1) SET @L1 = '�' SET @L2 = '�' EXECUTE ('SELECT * FROM ������� WHERE ������� LIKE ''_[' + @L1 + '-' + @L2 + ']%''')
/* ������ 3: �������� ��������� ������� #Temp � �������� � ��� �������� ���� ������ �� ���� ������ ���������. �������� ������, �������, ��������� ����� ������� #Temp, �������� �� ������ ������� ��� ������ */
CREATE TABLE #TEMP (TABLENAME VARCHAR(50)) INSERT INTO #TEMP VALUES ('����������'), ('������'), ('�������'), ('�������'), ('���������') DECLARE TC CURSOR FOR SELECT TABLENAME FROM #TEMP OPEN TC DECLARE @TN3 VARCHAR(50) FETCH FROM TC INTO @TN3 WHILE @@FETCH_STATUS = 0 BEGIN EXECUTE ('SELECT * FROM ' + @TN3) FETCH FROM TC INTO @TN3 END CLOSE TC DEALLOCATE TC DROP TABLE #TEMP
/* ������ 4: �������� ������ �� ������� �������� � ������������� � RAW ������� XML */
SELECT ID, �������, �������, �����, ����� FROM ������� FOR XML RAW
/* ������ 5: �������� ������ �� ������� �������� � ������������� � PATH ������� XML */
SELECT ��������, �������, �������, ���������, ��������� FROM ������ FOR XML PATH
/* ������ 6: �������� ������ �� ������� �������� � ������������� � PATH ������� JSON */
SELECT ID, �������, �������, �����, ����� FROM ������� FOR JSON PATH