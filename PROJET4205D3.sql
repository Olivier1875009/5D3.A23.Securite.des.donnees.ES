-- region Pluggable database
-- Disconnect the pluggable database
ALTER PLUGGABLE DATABASE PROJET4205D3 CLOSE IMMEDIATE;

-- Drop the pluggable database
DROP PLUGGABLE DATABASE PROJET4205D3 INCLUDING DATAFILES;

-- Create the pluggable database
CREATE PLUGGABLE DATABASE PROJET4205D3 ADMIN USER "homer_simpson@gmail.com" IDENTIFIED BY dnu9QAC3 ROLES=(DBA) create_file_dest='/home/oracle';

-- Set the pluggable dattabase to read-write
ALTER PLUGGABLE DATABASE PROJET4205D3 OPEN;

-- Connect to the pluggable database
ALTER SESSION SET CONTAINER = PROJET4205D3;

-- Give privileges to the admin user of the pluggable database
GRANT CREATE SESSION, CREATE TABLE, UNLIMITED TABLESPACE TO "homer_simpson@gmail.com";
-- endregion Pluggable database