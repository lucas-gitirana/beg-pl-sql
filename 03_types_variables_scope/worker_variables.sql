declare
    n_id             WORKERS.id%TYPE                := 1;
    n_worker_type_id WORKERS.worker_type_id$TYPE    := 3;
    n_external_id    WORKERS.external_id%TYPE       := 6305551212;
    v_first_name     WORKERS.first_name%TYPE        := 'Lucas';
    v_middle_name    WORKERS.middle_name%TYPE       := 'Emanoel';
    v_last_name      WORKERS.last_name%TYPE         := 'Gitirana';
    v_name           WORKERS.name%TYPE              := 'Lucas Emanoel Gitirana';
    d_birth_date     WORKERS.birth_day%TYPE         := to_date('20031110', 'YYYYMMDD');
    n_gender_type_id WORKERS.gender_type_id%TYPE    := 1;
begin
    null;
end;
/