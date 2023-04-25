create table DEBUGS of DEBUG;

alter table DEBUGS add
constraint DEBUGS_PK
primary key(id)
using index;

create sequence DEBUGS_ID start with 1 order;

execute SYS.DBMS_STATS.gather_table_stats(USER, 'DEBUGS');

grant all on DEBUGS to public;