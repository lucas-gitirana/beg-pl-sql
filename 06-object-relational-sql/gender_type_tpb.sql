create or replace TYPE BODY GENDER_TYPE as

CONSTRUCTOR FUNCTION gender_type(
    self in out gender_type
)return self as result is 
begin
    id := NULL;
    code := NULL;
    description := NULL;
    active_date := NULL;
    inactive_date := NULL;
    return;
end gender_type;


CONSTRUCTOR FUNCTION gender_type(
    self in out gender_type,
    aiv_code varchar2,
    aiv_description varchar2
)return self as result is 
begin
    id := get_id();
    code := aiv_code;
    description := aiv_description;
    active_date := SYSDATE;
    inactive_date := to_date('21001231','YYYYMMDD');
    return;    
end gender_type;


STATIC PROCEDURE get_code_descr(
    ain_id in number,
    aov_code out varchar2,
    aov_description out varchar2
)is
begin
    select code, description
    into aov_code, aov_description
    from GENDER_TYPES
    where id = ain_id;
end get_code_descr;

STATIC PROCEDURE get_code_id_descr(
    aiov_code in out varchar2,
    aon_id out number,
    aov_description out varchar2,
    aid_on in date
)is 

    v_code varchar2(30);

begin
    select id, description
    into aon_id, aov_description
    from GENDER_TYPES
    where code = aiov_code
    and aid_on between active_date and nvl(inactive_date, to_date('21001231','YYYYMMDD'));
exception
    when NO_DATA_FOUND then
        select id, code, description
        into aon_id, v_code, aov_description
        from GENDER_TYPES
        where code like aiov_code||'%'
        and aid_on between active_date and nvl(inactive_date, to_date('21001231','YYYYMMDD'));
        aiov_code := v_code;
end get_code_id_descr;


STATIC PROCEDURE get_code_id_descr(
    aiov_code in out varchar2,
    aon_id out number,
    aov_description out varchar2
)is 
begin
    get_code_id_descr(aiov_code, aon_id, aov_description, SYSDATE);
end get_code_id_descr;


MEMBER FUNCTION get_id
return number is 

    n_id number;

begin
    select GENDER_TYPES_ID.nextval
    into n_id
    from SYS.DUAL;

    return n_id;
end get_id;


STATIC FUNCTION get_id(
    aiv_code in varchar2
)return number is 

    n_id number;

begin
    select id
    into n_id
    from GENDER_TYPES
    where code=aiv_code;

    return n_id;
end get_id;


STATIC PROCEDURE help is
begin
    SYS.DBMS_OUTPUT.put_line('No help at this time');
end help;


STATIC PROCEDURE test is
begin
    SYS.DBMS_OUTPUT.put_line('No tests coded at this time');
end test;


MAP MEMBER FUNCTION to_varchar2
return varchar2 is

begin
    return description||to_char(active_date,'YYYYMMDDHH24MISS');
end to_varchar2;


end;
/