create TYPE WORKER_TYPE as object(
    id number,
    code varchar2(30),
    description varchar2(80),
    active_date date,
    inactive_date date,

    -- gets the code and description values for the specified work_type_id
    STATIC PROCEDURE get_code_descr(
        ain_id in number,
        aov_code out varchar2,
        aov_description out varchar2),

    -- verifies the passed aiov_code value is an exact or like match on the date specified
    STATIC PROCEDURE get_code_id_descr(
        aiov_code in out varchar2,
        aon_id out number,
        aov_decription out varchar2,
        aid_on in date),

    -- verifies the passed aiov_code value is currently an exact or like match.
    STATIC PROCEDURE get_code_id_descr(
        aiov_code in out varchar2,
        aon_id out number,
        aov_description out varchar2),

    -- returns a newlly allocated id value
    MEMBER FUNCTION get_id
    return number,

    -- Made by me
    STATIC FUNCTION get_id(
        aiv_code in varchar2)
    return number,

    STATIC PROCEDURE help,

    STATIC PROCEDURE  test,

    MAP MEMBER FUNCTION to_varchar2
    return varchar2,

    CONSTRUCTOR FUNCTION worker_type(
        self in out worker_type
    )return self as result, 

    CONSTRUCTOR FUNCTION worker_type(
        self in out worker_type,
        aiv_code in varchar2,
        aiv_description in varchar2
    )return self as result, 
);
/