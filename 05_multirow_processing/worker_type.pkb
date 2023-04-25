create or replace PACKAGE BODY WORKER_TYPE as
    
    FUNCTION get_id(
        aiv_code in WORKER_TYPES.code%TYPE
    )return WORKER_TYPES.id%TYPE is 
    
    n_id WORKER_TYPES.id%TYPE;

    begin        
        select id 
        into n_id 
        from WORKER_TYPES 
        where code = aiv_code;

        return n_id;
    end get_id;

end WORKER_TYPE;
/