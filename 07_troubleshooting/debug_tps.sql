create type DEBUG as object(
    id number(38),
    text varchar2(256),
    unique_session_id varchar2(24),
    insert_user varchar2(30),
    insert_date date,

    CONSTRUCTOR FUNCTION debug(
        self in out nocopy debug
    )return self as result,

    CONSTRUCTOR FUNCTION debug(
        self in out nocopy debug,
        ain_id in number,
        aiv_text in varchar2
    )return self as result,

    CONSTRUCTOR FUNCTION debug(
        self in out nocopy debug,
        id in number,
        text in varchar2,
        unique_session_id in varchar2,
        insert_user in varchar2,
        insert_date in date
    )return self as result,

    STATIC FUNCTION get_id
    return number,

    STATIC PROCEDURE set_text(
        aiv_program_unit in varchar2,
        aiv_text in varchar2
    ),

    MAP MEMBER FUNCTION to_map
    return number
) not final;
/