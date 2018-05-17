

/*--La consulta muestra todas las tablas de la base de datos*/ 
select name AS tablasbasedatos from sysobjects where type='U';

/*--La consulta muestra todas las vistas de la base de datos*/ 
select name AS vistasbasedatosfrom FROM sysobjects where type='V';

/*--La consulta muestra todos los procedimientos de la base de datos*/ 
select name AS procedimientosbasedatos from sysobjects where type='P';

/*--La consulta muestra todos los triggers de la base de datos*/ 
select name AS triggersn from sysobjects where type='T';

 /*--La consulta muestra todas las llaves foraneas de la base de datos*/ 
select name AS llavesforaneas from sysobjects where type='F';

/*--La consulta muestra todas las llaves primarias de la base de datos*/ 
select name AS primaryKey from sysobjects where type='K';

/*--La consulta muestra todos los objetos del sistema de la base de datos*/ 
select name AS objetossistema from sysobjects where type='S';
/*--La consulta muestra todos los objetos de la base de datos: Tablas, procedimientos almacenados, etc.*/ 
SELECT CAST(table_name as varchar)  FROM INFORMATION_SCHEMA.TABLES;



--Tabla general
SELECT 
C.TABLE_CATALOG [BASE DE DATOS],
C.TABLE_SCHEMA ESQUEMA,
C.TABLE_NAME [NOMBRE DE LA TABLA],
C.COLUMN_NAME [NOMBRE DE COLUMNA],
C.IS_NULLABLE[VALOR NULO S/N ?],
C.DATA_TYPE [TIPO DE DATO],
C.CHARACTER_MAXIMUM_LENGTH [LONGITUD DE DATO],
C.COLLATION_NAME [IDIOMA DE LA COLUMNA] 
FROM INFORMATION_SCHEMA.COLUMNS C
INNER JOIN INFORMATION_SCHEMA.TABLES A ON C.TABLE_NAME=A.TABLE_NAME
WHERE A.TABLE_NAME NOT IN(
'SYSSCHEMAARTICLES',
'SYSPUBLICATIONS',
'MSREPL_ERRORS',
'TRANSACTIONS',
'MSMERGE_HISTORY',
'MSMERGE_AGENT_PARAMETERS',
'MSMERGE_REPLINFO',
'SYSSUBSCRIPTIONS',
'SYSMERGEARTICLES',
'VW_TRAMITES_CONCEPTOS',
'SYSARTICLEUPDATES',
'MSPUB_IDENTITY_RANGE',
'SYSTRANSCHEMAS',
'SYSMERGESCHEMAARTICLES',
'SYSMERGEPARTITIONINFOVIEW',
'SYSMERGEPARTITIONINFO',
'MSMERGE_SUPPORTABILITY_SETTINGS',
'MSMERGE_SESSIONS',
'MSMERGE_PAST_PARTITION_MAPPINGS',
'MSMERGE_GENERATION_PARTITION_MAPPINGS',
'SYSMERGESUBSCRIPTIONS',
'MSDYNAMICSNAPSHOTJOBS',
'MSDYNAMICSNAPSHOTVIEWS',
'MSMERGE_AGENT_PARAMETERS',
'MSMERGE_ARTICLEHISTORY',
'MSMERGE_ALTSYNCPARTNERS',
'MSMERGE_CONTENTS',
'MSMERGE_CURRENT_PARTITION_MAPPINGS',
'MSMERGE_DYNAMIC_SNAPSHOTS',
'MSMERGE_ERRORLINEAGE',
'MSMERGE_GENHISTORY',
'MSMERGE_IDENTITY_RANGE',
'MSMERGE_LOG_FILES',
'MSMERGE_METADATAACTION_REQUEST',
'MSMERGE_PARTITION_GROUPS',
'MSMERGE_SETTINGSHISTORY',
'MSMERGE_TOMBSTONE',
'MSPEER_CONFLICTDETECTIONCONFIGREQUEST',
'MSPEER_LSNS',
'MSPEER_ORIGINATORID_HISTORY',
'MSPEER_REQUEST',
'MSPEER_TOPOLOGYREQUEST',
'SYSARTICLECOLUMNS',
'SYSARTICLES',
'SYSEXTENDEDARTICLESVIEW',
'SYSMERGEEXTENDEDARTICLESVIEW',
'SYSMERGEPUBLICATIONS',
'SYSMERGESCHEMACHANGE'

)
AND A.TABLE_TYPE NOT IN('VIEW')