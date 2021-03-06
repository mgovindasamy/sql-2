/***********************************************************************
*
*N  IMPDP.SQL  --  Import Data Pump Steps
*
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*P  Purpose:
*     This script serves as a series of steps to complete the import
*	data pump process using the IMPDP utility. This script is meant to
*	be run one step at a time.
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*H  History:
*
*    Christian Wells        11/03/2014               Original coding.
*	 Matt Ziebarth			07/01/2015				 Add Index Functions
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*V  Versions Supported:
*   EGDB: All
*	DBMS: Oracle
*	DBMS Version: 11g and above 
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*T  Tags:
*   IMPDP, Data Pump, Oracle, Import   
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*R  Resources:
*   IMPDP Syntax:	
*	http://ss64.com/ora/impdp.html 
*E
***********************************************************************/


--1. Create an Oracle database

--2. Connect as SYS via SQL*Plus

--sqlplus sys/sys@server/sid as sysdba

--3. Grant public permissions for Oracle geodatabase

GRANT EXECUTE ON dbms_pipe TO public;
GRANT EXECUTE ON dbms_lock TO public;
GRANT EXECUTE ON dbms_lob TO public;
GRANT EXECUTE ON dbms_utility TO public;
GRANT EXECUTE ON dbms_sql TO public;
GRANT EXECUTE ON utl_raw TO public;


--4. Create all required tablespaces
--Note this is a default tablespace to auto extend
CREATE TABLESPACE SDE DATAFILE '/home/oracle/orcl/oradata/simpy/sde.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT 
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;

CREATE TABLESPACE SIGELEC DATAFILE  '/home/oracle/orcl/oradata/simpy/SIGELEC.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;
 
CREATE TABLESPACE DSGTC  DATAFILE  '/home/oracle/orcl/oradata/simpy/DSGTC.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT 
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;
 
CREATE TABLESPACE ISDE DATAFILE  '/home/oracle/orcl/oradata/simpy/ISDE.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT 
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;
 
CREATE TABLESPACE CARTOGRAFIA DATAFILE '/home/oracle/orcl/oradata/simpy/CARTOGRAFIA.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT 
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;
 
CREATE TABLESPACE COSIGETEC  DATAFILE  '/home/oracle/orcl/oradata/simpy/COSIGETEC.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT 
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;
 
CREATE TABLESPACE PROCESS DATAFILE  '/home/oracle/orcl/oradata/simpy/PROCESS.dbf' 
SIZE 100M AUTOEXTEND ON NEXT 51200K MAXSIZE UNLIMITED EXTENT MANAGEMENT 
LOCAL UNIFORM SIZE 320K LOGGING ONLINE SEGMENT SPACE MANAGEMENT MANUAL;


--5. Create the user/schema

create user sde identified by sde default tablespace sde;


--6. Grant all necessary permissions to the new user:

grant CREATE SESSION to sde;
grant CREATE TABLE to sde;
grant CREATE TRIGGER to sde;
grant CREATE SEQUENCE to sde;
grant CREATE PROCEDURE to sde;

grant EXECUTE ON DBMS_CRYPTO to sde;
grant CREATE INDEXTYPE to sde;
grant CREATE LIBRARY to sde;
grant CREATE OPERATOR to sde;
grant CREATE PUBLIC SYNONYM to sde;
grant CREATE TYPE to sde;
grant CREATE VIEW to sde;
grant DROP PUBLIC SYNONYM to sde;
grant ADMINISTER DATABASE TRIGGER to sde;

grant ALTER ANY INDEX to sde;
grant ALTER ANY TABLE to sde;
grant CREATE ANY INDEX to sde;
grant CREATE ANY TRIGGER to sde;
grant CREATE ANY VIEW to sde;
grant DROP ANY INDEX to sde;
grant DROP ANY VIEW to sde;
grant SELECT ANY TABLE to sde;

grant ALTER SESSION to sde;
grant ANALYZE ANY to sde;
grant SELECT ANY DICTIONARY to sde;
grant CREATE DATABASE LINK to sde;
grant CREATE MATERIALIZED VIEW to sde;
grant RESTRICTED SESSION to sde;
grant UNLIMITED TABLESPACE to sde;
grant ALTER SYSTEM to sde;
grant SELECT_CATALOG_ROLE to sde;


