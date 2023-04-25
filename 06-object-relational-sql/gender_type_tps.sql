create TYPE GENDER_TYPE as object(
    id                  number,
    code                varchar2(30),
    description         varchar2(80),
    active_date         date,
    inactive_date       date,

    -- constructor of GENDER_TYPE with NULL 
    CONSTRUCTOR FUNCTION gender_type(
        self in out gender_type
    )return self as result,

    -- constructor for insert
    CONSTRUCTOR FUNCTION gender_type(
        self in out gender_type,
        aiv_code varchar2,
        aiv_description varchar2
    ) return self as result,

    -- gets the code and description for the specified ID
    -- static: can be only called by the TYPE's name, not by the object
    STATIC PROCEDURE get_code_descr(
        ain_id in number,
        aov_code out varchar2,
        aov_description out varchar2
    ),

    --verifies if the passed code is an exact or like match on the date specified
    STATIC PROCEDURE get_code_id_descr(
        aiov_code in out varchar2,
        aon_id out number,
        aov_description out varchar2,
        aid_on in date
    ),

    -- verifies that the passed code value is currently an exact or like match
    STATIC PROCEDURE get_code_id_descr(
        aiov_code in out varchar2,
        aon_id out number,
        aov_description out varchar2
    ),

    --returns a new primary key
    MEMBER FUNCTION get_id 
    return number,

    -- returns the ID for the specified code value
    STATIC FUNCTION get_id(
        aiv_code in varchar2
    ) return number,

    STATIC PROCEDURE help,

    STATIC PROCEDURE test,

    MAP MEMBER FUNCTION to_varchar2
    return varchar2
);
/