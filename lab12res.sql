/* ������ 1: ������� ������� ��� ������ ������ � �������� �������� */
SELECT dbo.�������1('����') AS ������
/* ������ 2: ������� ������� ��� �������� ��������� � ���. ���. */
SELECT ��������, �������, ���������, �������, dbo.�������2(���������) AS [���������_���] FROM ������
/* ������ 3: ������� ������� ��� ���������� ��������� ��������� � ���� */
SELECT dbo.�������3('����') AS ���������_����
/* ������ 4: ������� ������� ��� ������ ������, ������� �� ��������� */
SELECT dbo.�������4() AS [������ �� ��������� ������]
/* ������ 5: ������� ������� ��� ������ ������ � ������������ ���������� � ���� � ������ */
SELECT dbo.�������5('����') AS [����_���������_����], dbo.�������5('������') AS [����_���������_������]
/* ������ 6: ������� ������� ��� ������ ���� � ������� ������ �� ����� */
SELECT dbo.�������6(�������) AS [�������_�������], ��������, ���������, �������, ��������� FROM ������
/* ������ 7: ������� ������� ��� �������� ����� ��� ����� '�' */
SELECT dbo.�������7('�') AS ����������_�����_���_�
/* ������ 8: ������� ������� ��� ������ ����� � �������� ������ 10000 */
SELECT * FROM dbo.�������8(10000)
/* ������ 9: ������� ������� ��� ������ ����� � ���������� �� 1000000 �� 10000000 */
SELECT * FROM dbo.�������9(1000000, 10000000)
/* ������ 10: ������� ������� ��� ������ ������� � ��������� ���������� �� ����������� */
SELECT ���������, ���������_��������� FROM dbo.�������10()
/* ������ 11: ������� ������� ��� ��������, �������� �� ����� ����������� */
SELECT dbo.�������11(12321) AS ���������
/* ������ 12: ������� ������� ��� ����������� ������ ������������ �������� */
SELECT dbo.�������12(-5, 3) AS �����_��������
/* ������ 13: ������� ������� ��� ��������, �������� �� ����� ������� */
SELECT dbo.�������13(17) AS �������_�����
/* ������ 14: ������� ��� ��������� ������� */
/*DROP FUNCTION �������1, �������2, �������3, �������4, �������5, �������6, �������7, �������8, �������9, �������10, �������11, �������12, �������13*/