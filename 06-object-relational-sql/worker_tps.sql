create TYPE WORKER as object(
    
    --definfir tamanho de cada atributo
    id number(38),
    worker_type_id number(38),
    external_id varchar2(30),
    first_name varchar2(30),
    middle_name varchar2(30),
    last_name varchar2(30),
    name varchar2(100),
    birth_date date,
    gender_type_id number(38),

    MEMBER FUNCTION get_age
    return number,

    MEMBER FUNCTION get_age(
        aid_on date
    )return number,

    STATIC FUNCTION get_age(
        aid_birth_date in date,
        aid_on in date
    )return number,

    STATIC FUNCTION get_age(
        aid_birth_date in date
    )return number,

    STATIC FUNCTION get_age(
        ain_id in number,
        aid_on in date
    )return number,

    STATIC FUNCTION get_age(
        ain_id in number
    )return number,

    STATIC FUNCTION get_birth_date(
        ain_id in number
    )return date,

    STATIC FUNCTION get_external_id
    return varchar2,

    STATIC FUNCTION get_formatted_name(
        aiv_first_name in varchar2,
        aiv_middle_name in varchar2,
        aiv_last_name in varchar2
    )return varchar2,

    STATIC FUNCTION get_formatted_name(
        ain_id in number
    )return varchar2,

    STATIC FUNCTION get_id
    return number,

    STATIC FUNCTION get_id(
        aiv_external_id in varchar2
    )return number,
    
    STATIC FUNCTION get_row(
        aio_worker in WORKER
    )return WORKER,

    STATIC FUNCTION get_unformatted_name(
        aiv_first_name in varchar2,
        aiv_middle_name in varchar2,
        aiv_last_name in varchar2 
    )return varchar2,

    MEMBER PROCEDURE help,

    STATIC FUNCTION is_duplicate(
        aiv_name in varchar2,
        aid_birth_date in date,
        ain_gender_type_id in varchar2
    )return boolean,

    STATIC PROCEDURE set_row(
        aioo_worker in out WORKER
    ),

    MEMBER PROCEDURE test,

    MAP MEMBER FUNCTION to_varchar2
    return varchar2,

    CONSTRUCTOR FUNCTION worker(
        self in out worker,
        ain_worker_type_id in number,
        aiv_first_name in varchar2,
        aiv_middle_name in varchar2,
        aiv_last_name in varchar2,
        aid_birth_date in date,
        ain_gender_type_id in number
    )return self as result,        


    CONSTRUCTOR FUNCTION worker(
        self in out worker
    )return self as result

);
/