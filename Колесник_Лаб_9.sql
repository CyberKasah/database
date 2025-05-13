USE University;
BACKUP DATABASE University
TO DISK = 'C:\Users\alies\Downloads\Backup\University.bak';
EXEC sp_addrole 'ADMIN';
EXEC sp_addrole 'TEACHER';
EXEC sp_addrole 'SECRETARY';

GRANT SELECT, INSERT, UPDATE, DELETE ON Discuplinu TO ADMIN;
GRANT EXECUTE TO ADMIN;

GRANT SELECT, UPDATE ON Discuplinu TO TEACHER;
GRANT EXECUTE TO TEACHER;

GRANT SELECT, INSERT ON Discuplinu TO SECRETARY;
EXEC sp_addlogin 'Sidorov_Tea', 'Sidorov', 'University';
USE University;
EXEC sp_adduser 'Sidorov_Tea', 'Sidorov_Tea';
EXEC sp_addrolemember 'TEACHER', 'Sidorov_Tea';

EXEC sp_addlogin 'Nikitin_Sec', 'Nikitin', 'University';
USE University;
EXEC sp_adduser 'Nikitin_Sec', 'Nikitin_Sec';
EXEC sp_addrolemember 'SECRETARY', 'Nikitin_Sec';

EXEC sp_addlogin 'Egorov_Adm', 'Egorov', 'University';
USE University;
EXEC sp_adduser 'Egorov_Adm', 'Egorov_Adm';
EXEC sp_addrolemember 'ADMIN', 'Egorov_Adm';