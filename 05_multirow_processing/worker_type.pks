create or replace PACKAGE WORKER_TYPE as
    FUNCTION get_id(
        aiv_code in WORKER_TYPES.code%TYPE 
    )return WORKER_TYPES.id%TYPE;
end WORKER_TYPE;
/