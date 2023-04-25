drop table DEBUGS;

CREATE TABLE DEBUGS(
    id number(38) not null, 
    text varchar2(256),
    unique_session_id varchar2(24) not null,
    insert_user varchar2(30) DEFAULT USER not null,
    insert_date date DEFAULT SYSDATE not null
);

CREATE SEQUENCE DEBUGS_ID START WITH 1 ORDER;

ALTER TABLE DEBUGS ADD
CONSTRAINT DEBUGS_PK
PRIMARY KEY (id)
USING INDEX;

grant all on debugs to public;