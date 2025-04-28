/* ������ 1: ������� ������� �� ���������� ������ � ������� ��������, ��������� ������� ��������� */
CREATE TRIGGER ������1 ON ������� FOR INSERT AS BEGIN PRINT '������ ���������' END
/* ������ 2: ������� ������� �� �������� ������ �� ������� ��������, ��������� ������� ������� */
CREATE TRIGGER ������2 ON ������� AFTER DELETE AS BEGIN PRINT '������ �������' END
/* ������ 3: ������� ������� �� ����������, ��������� � �������� ������ ��� ������� ��������, ��������� �������� �������� */
CREATE TRIGGER ������3 ON ������� FOR INSERT, UPDATE, DELETE AS BEGIN PRINT '������� ��������' END
/* ������ 4: ������� ������� �� �������� ������ �� ������� ��������, ��������� ������� ������� ������ */
CREATE TRIGGER ������4 ON ������� INSTEAD OF DELETE AS BEGIN PRINT '������ ������� ������' END
/* ������ 5: ������� ������� ��������_����� � ������� ��� �������� �������� ������ �� �������� */
CREATE TABLE �������_����� (ID INT NOT NULL, ������� VARCHAR(50) NULL, ������� VARCHAR(50) NULL, ����� VARCHAR(50) NULL, ����� FLOAT NULL, ������� DATETIME NOT NULL) 
CREATE TRIGGER ������5 ON ������� FOR DELETE AS BEGIN INSERT �������_����� SELECT ID, �������, �������, �����, �����, GETDATE() AS ������� FROM DELETED END
/* ������ 6: ������������� � ��������� ������� ������5 */
DISABLE TRIGGER ������5 ON ������� ENABLE TRIGGER ������5 ON �������
/* ������ 7: ������� ������� ������5 */
DROP TRIGGER ������5