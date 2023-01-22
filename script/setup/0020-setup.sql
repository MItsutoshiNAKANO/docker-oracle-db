-- @see https://github.com/oracle/docker-images/tree/main/OracleDatabase/SingleInstance
-- @see https://zenn.dev/re24_1986/articles/29430f2f8b4b46

-- PDBの新規作成(pdb$seedから作成)
CREATE PLUGGABLE DATABASE pdb01 ADMIN USER pdb01admin file_name_convert = ('/opt/oracle/oradata/EE/pdbseed/','/opt/oracle/oradata/EE/pdb01/');
-- PDBの起動
ALTER PLUGGABLE DATABASE pdb01 OPEN;
-- PDBの自動起動設定
ALTER PLUGGABLE DATABASE pdb01 SAVE STATE;
-- PDB切り替え（これがないと、コンテナ再起動時に「ORA-01109: database not open」が発生）
ALTER SESSION SET CONTAINER=pdb01;
-- ロール権限付与 
GRANT DBA TO PDB_DBA;
-- 表領域作成
CREATE TABLESPACE users
DATAFILE '/opt/oracle/oradata/EE/pdb01/users01.dbf' SIZE 300M
AUTOEXTEND ON NEXT 500K MAXSIZE UNLIMITED;
