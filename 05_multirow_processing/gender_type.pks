create or replace PACKAGE GENDER_TYPE as
    FUNCTION get_id(
        aiv_code in GENDER_TYPES.code%TYPE
    )return GENDER_TYPES.id%TYPE;
end GENDER_TYPE;
/