-- make some SQL to make tables from the views. DbSchema handles tables better for underlying column info
-- Fake [_sys] and [_INFORMATION_SCHEMA] schemas
-- create schema _sys
-- go
-- create schema _INFORMATION_SCHEMA
-- go
select 'select top 0 * into ' + quotename('_' + sch.name) + '.' + quotename(sv.name) + ' from ' + quotename(sch.name) + '.' + quotename(sv.name) as create_query
     , 'drop table if exists ' + quotename('_' + sch.name) + '.' + quotename(sv.name) as drop_query
     , sch.name as schema_name
     , sv.*
from sys.system_views sv
join sys.schemas sch on sv.schema_id = sch.schema_id
order by 1, 2
