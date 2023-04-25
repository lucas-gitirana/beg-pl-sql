create or replace PACKAGE BODY GENDER_TYPE as
    
    FUNCTION get_id(
        aiv_code in GENDER_TYPES.code%TYPE
    )return GENDER_TYPES.id%TYPE is 

    n_id GENDER_TYPES.id%TYPE;

    begin
        select id 
        into n_id 
        from GENDER_TYPES 
        where code = aiv_code;

        return n_id;
    end get_id;

end GENDER_TYPE;
/