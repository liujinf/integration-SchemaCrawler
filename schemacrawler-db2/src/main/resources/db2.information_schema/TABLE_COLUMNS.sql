SELECT
  IC.*,
  CASE WHEN C.IDENTITY ='Y' THEN 1 ELSE 0 END AS IS_AUTOINCREMENT,
  CASE WHEN C.GENERATED ='' THEN 0 ELSE 1 END AS IS_GENERATEDCOLUMN,
  C.REMARKS,
  CAST(C.TEXT AS VARCHAR(32000)) AS COMPUTED_FORMULA
FROM
  SYSCAT.COLUMNS C
  INNER JOIN SYSCAT.TABLES T
    ON T.TABSCHEMA = C.TABSCHEMA AND T.TABNAME = C.TABNAME
  INNER JOIN SYSIBM.SQLCOLUMNS IC
    ON C.TABSCHEMA = IC.TABLE_SCHEM AND C.TABNAME = IC.TABLE_NAME AND C.COLNAME = IC.COLUMN_NAME
ORDER BY
  TABLE_SCHEM,
  TABLE_NAME,
  ORDINAL_POSITION
WITH UR
