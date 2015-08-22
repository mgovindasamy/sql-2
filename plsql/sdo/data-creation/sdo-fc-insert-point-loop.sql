/***********************************************************************
*
*N  sdo-fc-insert-point-loop.SQL  --  Insert SDO points into feature class
*
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*P  Purpose:
*     This script serves to insert point data stored in one table into
*   a registered feature class within an enterprise geodatabase.
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*H  History:
*
*    Christian Wells        08/22/2015               Original coding.
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*V  Versions Supported:
*   EGDB: 10.0 and above
*	  DBMS: Oracle
*	  DBMS Version: All
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*T  Tags:
*   Oracle, Feature Class, SDO, Insert, Point
*E
*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*
*R  Resources:
*   Next_RowID:
*	  http://desktop.arcgis.com/en/desktop/latest/manage-data/using-sql-with-gdbs/next-rowid.htm
*E
***********************************************************************/
--ORACLE SDO CURSOR

SET SERVEROUTPUT ON
-- Declare a cursor
DECLARE
  CURSOR points
  IS
    SELECT * FROM sde.input_table;
  --Loop through the cursor
BEGIN
  FOR pt IN points
  LOOP
    INSERT
    INTO SDE.POINTS
      (
        OBJECTID,
        SHAPE
      )
      VALUES
      (
        sde.gdb_util.next_rowid('sde', 'points'),
        MDSYS.SDO_GEOMETRY(2001,2286,MDSYS.SDO_POINT_TYPE(pt.point_x, pt.point_y,NULL),NULL,NULL)
      );
  END LOOP;
  COMMIT;
END;
/
