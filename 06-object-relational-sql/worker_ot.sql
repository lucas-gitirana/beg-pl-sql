create table WORKERS of WORKER;

create sequence WORKERS_ID start with 1;

create sequence EXTERNAL_ID_SEQ start with 100000000 order;

alter table WORKERS add
constraint WORKERS_PK
primary key (id)
using index;

alter table WORKERs add 
constraint WORKERS_UK1
unique(external_id)
using index;

alter table WORKERS add
constraint WORKERS_UK2
unique(name, birth_date, gender_type_id)
using index;

alter table WORKERS add
constraint WORKERS_FK1
foreign key (worker_type_id) references WORKER_TYPES(id);

alter table WORKERS add
constraint WORKERS_FK2
foreign key (gender_type_id) references GENDER_TYPES(id);
