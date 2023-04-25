create or replace type body DEBUG as

CONSTRUCTOR FUNCTION debug(
    self in out nocopy debug
)return self as result is
begin
    SYS.DBMS_OUTPUT.put_line('debug(zero param)');
    self.id := NULL;
    self.text := NULL;
    self.unique_session_id := NULL;
    self.insert_user := NULL;
    self.insert_date := NULL;

    return;
end debug;

CONSTRUCTOR FUNCTION debug(
    self in out nocopy debug,
    ain_id in number,
    aiv_text in varchar2
)return self as result is
begin
    SYS.DBMS_OUTPUT.put_line('debug(two param)');
    self.id := ain_id;
    self.text := aiv_text;
    self.unique_session_id := SYS.DBMS_SESSION.unique_session_id;
    self.insert_user := USER;
    self.insert_date := SYSDATE;

    return;
end debug;

CONSTRUCTOR FUNCTION debug(
    self in out nocopy debug,
    id in number,
    text in varchar2,
    unique_session_id in varchar2,
    insert_user in varchar2,
    insert_date in date
)return self as result is
begin
    SYS.DBMS_OUTPUT.put_line('debug(five param)');
    self.id := id;
    self.text := text;
    self.unique_session_id := unique_session_id;
    self.insert_user := insert_user;
    self.insert_date := insert_date;

    return;
end debug;

STATIC FUNCTION get_id return number is
    n_id number;
begin
    select DEBUGS_ID.nextval
    into n_id
    from SYS.DUAL;

    return n_id;
end get_id;

STATIC PROCEDURE set_text(
    aiv_program_unit in varchar2,
    aiv_text in varchar2
) is
    pragma autonomous_transaction;
    v_text varchar2(256);
begin
    v_text := substrb(aiv_program_unit||': '||aiv_text, 1, 256);
    insert into DEBUGS values (DEBUG(DEBUGS_ID.nextval, aiv_text));
    commit;
end set_text;

MAP MEMBER FUNCTION to_map
return number is
begin
    return id;
end to_map;

end;
/